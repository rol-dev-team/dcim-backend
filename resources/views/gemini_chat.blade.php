<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Laravel Gemini Chat</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .response-container {
            margin-top: 20px;
            border: 1px solid #ccc;
            padding: 15px;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h1>Interact with Gemini</h1>

    <form id="geminiForm">
        @csrf
        <div class="mb-3">
            <label for="message" class="form-label">Your Prompt:</label>
            <textarea class="form-control" id="message" name="message" rows="3" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Send to Gemini</button>
    </form>

    <div id="responseContainer" class="response-container mt-3" style="display: none;">
        <h2>Gemini's Response:</h2>
        <pre id="geminiResponse"></pre>
    </div>

    <div id="errorContainer" class="alert alert-danger mt-3" style="display: none;"></div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById('geminiForm').addEventListener('submit', function(event) {
        event.preventDefault();

        const form = this;
        const formData = new FormData(form);

        fetch('{{ route('gemini.chat.send') }}', {
            method: 'POST',
            body: formData,
            headers: {
                'X-Requested-With': 'XMLHttpRequest' // To indicate an AJAX request
            }
        })
            .then(response => response.json())
            .then(data => {
                if (data.response) {
                    document.getElementById('geminiResponse').textContent = data.response;
                    document.getElementById('responseContainer').style.display = 'block';
                    document.getElementById('errorContainer').style.display = 'none';
                } else if (data.error) {
                    document.getElementById('errorContainer').textContent = data.error;
                    document.getElementById('errorContainer').style.display = 'block';
                    document.getElementById('responseContainer').style.display = 'none';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('errorContainer').textContent = 'An unexpected error occurred.';
                document.getElementById('errorContainer').style.display = 'block';
                document.getElementById('responseContainer').style.display = 'none';
            });
    });
</script>
</body>
</html>
