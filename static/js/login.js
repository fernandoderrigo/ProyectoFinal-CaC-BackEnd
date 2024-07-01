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
        const errorMessage = document.getElementById('errorMessage');
        if (data.success) {
            window.location.href = '/usuario';
        } else {
            errorMessage.textContent = 'Error en correo o contraseña';
            errorMessage.style.display = 'block';
        }
    })
    .catch(error => {
        console.error('Error:', error);
        const errorMessage = document.getElementById('errorMessage');
        errorMessage.textContent = 'Ocurrió un error. Por favor, inténtelo de nuevo más tarde.';
        errorMessage.style.display = 'block';
    });
});