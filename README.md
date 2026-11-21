# DatabaseConnector

Una app sencilla para probar la conexión a una base de datos
usando swing para la interfaz de usuario y jdbc.

**Autor**: Christian Alexander Velasco Narváez

## Comandos

Este proyecto se creo usando maven y Netbeans.

Si esta usando terminal puede ejecutar los siguientes comandos.

#### Compilar y ejecutar
`mvn compile exec:java`
#### Solo ejecutar
`mvn exec:java`

## Requisitos

- JDK 21 o superior
- Maven 3.8 o superior
- MySQL 8 o superior

Verifique las versiones instaladas:

```bash
java -version
mvn -version
mysql --version
```

## Crear y llenar la base de datos

El proyecto incluye el script `database.sql`, que crea la base de datos
`jardineria`, la tabla `cliente` y agrega datos de ejemplo.

Desde la raíz del proyecto, ejecute:

```bash
mysql -u root -p < code/DatabaseConnector/database.sql
```

También puede abrir el archivo `database.sql` en cualquier cliente de MySQL
(MySQL Workbench, DBeaver, phpMyAdmin, etc.) y ejecutarlo allí.

El script crea la base de datos `jardineria` y la tabla `cliente` con las
columnas `ID_cliente`, `nombre_cliente` y `pais`.

## Ejecutar la aplicación

1. Ingrese al directorio del proyecto:

   ```bash
   cd code/DatabaseConnector
   ```

2. Compile y ejecute:

   ```bash
   mvn compile exec:java
   ```

   Si ya compiló antes, puede ejecutar solo:

   ```bash
   mvn exec:java
   ```

3. En la ventana de la aplicación complete los campos:

   - **Url**: `jdbc:mysql://localhost:3306/jardineria`
   - **Nombre de usuario**: su usuario de MySQL (por ejemplo, `root`)
   - **Contraseña**: su contraseña de MySQL

4. Presione **Conectar**. Si la conexión es exitosa, la consola mostrará
   el resultado de la consulta `SELECT * FROM cliente`.

## Ejecutar en otra máquina

1. Instale JDK 21, Maven y MySQL.
2. Clone o copie el proyecto completo.
3. Ejecute el script de base de datos como se indica arriba.
4. Ajuste el campo **Url** si su MySQL usa otro host o puerto, por ejemplo:
   `jdbc:mysql://192.168.1.100:3306/jardineria`.
5. Ejecute `mvn compile exec:java` dentro de la carpeta del proyecto.

Maven descargará automáticamente el conector de MySQL declarado en el
`pom.xml`, por lo que no es necesario instalar dependencias adicionales.
