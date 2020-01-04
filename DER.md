@startuml

entity guardarropas  {
  (PK) guardarropa_id
  --
  nombre
  limite_prendas
}

entity atuendos_estados  {
  atuendo_id
  estado
  calificacion
  fecha_actualizacion
}

entity prendas {
(PK) prenda_id
--
  nombre
  material
  trama
  impermeable
  disponibilidad
  rojo_primario
  verde_primario
  azul_primario
  rojo_secundario
  verde_secundario
  azul_secundario
--
  (FK) tipo_prenda_id
  (FK) guardarropa_id
}

entity materiales_tipos_prendas {
  (PK) tipo_prenda_id
  --
       material
  }


entity usuarios {
(PK) usuario_id
--
  nombre
  apellido
  email
  numero_celular
  contrasenia
  tiempo_anticipacion

}
entity usuarios_guardarropas {
(PK) id_usuario
(PK) id_guardarropa

}

entity eventos {
  (PK) id_evento
  --
  (FK) id_calendario
}

entity tipo_prendas {
(PK) id_tipoDePrenda
  --
  nombre_tipo_prenda
  temperatura_max
  temperatura_min
  categoria
}

entity atuendos {
(PK) id_atuendo
--
      nombre
      prenda_inferior_id
      calzado_id
      cuello_id
      manos_id
      accesorio_id
      estado
      calificacion
      fecha_actualizacion
}

entity prendas_atuendos {
  (PK) atuendo_id
  (PK) prenda_superior_id
}

guardarropas ||--o{ prendas
guardarropas ||--|{ usuarios_guardarropas
usuarios ||--|{ usuarios_guardarropas
atuendos ||--|{ prendas_atuendos
prendas ||--o{ prendas_atuendos
usuarios ||--|{ eventos
atuendos ||--|{ atuendos_estados
tipo_prendas |o--|{ materiales_tipos_prendas
prendas }o--|| tipo_prendas

atuendos |o--|| eventos


@enduml