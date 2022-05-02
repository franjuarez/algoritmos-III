## Francisco Juárez (107748) y Juan Pablo Aschieri (108000)

*En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon?*

La abstracción que faltaba principalmente era la de calcular una diferencia de tiempo tras realizar una determinada operación. En una primera instancia creamos solo eso, un mensaje que calculaba la diferencia de tiempo, pero luego para reducir un poco más de código repetido nos abstrajimos más todavía. Por esta razón, creamos un método que además de calcular la diferencia de tiempo se fija si esa diferencia de tiempo es menor a la deseada.


*¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?*

Primero y principal, los objetos son los responsables de representar entes específicos de la realidad, y de la mano de la idea de prototipado, definen relaciones de parentesco entre sí. Sin embargo, en las últimas clases, con la forma de organizar conocimiento de platón, surgió la idea de clase. Si bien no representa entes específicos de la realidad, representa conceptos e ideas que podríamos considerar como entes genéricos de la misma. Mientras que la representación de entes específicos se deja en mano de un tipo de objeto llamado instancia, que representa un caso particular de una clase.


*¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?*

Sacar código repetido para generar una abstracción se relaciona con la idea de teoría de Naur, ya que los programadores que poseen la teoría, generan un modelo que representa la realidad en base a las abstracciones. Por lo que, al crear una nueva abstracción, estarían enriqueciendo su modelo. Además, aquellos desarrolladores que posean la teoría serían mucho más capaces de darse cuenta del código repetido a favor de, ya sea, una abstracción presente o una nueva.
