document.getElementById('contactoForm').addEventListener('submit', function(event) {
    
    event.preventDefault(); //paremos las rotativas hasta validar

    //tomo el dato y le saco los espacios inicial y final, los guardo en 3 variables

    let nombre = document.getElementById('nombre').value.trim(); 
    let apellido = document.getElementById('apellido').value.trim();
    let correo = document.getElementById('email').value.trim();

    console.log(nombre);
    console.log(apellido);
    console.log(correo);

    let valid = true;

    // valido nombre y apellido que no tenga numeros
    if (nombre === '' || /[0-9]/.test(nombre)) {
        alert('Por favor, ingrese un nombre válido (sin números).');
        valid = false;
    }

    if (apellido === '' || /[0-9]/.test(apellido)) {
        alert('Por favor, ingrese un apellido válido (sin números).');
        valid = false;
    }

    // valido correo electrónico (también es validado por HTML en input.type email)
    if (correo === '') {
        alert('Por favor, ingrese su correo electrónico.');
        valid = false;
    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(correo)) {
        alert('Por favor, ingrese un correo electrónico válido.');
        valid = false;
    }

    //si todo esta ok envio el formulario y aviso.
    if (valid) {
        alert('Formulario enviado correctamente.');
        document.getElementById('contactoForm').submit();
    }
});