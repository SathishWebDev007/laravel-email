<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Jobs\SendEmailJob;

class EmailController extends Controller
{
    public function sendEmail(Request $request)
    {
        $request->validate([
            'recipient_email' => 'required|email',
            'subject' => 'required|string',
            'body' => 'required|string',
        ]);

        $emailId = DB::table('email_queue')->insertGetId([
            'recipient_email' => $request->recipient_email,
            'subject' => $request->subject,
            'body' => $request->body,
            'status' => 'pending',
            'attempts' => 0,
            'created_at' => now(),
            'updated_at' => now()
        ]);

        $emailRecord = DB::table('email_queue')->where('id', $emailId)->first();

        SendEmailJob::dispatch($emailRecord);

        return response()->json(['message' => 'Email queued successfully']);
    }

    public function emailStatus()
    {
        $success = DB::table('email_queue')->where('status', 'success')->count();
        $failed = DB::table('email_queue')->where('status', 'failed')->count();

        return response()->json([
            'successful_emails' => $success,
            'failed_emails' => $failed
        ]);
    }
}
