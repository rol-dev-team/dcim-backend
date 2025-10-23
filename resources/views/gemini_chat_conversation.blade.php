<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Laravel Gemini Chat Conversation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .chat-container {
            margin-top: 20px;
            border: 1px solid #ccc;
            padding: 15px;
            border-radius: 5px;
            background-color: #f9f9f9;
            height: 400px;
            overflow-y: auto;
        }
        .user-message {
            background-color: #e0f7fa;
            padding: 8px;
            border-radius: 5px;
            margin-bottom: 8px;
            text-align: right;
        }
        .ai-message {
            background-color: #f0f4c3;
            padding: 8px;
            border-radius: 5px;
            margin-bottom: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h1>Gemini Chat Conversation</h1>

    <div id="chatContainer" class="chat-container mb-3">
    </div>

    <form id="chatForm">
        @csrf
        <div class="input-group mb-3">
            <textarea class="form-control" id="message" name="message" rows="2" placeholder="Type your message..." required></textarea>
            <button type="submit" class="btn btn-primary">Send</button>
        </div>
    </form>

    <div id="errorContainer" class="alert alert-danger mt-3" style="display: none;"></div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const chatForm = document.getElementById('chatForm');
    const chatContainer = document.getElementById('chatContainer');
    const messageInput = document.getElementById('message');
    const errorContainer = document.getElementById('errorContainer');

    chatForm.addEventListener('submit', function(event) {
        event.preventDefault();

        const formData = new FormData(this);
        messageInput.value = ''; // Clear the input

        fetch('{{ route('gemini.chat.send.to.chat') }}', {
            method: 'POST',
            body: formData,
            headers: {
                'X-Requested-With': 'XMLHttpRequest'
            }
        })
            .then(response => response.json())
            .then(data => {
                if (data.response) {
                    appendMessage('user-message', formData.get('message'));
                    appendMessage('ai-message', data.response);
                    errorContainer.style.display = 'none';
                    chatContainer.scrollTop = chatContainer.scrollHeight; // Scroll to bottom
                } else if (data.error) {
                    errorContainer.textContent = data.error;
                    errorContainer.style.display = 'block';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                errorContainer.textContent = 'An unexpected error occurred.';
                errorContainer.style.display = 'block';
            });
    });

    function appendMessage(className, text) {
        const messageDiv = document.createElement('div');
        messageDiv.classList.add(className);
        messageDiv.textContent = text;
        chatContainer.appendChild(messageDiv);
    }
</script>
</body>
</html>
