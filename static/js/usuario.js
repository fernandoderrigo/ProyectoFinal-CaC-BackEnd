document.getElementById('editUserForm').addEventListener('submit', function(event) {
  event.preventDefault();

  let data = {
    nombre: this.nombre.value,
    apellido: this.apellido.value,
    mail: this.mail.value,
    password: this.password.value
  };

  fetch('/edit_user/', {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(data)
  })
  .then(response => {
    if (!response.ok) {
      throw new Error('Error al actualizar el perfil');
    }
    return response.json();
  })
  .then(data => {
    if (data.success) {
      alert('Datos actualizados correctamente');

      // Actualiza los campos del perfil con los nuevos valores
      document.getElementById('nombre').value = data.nombre;
      document.getElementById('apellido').value = data.apellido;
      document.getElementById('mail').value = data.mail;

    } else {
      console.log('Error: ' + data.message);
    }
  })
  .catch(error => console.error('Error:', error));
});

document.querySelector('.delete-account').addEventListener('click', function() {
  const confirmDelete = confirm('¿Estás seguro que deseas eliminar tu cuenta? Esta acción no se puede deshacer.');

  if (confirmDelete) {
    const password = prompt('Por favor ingresa tu contraseña para confirmar la eliminación de tu cuenta.');

    if (password) {
      const data = { password };

      fetch('/delete_account/', {
        method: 'DELETE',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
      })
      .then(response => response.json())
      .then(data => {
        if (data.success) {
          alert('Cuenta eliminada exitosamente');
          window.location.href = data.redirect_url; // Redirige al índice después de eliminar la cuenta
        } else {
          console.log('Error: ' + data.message);
          // Muestra el mensaje de error al usuario
          alert(data.message);
        }
      })
      .catch(error => console.error('Error:', error));
    }
  }
});
