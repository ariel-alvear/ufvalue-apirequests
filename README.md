# README

Las consulstas de uf se hacen en localhost:3000/uf/<fecha que desees buscar>
Se debe agregar en key = X-CLIENT y en Value el nombre del cliente 

El nombre del cliente siempre se guardará en minúsculas. 

Para consultar las consultas que ha hecho el cliente debe ir a localhost:3000/cliente/<nombre de cliente>

Esta búsqueda transforma cualquier mayúscula a minúscula para que coincida con el nombre guardado.

El nombre del cliente debe ser exacto al que se ingresó en el Value de X-CLIENT.

Cuando el cliente revisa sus consultas primero aparece la cantidad de consultas que ha hecho y luego el detalle de cada una.