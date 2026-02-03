README – Ejercicio 2 APIs (Demoblaze)

Proyecto:
Pruebas automatizadas de servicios REST para las APIs de Signup y Login de Demoblaze
utilizando Karate Framework y Maven.

URLs probadas:
- Signup: https://api.demoblaze.com/signup
- Login:  https://api.demoblaze.com/login

--------------------------------------------------
REQUISITOS PREVIOS
--------------------------------------------------
1. Java JDK 11 o superior instalado
2. Maven instalado y configurado en el PATH
3. Conexión a Internet

Para verificar:
- java -version
- mvn -version

--------------------------------------------------
ESTRUCTURA DEL PROYECTO
--------------------------------------------------
src/test/resources/
- features/
  - signup.feature
  - login.feature
  - _helpers/ensure-user.feature
- data/
  - signup_new.json
  - signup_existing.csv
  - login_valid.csv
  - login_negative.json

--------------------------------------------------
PASOS PARA EJECUTAR LAS PRUEBAS
--------------------------------------------------
1. Abrir una terminal en la raíz del proyecto (donde está el pom.xml)

2. Ejecutar el siguiente comando:

   mvn clean test

3. Esperar a que Maven ejecute todos los escenarios.

4. Verificar que el resultado final sea:

   BUILD SUCCESS

--------------------------------------------------
GENERACIÓN DE REPORTES
--------------------------------------------------
Al finalizar la ejecución, Karate genera automáticamente los reportes.

Ruta del reporte principal:
target/karate-reports/karate-summary.html

Para visualizarlo:
- Abrir el archivo karate-summary.html en cualquier navegador web

--------------------------------------------------
ESCENARIOS CUBIERTOS
--------------------------------------------------
1. Crear un nuevo usuario en signup (username único generado dinámicamente)
2. Intentar crear un usuario ya existente (desde CSV)
3. Login con usuario y password correctos (desde CSV)
4. Login con usuario o password incorrectos (desde JSON)

--------------------------------------------------
NOTAS IMPORTANTES
--------------------------------------------------
- La API de Demoblaze es inestable y en ocasiones responde con HTTP 500.
- Los tests están diseñados para manejar correctamente esta inestabilidad
  sin generar falsos negativos.
- El objetivo del ejercicio es validar entradas y capturar salidas,
  no corregir errores del backend.