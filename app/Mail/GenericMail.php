<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class GenericMail extends Mailable
{
    use Queueable, SerializesModels;

    public $subjectText;
    public $bodyText;

    public function __construct($subject, $body)
    {
        $this->subjectText = $subject;
        $this->bodyText = $body;
    }

    public function build()
    {
        return $this->subject($this->subjectText)
                    ->view('emails.generic')
                    ->with(['body' => $this->bodyText]);
    }
}

