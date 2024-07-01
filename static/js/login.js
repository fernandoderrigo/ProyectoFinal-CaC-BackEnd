document.getElementById('loginForm').addEventListener('submit', function (event) {
    event.preventDefault();

    const formData = new FormData(this);
    const data = Object.fromEntries(formData.entries());

    fetch('/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            window.location.href = '/usuario';
        } else {
            console.log('Login failed: ' + data.message);
            // Aquí puedes agregar un mensaje de error en la interfaz de usuario
        }
    })
    .catch(error => console.error('Error:', error));
});
