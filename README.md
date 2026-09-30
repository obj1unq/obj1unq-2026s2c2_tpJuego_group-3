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
- flecha ↑: mover hacía arriba.
- flecha ↓: mover hacía abajo.
- flecha ←: mover hacía la izquierda.
- flecha →: mover hacía la derecha.

- b: buscar ingrediente en el pastizal.
- t: toma mate y recarga vida.

- f: usar facón ?

### Primer nivel:
Jacinta tiene que recorrer el campo buscando los ingredientes necesarios para cocinar el locro. Sin embargo, debe tener cuidado: una yarará se encuentra entre los pastizales.

### Objetos con los que el personaje colisiona:
- Pastizal: surgen tres situaciones random:
    - La primera puede ser que el pastizal contenga alguno de los cuatro ingredientes recolectables necesarios para el locro, lo cual hace que se sumen al inventario.
    - La segunda puede ser que el pastizal esté vacío.
    - La tercera puede ser que entre el pastizal esté escondida la yarará (enemiga).

- Yarará[^2] (enemiga): se camufla entre los pastizales, es venenosa por lo que al colisionar con Jacinta le resta vida (otro efecto posible: emite una advertencia o la empuja un casillero hacia atrás).

### Segundo nivel:
Jacinta tiene que vencer al lobizón y esquivar al pampero para llegar al pueblo.

### Objetos con los que el personaje colisiona:
- Lobizón[^3] (enemigo): al colisionar con Jacinta le resta una cantidad considerable de vida. (esta situación requiere un método ya sea de combate o ahuyento por ej. jacinta puede usar un facón para defenserse).
- Pampero[^4] (obstáculo): al colisionar con Jacinta hace que se maree y se inviertan temporalmente los controles de movimiento (la tecla de arriba va hacia abajo y viceversa, la tecla izquierda va hacia derecha y viceversa).

### Tercer nivel:
Jacinta tiene que atravesar la pista de baile esquivando a las parejas que bailan chacarera. Tiene que llegar hasta la cocina para llevar el locro. Si consigue llegar, gana.

### Objetos con los que el personaje colisiona:
- Parejas de baile (obstáculo): se mueven en patrones fijos (ver como hacemos para que simule el ritmo de baile). Si colisionan con ella, le hacen tirar parte del locro (o quizas es mejor que la demoren haciéndola retroceder).

## Otros
- Programación con Objetos I - Universidad Nacional de Quilmes
- Versión de wollok: 4.0.0
- Una vez terminado, no tenemos problemas en que el repositorio sea público / queremos manternerlo privado

## Notas

[^1]: china, o en menor medida, guaina, se le llama a la esposa del gaucho, figura central y a menudo silenciada de la vida rural rioplatense.

[^2]: la yarará es una especie de serpiente endémica de Argentina.

[^3]: figura mítica del folklore argentino, vaga por los campos y cementerios, asustando a los perros y alimentándose de carroña.

[^4]: el pampero es una ráfaga de viento helado.