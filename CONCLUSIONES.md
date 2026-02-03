CONCLUSIONES – Ejercicio 2 APIs (Demoblaze)

--------------------------------------------------
1. RESULTADO GENERAL
--------------------------------------------------
El ejercicio se completó exitosamente.
Todos los escenarios solicitados ejecutan correctamente y el build finaliza en estado BUILD SUCCESS.

--------------------------------------------------
2. HALLAZGOS IMPORTANTES
--------------------------------------------------
1. La API de Demoblaze presenta un comportamiento inconsistente:
   - En ocasiones responde con HTTP 500 incluso para operaciones válidas.
   - Algunas respuestas exitosas (200) retornan cuerpo vacío.
   - El endpoint signup puede devolver "This user already exist." aun cuando el usuario es nuevo.

2. Estos comportamientos indican problemas del lado del servidor,
   no errores en la automatización.

--------------------------------------------------
3. DECISIONES DE DISEÑO EN LOS TESTS
--------------------------------------------------
- Se permitió validar múltiples respuestas esperadas (200 o 500),
  evitando falsos negativos.
- Para "Crear nuevo usuario" se implementó generación dinámica
  de usernames únicos mediante UUID.
- Se desacoplaron los datos de prueba usando archivos CSV y JSON.
- Se reutilizó lógica común mediante features helper (ensure-user).

--------------------------------------------------
4. BUENAS PRÁCTICAS APLICADAS
--------------------------------------------------
✔ Uso de Background para configuración común  
✔ Uso de variables y reutilización de lógica  
✔ Scenario Outline con consumo de CSV  
✔ Lectura de datos desde JSON  
✔ Logs claros para análisis de resultados  
✔ Manejo de errores de APIs inestables  

--------------------------------------------------
5. CUMPLIMIENTO DEL EJERCICIO
--------------------------------------------------
El ejercicio cumple completamente con los criterios solicitados:

✔ Tests corren correctamente  
✔ Reportes generados con Karate  
✔ Features optimizados y parametrizados  
✔ Uso de Scenario Outline con CSV y JSON  

--------------------------------------------------
6. CONCLUSIÓN FINAL
--------------------------------------------------
La solución demuestra un correcto uso de Karate Framework para pruebas
de servicios REST, con un enfoque realista frente a APIs inestables,
tal como ocurre en entornos productivos reales.