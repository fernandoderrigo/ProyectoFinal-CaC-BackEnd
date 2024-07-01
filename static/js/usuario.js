document.addEventListener('DOMContentLoaded', function() {
  const perfilForm = document.getElementById('perfilForm');
  const nameInput = document.getElementById('name');
  const lastnameInput = document.getElementById('lastname');
  const emailInput = document.getElementById('email');
  const passwordInput = document.getElementById('password');
  const deleteAccountButton = document.querySelector('.delete-account');

  perfilForm.addEventListener('submit', async function(event) {
      event.preventDefault(); // Evitar envío del formulario por defecto

      if (!validateForm()) {
          return; // Detener el envío si la validación falla
      }

      try {
          const response = await fetch(`/api/usuarios/${userId}`, {
              method: 'PUT',
              headers: {
                  'Content-Type': 'application/json'
              },
              body: JSON.stringify({
                  nombre: nameInput.value,
                  apellido: lastnameInput.value,
                  mail: emailInput.value,
                  password: passwordInput.value
              })
          });

          if (!response.ok) {
              throw new Error('Error al actualizar perfil');
          }

          alert('Perfil actualizado correctamente');
          // Aquí podrías redirigir o mostrar un mensaje de éxito
      } catch (error) {
          alert(error.message);
      }
  });

  deleteAccountButton.addEventListener('click', async function() {
      if (confirm('¿Está seguro de eliminar su cuenta?')) {
          try {
              const response = await fetch(`/api/usuarios/${userId}`, {
                  method: 'DELETE'
              });

              if (!response.ok) {
                  throw new Error('Error al eliminar cuenta');
              }

              alert('Su cuenta ha sido borrada correctamente');
              window.location.href = '/usuario'; // Redirige al login después de eliminar la cuenta
          } catch (error) {
              alert(error.message);
          }
      } else {
          console.log('Operación cancelada.');
      }
  });

  function validateForm() {
      let isValid = true;

      // Implementa la validación según los campos de tu formulario
      // Ejemplo básico de validación de nombre
      if (nameInput.value.trim() === '') {
          isValid = false;
          setErrorFor(nameInput, 'El nombre no puede estar vacío');
      } else {
          setSuccessFor(nameInput);
      }

      // Añade más validaciones según sea necesario

      return isValid;
  }

  function setErrorFor(input, message) {
      const formControl = input.parentElement;
      const small = formControl.querySelector('small');

      // Mostrar mensaje de error y agregar clase de error
      small.innerText = message;
      formControl.className = 'form-control error';
  }

  function setSuccessFor(input) {
      const formControl = input.parentElement;
      formControl.className = 'form-control success';
  }
});
