#import "@preview/versatile-apa:7.2.0": versatile-apa as apa-style

#set document(
  title: [EA3. Incorporando UI y BD],
  author: "Christian Alexander Velasco Narváez",
)

#set text(lang: "es")

// Fixed so the date does not depend on Nix's SOURCE_DATE_EPOCH (1980-01-01).
#let due-date = [20 de noviembre de 2026]

#show: apa-style.with(
  font-size: 12pt,
)

// APA 7th edition student title page, adapted with the institutional logo.
#let title-page(
  title: none,
  logo: none,
  student: none,
  program: none,
  course: none,
  instructor: none,
  due-date: none,
) = {
  set align(center)
  set par(first-line-indent: 0pt)

  v(0.35in)
  image(logo, width: 2.6in)
  v(1.15in)

  text(size: 12pt, weight: "bold", title)
  v(0.5em)

  student
  linebreak()
  program
  parbreak()

  course
  parbreak()

  instructor
  parbreak()

  due-date

  pagebreak(weak: true)
}

#title-page(
  title: [EA3. Incorporando UI y BD],
  logo: "../assets/iudigital_logo.png",
  student: [ESTUDIANTE: Christian Alexander Velasco Narváez],
  program: [PROGRAMA: INGENIERÍA DE SOFTWARE Y DATOS],
  course: [CURSO: \ PROGRAMACIÓN ORIENTADA A OBJETOS II],
  instructor: [DOCENTE: \ JORGE ARMANDO JULIO CRUZ],
  due-date: due-date,
)

#std.title()

= Introducción

Para esta actividad surge la oportunidad de explorar el paquete nativo Swing
para la creación de interfaces gráficas y el paquete para la conexión con bases
de datos relacionales JDBC (Java Database Connectivity).

En este documento se encuentra el desarrollo de la evidencia de aprendizaje.
Para el código usé el IDE NetBeans, ya que me permite usar un editor visual para
la creación de la interfaz. Como empaquetador usé Maven, que facilita la gestión
de dependencias; en este caso, el driver para MySQL, que es el motor de bases de
datos que decidí usar.

El proyecto lo dividí en dos clases principales. `ConnectionTesterUi` contiene el
código generado por el editor visual y los eventos editados por mí a mano, sin el
uso de IA. `DatabaseConnector` usa JDBC para realizar la conexión a la base de
datos. `App.java` simplemente ejecuta el método `main` de la clase
`ConnectionTesterUi`.

Decidí añadir una validación que desactiva el botón de conexión si no se han
llenado los campos, y una prueba de consulta a una tabla de la base de datos. El
script para la creación de la base de datos usada se incluye junto con el
proyecto, para facilitar la ejecución exitosa del mismo.

#pagebreak()

= Objetivos

La presente evidencia de aprendizaje tiene como propósito desarrollar una
aplicación de escritorio en Java que integre una interfaz gráfica con el acceso a
una base de datos relacional. Para ello se plantean los siguientes objetivos:

- Crear una aplicación con interfaz gráfica que permita probar la conexión con
  una base de datos MySQL a través de un formulario con la URL de la conexión,
  el nombre de usuario y la contraseña.
- Usar Swing para la interfaz de usuario y JDBC para la conexión con la base de
  datos.
- Crear una consola que muestre los resultados de la conexión en los estados
  Exitoso o Error, junto con la ejecución de una consulta directa a la base de
  datos.

#pagebreak()

= Desarrollo

== Código fuente

El código fuente del proyecto se encuentra disponible públicamente en el
siguiente repositorio de GitHub:
#link("https://github.com/iudigital-projects/DatabaseConnector")[https://github.com/iudigital-projects/DatabaseConnector].

Decidí no copiar y pegar el código en este documento, ya que resulta más cómodo
y fácil leerlo directamente en GitHub. Adicionalmente, el proyecto se entrega en
un archivo ZIP generado desde el repositorio.

== Script de base de datos

El proyecto incluye el archivo `database.sql`, disponible en el repositorio de
GitHub:
#link("https://github.com/iudigital-projects/DatabaseConnector/blob/main/database.sql")[https://github.com/iudigital-projects/DatabaseConnector/blob/main/database.sql].
Este script crea la base de datos
`jardineria`, la tabla `cliente` con las columnas `ID_cliente`,
`nombre_cliente` y `pais`, y agrega registros de ejemplo para que la consulta
`SELECT * FROM cliente` que ejecuta la aplicación tenga resultados.

