*En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?*
 
En un double dispatch la información que aporta cada llamado es la relacionada a uno de los objetos variables. Por ejemplo, en el caso de la suma teníamos dos objetos variables el augend y el adder. El primer llamado aportaría la información del augend, mientras que el segundo aportaría la del adder. Tranquilamente podría ser al reves, pero decidimos hacerlo en este orden ya que tomamos la decisión de diseño de respetar el orden de los sumandos.
 
 
*Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?*
 
Nos parece mejor tener la lógica dentro de los métodos de clase del objeto. Esto se cumple para las clases concretas, ya que las abstractas no deben ser instanciadas, esto es debido a que representan más a una idea que a un objeto concreto. Para el caso donde necesitamos crear un objetos de diferentes formas y lugares, resulta conveniente subclasificar los diferentes casos y a través de una superclase abstracta, podemos saber en que lugar y forma (subclase) posicionarlo. Al intentar realizar lo anterior, nos encontramos que no podíamos reducir ningún if. Esto es porque, para que la superclase sepa donde instanciar a determinada forma de objeto, terminaba realizando la misma cantidad de ifs que la implantación dada. Ya que había un if por cada subclase. Luego de pensar por mucho tiempo (y romper unas cuantas neuronas) nos introdujeron a la idea del "Switch dinámico" y con esto la idea que habíamos propuesto terminaba de cerrar.
 
 
*Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?*
 
Principalmente en este ejercicio, como ya habían muchos métodos categorizados, para mantener la consistencia decidimos seguir los lineamientos provistos y reusar las categorías ya dadas. Así como también crear las categorías con el mismo nombre en las nuevas clases que fuimos creando. En lineas generales, el criterio que intentamos usar es buscar que el nombre de la categoría sea descriptivo de sus mensajes y que lo que comparten entre sí este expresado en el nombre de esta.
 
 
*Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?*
 
Este mensaje sirve para denotar que la responsabilidad de responder el mensaje en cuestión es de cada subclase. Esto ya que las subclases son casos particulares de la superclase (que es abstracta) y tienen un comportamiento diferente entre sí. Entonces de esta forma, la responsabilidad recae en las subclases, y cada una define su comportamiento de la manera correcta. Esto genera código más legible, organizado y escalable, ya que de no hacerlo así deberíamos utilizar en un único mensaje de la superclase, muchos ifs, que va en contra de los beneficios nombrados.
 
 
*¿Por qué está mal/qué problemas trae romper encapsulamiento?*
 
Los problemas que esto trae son, principalmente, reducir la escalabilidad y mezclar las responsabilidades. Esto es debido a que si dejamos que el usuario pueda modificar cosas dentro de una instancia, entonces si queremos cambiar algo de la implementación, el usuario va a tener problemas ya que tendría que cambiar la suya también. Por otro lado, permitis que objetos terminen con responsabilidades mezcladas. Por lo que algunos pueden terminar diciendole a otro objeto como hacer algo, que ellos no deberían saber, en vez de que hacer, que es la única información que tienen y necesitan.

