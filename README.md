![Logo](https://github.com/fernandoderrigo/ProyectoFinal-CaC-BackEnd/blob/main/static/assets/index/logo/logo_oscuro_7_11zon.webp)


🍫 Chocoarte Delicioso 🍫

Logo de Chocoarte Delicioso

¡Bienvenido a Chocoarte Delicioso! Esta es una tienda en línea especializada en la venta de bombones, chocolates, figuras de azúcar y otros productos de confitería de alta calidad.
📜 Descripción

Chocoarte Delicioso es una plataforma web diseñada para ofrecer una experiencia de compra fácil y agradable para los amantes del chocolate y la confitería. Los usuarios pueden explorar nuestro catálogo, registrarse, iniciar sesión y gestionar sus perfiles de usuario, además de realizar compras de sus productos favoritos.
🌟 Características

En Chocoarte Delicioso, puedes encontrar las siguientes páginas:

    🏠 Página de Inicio: La página principal con una introducción a nuestros productos y promociones.
    🍬 Página de Productos: Una lista detallada de todos nuestros productos, incluyendo bombones, chocolates y figuras de azúcar.
    📖 Página Sobre Nosotros: Información sobre la historia de nuestra empresa y nuestro equipo.
    📞 Página de Contacto: Formulario de contacto para que los usuarios puedan comunicarse con nosotros.
    🔐 Página de Login: Para que los usuarios registrados puedan iniciar sesión en sus cuentas.
    📝 Página de Registro: Para que nuevos usuarios puedan crear una cuenta.
    👤 Página de Usuario: Donde los usuarios pueden ver y editar su información personal y preferencias.

Además, el proyecto incluye la creación y administración de una base de datos para manejar toda la información de los usuarios y productos.
💻 Tecnologías Utilizadas

    Frontend: HTML, CSS, JavaScript
    Backend: Flask (Python)
    Base de Datos: MySQL
    Control de Versiones: Git

⚙️ Configuración del Proyecto

Clona el repositorio:

git clone https://github.com/tu_usuario/ChocoarteDelicioso.git
cd ChocoarteDelicioso

Crea y activa un entorno virtual:

python -m venv env
source env/bin/activate  # En Windows usa `env\Scripts\activate`

Instala las dependencias:

pip install -r requirements.txt

Configura la base de datos:

    Crea una base de datos en MySQL llamada chocoarte.
    Importa las tablas y datos iniciales utilizando el archivo SQL proporcionado.

Configura las variables de entorno necesarias:

export FLASK_APP=app.py
export FLASK_ENV=development

Inicia la aplicación:

flask run

📂 Estructura del Proyecto

    app.py: Archivo principal de la aplicación Flask.
    templates/: Directorio que contiene las plantillas HTML.
    static/: Directorio para archivos estáticos como CSS, JavaScript, e imágenes.
    routes/: Directorio con los archivos de rutas para las diferentes funcionalidades.
    models/: Directorio con los modelos de la base de datos.
    requirements.txt: Archivo con las dependencias del proyecto.
    database/: Directorio con scripts SQL para la creación y administración de la base de datos.

🤝 Contribuciones

¡Las contribuciones son bienvenidas! Si deseas contribuir a este proyecto, por favor sigue estos pasos:

    Haz un fork del repositorio.
    Crea una rama con tu nueva funcionalidad o corrección de errores: git checkout -b mi-nueva-funcionalidad.
    Realiza tus cambios y haz commits: git commit -am 'Añadí una nueva funcionalidad'.
    Empuja tus cambios a la rama: git push origin mi-nueva-funcionalidad.
    Abre un Pull Request.

¡Gracias por visitar Chocoarte Delicioso! 🍫 Esperamos que disfrutes de nuestros productos tanto como nosotros disfrutamos creándolos para ti.