Para crear y llenar la base de datos desde la terminal, se ejecuta el siguiente
comando desde la raíz del proyecto:

```bash
mysql -u root -p < code/DatabaseConnector/database.sql
```

El script también puede abrirse y ejecutarse desde cualquier cliente de MySQL,
como MySQL Workbench o DBeaver. Una vez creada la base de datos, la aplicación
se conecta con la URL por defecto
`jdbc:mysql://localhost:3306/jardineria`.

== Estructura del proyecto

La aplicación se organiza en tres clases. `App.java` contiene el punto de entrada
y se encarga de iniciar la interfaz; `ConnectionTesterUi` extiende `JFrame` y
reúne los componentes Swing del formulario, junto con la validación de los
campos y el manejo de los eventos; y `DatabaseConnector` encapsula la lógica de
conexión a la base de datos mediante la API JDBC.

La interfaz está compuesta por un campo para la URL de conexión, un campo para
el nombre de usuario, un campo de contraseña, un botón `Conectar` y un área de
texto dentro de un `JScrollPane` que cumple la función de consola. El botón
permanece deshabilitado hasta que los tres campos contienen información. Al
presionarlo, `DatabaseConnector` intenta abrir la conexión con
`DriverManager.getConnection()`; si el intento es exitoso, se ejecuta la consulta
`SELECT * FROM cliente` y se muestran los resultados en la consola. Los errores
de JDBC se capturan con `try-catch` y se presentan como mensajes legibles para el
usuario.

#pagebreak()

== Evidencia de ejecución

Primero ejecuté el comando para compilar, el cual instala las dependencias,
compila y, adicionalmente, ejecuta el código.

#figure(
  image("../assets/evidencias/evidencia_1.png", width: 100%),
  caption: [Ejecución del comando de compilación con Maven.],
  placement: none,
)

El código se ejecuta correctamente y muestra la ventana de la aplicación con la
interfaz gráfica: tres campos por llenar y una URL con un valor por defecto que
apunta a la base de datos `jardineria`, la cual escogí como ejemplo y para la
cual se incluye el script de creación.

#figure(
  image("../assets/evidencias/evidencia_2.png", width: 100%),
  caption: [Ventana principal de la aplicación con la URL de conexión por defecto.],
  placement: none,
)

#pagebreak()

Al llenar los datos se activa el botón `Conectar`.

#figure(
  image("../assets/evidencias/evidencia_3.png", width: 100%),
  caption: [Activación del botón Conectar al completar los campos.],
  placement: none,
)

Una ejecución exitosa muestra un mensaje en verde en el `JScrollPane` al que
decidí llamar consola.

#figure(
  image("../assets/evidencias/evidencia_4.png", width: 100%),
  caption: [Mensaje de conexión exitosa y resultado de la consulta a la tabla cliente.],
  placement: none,
)

#pagebreak()

Una ejecución de error muestra el mensaje en rojo de forma legible.

#figure(
  image("../assets/evidencias/evidencia_5.png", width: 100%),
  caption: [Mensaje de error de conexión con el detalle técnico de JDBC.],
  placement: none,
)

#pagebreak()

= Conclusiones

El lenguaje de programación Java nos permite acceder a herramientas para la
creación de interfaces, como Swing, sin necesidad de librerías externas; esto
facilita la creación de aplicaciones de forma rápida y sencilla. A la vez,
contamos con un paquete para acceder a bases de datos relacionales, JDBC, que
también es muy fácil de entender y de usar.

Al ser un lenguaje fuertemente tipado, al escribir código se pueden observar los
errores potenciales que se pueden presentar; esto hace que pensemos en un modelo
mental de programación bastante estricto que nos permite prevenir bugs o errores
durante el proceso de ejecución. Al usar JDBC, por ejemplo, es obligatorio que,
para abrir una conexión, se realice la gestión de errores con try-catch. Las API
de estos paquetes tienen una documentación muy completa y fácil de entender;
aunque pueda parecer un tanto verboso usarlas, los beneficios de ser tan
estrictos compensan cuando se obtiene un resultado bastante sólido.

#pagebreak()

#bibliography(
  "refs.yml",
  full: true,
  title: [Referencias],
)

#pagebreak()

= Nota sobre el documento

Este documento se elaboró con Typst #cite(<typst>), un sistema de composición
tipográfica basado en marcado, y con la plantilla versatile-apa 7.2.0
#cite(<ovando2026versatileapa>), que implementa el estilo APA de séptima
edición. El entorno de desarrollo y la compilación se gestionaron con Nix.
