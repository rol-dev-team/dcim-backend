<?php

use Gemini\Laravel\Facades\Gemini; // If using google-gemini-php/laravel

class GeminiService
{
    public function generateText(string $prompt)
    {
        $result = Gemini::geminiPro()->generateContent($prompt);
        return $result->text();
    }

    // Example for chat interaction
    public function startChat(array $history = [])
    {
        return Gemini::chat()->startChat(history: $history);
    }

    public function sendMessage($chat, string $message)
    {
        $response = $chat->sendMessage($message);
        return $response->text();
    }
}
