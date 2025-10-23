<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Events\CommentEvent;

class TestController extends Controller
{
    public function triggerEvent()
    {
        // $comment = "Hello from backend enven!";
        $comment = "Hello from md ashikur Rahmnan!";
        event(new CommentEvent($comment));

        return response()->json(['message' => 'Event sent to Ably!']);
    }
}