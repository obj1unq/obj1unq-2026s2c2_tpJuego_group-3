# Nombre del juego ( "La Odisea de Jacinta”? )
Doña Jacinta es una chinita[^1] de la pampa bonaerense que tiene la tarea de cocinar el locro para la peña patria de su pueblo. 

## DEMO
Para el nivel 1 vamos a implementar tres arbustos, uno con un ingrediente necesario para el locro, otro con una yarará que hace daño al personaje, otro vacío. 
El personaje comienza con un slot vacío (sin ingredientes). A su vez también está equipada con un unico mate que le recarga la vida.
Hay una meta de entrada/salida.

## Equipo de desarrollo
- Arenas, Valentina.
- Paz Kotek, Sofía.
- Tonini, Julieta.

## Capturas
(agregar)

## Reglas de Juego / Instrucciones
### Teclas:
- b: buscar ingrediente en el pastizal.
- t: toma mate y recarga vida.

### Primer nivel:
Jacinta tiene que recorrer el campo buscando los ingredientes necesarios para cocinar el locro. Sin embargo, debe tener cuidado: una yarará** se encuentra entre los pastizales.

### Objetos con los que el personaje colisiona:
- Pastizal: surgen tres situaciones random:
    - La primera puede ser que el pastizal contenga alguno de los cuatro ingredientes recolectables necesarios para el locro, lo cual hace que se sumen al inventario.
    - La segunda puede ser que el pastizal esté vacío.
    - La tercera puede ser que entre el pastizal esté escondida la yarará (enemiga).

- Yarará[^2] (enemiga): se camufla entre los pastizales, es venenosa por lo que al colisionar con Jacinta le resta vida (otro efecto posible: emite una advertencia o la empuja un casillero hacia atrás).

### Segundo nivel:

### Objetos con los que el personaje colisiona:
- Lobizón (enemigo): .
- Pampero[^3] (obstáculo): al colisionar con Jacinta hace que se maree y se inviertan temporalmente los controles de movimiento (la tecla de arriba va hacia abajo y viceversa, la tecla izquierda va hacia derecha y viceversa).

### Tercer nivel:

### Objetos con los que el personaje colisiona:
- Parejas de baile (obstáculo): .

## Otros
- Programación con Objetos I - Universidad Nacional de Quilmes
- Versión de wollok: 4.0.0
- Una vez terminado, no tenemos problemas en que el repositorio sea público / queremos manternerlo privado

## Notas

[^1]: china, o en menor medida, guaina, se le llama a la esposa del gaucho, figura central y a menudo silenciada de la vida rural rioplatense.

[^2]: la yarará es una especie de serpiente endémica de Argentina.

[^3]: el pampero es una ráfaga de viento helado.