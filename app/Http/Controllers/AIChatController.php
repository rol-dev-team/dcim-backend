<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Gemini\Laravel\Facades\Gemini;
use Illuminate\Support\Facades\Log;

// Assuming you're using google-gemini-php/laravel

class AIChatController extends Controller
{
    public function index()
    {
        return view('gemini_chat'); // Create a Blade view for Gemini interaction
    }

    /**
     * Sends a hardcoded message to the Gemini Pro model (non-chat).
     *
     * @param Request $request The incoming request (currently unused in this example).
     * @return \Illuminate\Http\JsonResponse
     */
    public function sendMessage(Request $request)
    {
        // In a real application, you'd likely get the user's message from the request:
        // $userMessage = $request->input('message', 'Write a short greeting.');
        // For this example, we stick to the original hardcoded prompt to fix the error.
        $prompt = 'Write a short greeting.';

        try {
            // --- Simplified Call ---
            // Pass the prompt string directly to generateContent for simple text.
            // This is less prone to structure errors that caused the UnhandledMatchError.
            $result = Gemini::geminiPro()->generateContent($prompt);

            // Extract the text response.
            $response = $result->text();

            // Return the response as JSON.
            return response()->json(['response' => $response]);

        } catch (\Gemini\Exceptions\GeminiException $e) {
            // Catch specific exceptions from the Gemini library if available/needed.
            // The context() method might provide more details from the API error.
            $context = method_exists($e, 'context') ? $e->context() : [];
            Log::error('Gemini API Error: ' . $e->getMessage(), ['context' => $context]);
            return response()->json(['error' => 'Gemini API Error: ' . $e->getMessage()], 500);

        } catch (\Exception $e) {
            // Catch any other exceptions.

            // Specifically check if it's the original error to give targeted feedback.
            if ($e instanceof \UnhandledMatchError && str_contains($e->getFile(), 'google-gemini-php')) {
                Log::error('Gemini Client Error (UnhandledMatchError): Likely caused by unexpected response structure or incorrect input formatting. Message: ' . $e->getMessage(), [
                    'file' => $e->getFile(),
                    'line' => $e->getLine()
                ]);
                return response()->json(['error' => 'Internal error processing Gemini response. Please check input format or library compatibility.'], 500);
            }

            // Log and return a generic error for other unexpected issues.
            Log::error('Generic Error during Gemini call: ' . $e->getMessage(), [
                'exception_type' => get_class($e),
                'file' => $e->getFile(),
                'line' => $e->getLine(),
            ]);
            return response()->json(['error' => 'Failed to get response from Gemini due to an unexpected error.'], 500);
        }
    }

    public function startChat()
    {
        $chat = Gemini::chat()->startChat();
        session(['gemini_chat_id' => $chat->id()]); // Store chat ID in session
        return view('gemini_chat_conversation'); // View for ongoing conversation
    }

    public function sendMessageToChat(Request $request)
    {
        $message = $request->input('message');
        $chatId = session('gemini_chat_id');

        if (!$chatId) {
            return response()->json(['error' => 'No active chat session'], 400);
        }

        try {
            $chat = Gemini::chat($chatId);
            $response = $chat->sendMessage($message)->text();
            return response()->json(['response' => $response]);
        } catch (\Exception $e) {
            \Log::error('Gemini Chat API Error: ' . $e->getMessage());
            return response()->json(['error' => 'Failed to send message to chat'], 500);
        }
    }
}
