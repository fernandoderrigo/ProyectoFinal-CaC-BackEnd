document.addEventListener('DOMContentLoaded', function() {
    const registerForm = document.getElementById('registerForm');
  
    registerForm.addEventListener('submit', async function(event) {
        event.preventDefault(); // Evita el envío del formulario por defecto
  
        if (!validarFormulario()) {
            return; // Detiene el envío si la validación falla
        }
  
        try {
            const formData = new FormData(registerForm);
            const response = await fetch('/register/', {
                method: 'POST',
                body: formData
            });
  
            // Verifica el estado de la respuesta
            if (!response.ok) {
                throw new Error('Error en la respuesta del servidor');
            }
  
            const resultado = await response.json();
  
            // Verifica el contenido de la respuesta JSON
            console.log('Resultado del servidor:', resultado);
  
            if (resultado.success) {
                alert('Registro exitoso');
                window.location.href = resultado.redirect_url; // Redirigir a la URL proporcionada por el backend
            } else {
                alert('Error: ' + resultado.message);
            }
        } catch (error) {
            console.error('Error:', error);
            alert('Error en la solicitud. Inténtalo de nuevo más tarde.');
        }
    });
  
    function validarFormulario() {
  
        return true; // Retorna false si la validación falla
    }
  });
  