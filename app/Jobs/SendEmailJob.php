<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\DB;
use App\Mail\GenericMail;

class SendEmailJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $emailRecord;
    public $tries = 2;

    public function __construct($emailRecord)
    {
        $this->emailRecord = $emailRecord;
    }

    public function handle()
    {
        try {
            Mail::to($this->emailRecord->recipient_email)
                ->send(new GenericMail($this->emailRecord->subject, $this->emailRecord->body));

            DB::table('email_queue')->where('id', $this->emailRecord->id)
                ->update(['status' => 'success']);
        } catch (\Exception $e) {
            $attempts = $this->emailRecord->attempts + 1;
            $status = ($attempts >= 2) ? 'failed' : 'pending';

            DB::table('email_queue')->where('id', $this->emailRecord->id)
                ->update(['attempts' => $attempts, 'status' => $status]);

            throw $e;
        }
    }
}

