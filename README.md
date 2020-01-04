TP - ¿Qué me pongo?

El TP lo realicé en grupo para la materia de Diseño de sistemas de 3er año de Ingeniería de Sistemas de la UTN FRBA.

El objetivo era poder construir una aplicacion para gestionar los guardarropas y prendas de un usuario y poder sugerirle prendas en base al clima (conexión a una API de DarkSky o Accuweather) y gustos del usuario.

La aplicación fue pensada desde su dominio es decir utilizando las prácticas de DDD (Domain Driven Design).
A medida que iban avanzando los entregables, la complejidad del dominio iba aumentando (metodología iterativo incremental básicamente) con entregables cada 4 semanas utlizamos metodología ágil como Scrum y Slack para comunicarnos.

Utilizamos patrones de diseño como Builder (construcción de prendas), singleton en los repositorios, state, strategy, command (cosificar comportamiento) ,etc. También utilizamos el patrón arquitectural MVC a través del framework Spring.

Por último, la idea era poder persistir y disponibilizar este proyecto en la Web. Para esto utilizamos JPA Hibernate a través de annotations para la persistencia en una base de datos MySQL hosteada en AWS y Spark web Framework / Handlebars para la vista de usuario.

La aplicacion fue deployada en Heroku y mi idea es poder dejarla interactiva para quien quiera probarla y revisarla, ya que al momento no cuenta con la creación de usuarios. 
