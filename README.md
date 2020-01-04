TP - ¿Qué me pongo?

Este TP lo realicé en grupo para la materia de Diseño de sistemas de 3er año de Ingeniería de Sistemas de la UTN FRBA.
El objetivo del TP era poder construir una aplicacion para gestionar los guardarropas y prendas de un usuario y poder sugerirle prendas en base al clima y gustos del usuario.
Fue concebida desde su dominio (Domain Driven Design).
A medida que iban avanzando los entregables, la complejidad del dominio iba aumentando (metodología iterativo incremental básicamente) con entregables cada 4 semanas (Scrum)
Utilizamos patrones de diseño como Builder (construcción de prendas), singleton en los repositorios, state, strategy, command (cosificar comportamiento) y creo que no me olvido de ninguno más.
También utilizamos el patrón arquitectural MVC a través del framework Spring. 
Por último, la idea era poder persistir y disponibilizar este proyecto en la web. Para esto utilizamos JPA Hibernate a través de annotations 
y Spark web Framework / Handlebars para la vista de usuario
La aplicacion fue deployada en Heroku y mi idea es poder dejarla interactiva para quien quiera probarla y revisarla.