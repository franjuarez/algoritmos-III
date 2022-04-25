!classDefinition: #AvispaLara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaLara class' category: 'AvispasYAbejasParte2'!
AvispaLara class
	instanceVariableNames: ''!

!AvispaLara class methodsFor: 'reproduccion' stamp: 'pa 4/25/2022 11:53:28'!
firmaGenetica
	^'Lara'! !

!AvispaLara class methodsFor: 'reproduccion' stamp: 'pa 4/25/2022 11:53:29'!
intentarReproducirse
	HabitatDeAvispasYOrugasYPolillas chequearSiLaraPuedeRobarUnHuevoDeAvispaAjeno ifTrue: [
		HabitatDeAvispasYOrugasYPolillas removerUnHuevoDeAvispaAjenoALara.
		HabitatDeAvispasYOrugasYPolillas añadirUnHuevoDeAvispaDeFirma: self firmaGenetica.
	]! !


!classDefinition: #AvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOriana class' category: 'AvispasYAbejasParte2'!
AvispaOriana class
	instanceVariableNames: ''!

!AvispaOriana class methodsFor: 'reproduccion' stamp: 'pa 4/25/2022 11:53:28'!
firmaGenetica
	^'OrianaOrnella'! !

!AvispaOriana class methodsFor: 'reproduccion' stamp: 'pa 4/25/2022 11:53:29'!
intentarReproducirse
	HabitatDeAvispasYOrugasYPolillas haySuficientesOrugas ifTrue: [
		HabitatDeAvispasYOrugasYPolillas removerUnaOruga.
		HabitatDeAvispasYOrugasYPolillas añadirUnHuevoDeAvispaDeFirma: self firmaGenetica.
		]
	! !


!classDefinition: #AvispaOrnella category: 'AvispasYAbejasParte2'!
AvispaOriana subclass: #AvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


!classDefinition: #AvispaPolly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaPolly class' category: 'AvispasYAbejasParte2'!
AvispaPolly class
	instanceVariableNames: ''!

!AvispaPolly class methodsFor: 'reproduccion' stamp: 'pa 4/25/2022 11:53:28'!
firmaGenetica
	^'Polly'! !

!AvispaPolly class methodsFor: 'reproduccion' stamp: 'pa 4/25/2022 11:53:29'!
intentarReproducirse
	HabitatDeAvispasYOrugasYPolillas haySuficientesPolillas ifTrue: [
		HabitatDeAvispasYOrugasYPolillas removerUnaPolilla.
		HabitatDeAvispasYOrugasYPolillas añadirUnHuevoDeAvispaDeFirma: self firmaGenetica.
		]! !


!classDefinition: #HabitatDeAvispasYOrugasYPolillas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #HabitatDeAvispasYOrugasYPolillas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HabitatDeAvispasYOrugasYPolillas class' category: 'AvispasYAbejasParte2'!
HabitatDeAvispasYOrugasYPolillas class
	instanceVariableNames: 'cantidadDeOrugas cantidadDePolillas cantidadDeHuevos'!

!HabitatDeAvispasYOrugasYPolillas class methodsFor: 'huevos' stamp: 'pa 4/24/2022 12:56:13'!
añadirUnHuevoDeAvispaDeFirma: firma
		cantidadDeHuevos at: firma put: (self cantidadDeHuevosDeAvispaDeFirma: firma ) + 1. ! !

!HabitatDeAvispasYOrugasYPolillas class methodsFor: 'huevos' stamp: 'pa 4/24/2022 12:56:13'!
cantidadDeHuevosDeAvispaDeFirma: firma
	^cantidadDeHuevos at: firma ifAbsent: [ 0 ].! !

!HabitatDeAvispasYOrugasYPolillas class methodsFor: 'huevos' stamp: 'FRJ 4/23/2022 12:39:48'!
cantidadDeHuevosDeAvispas
	^cantidadDeHuevos values sum: [ : unNumero | unNumero ] ifEmpty: [ 0 ] .! !

!HabitatDeAvispasYOrugasYPolillas class methodsFor: 'huevos' stamp: 'pa 4/25/2022 11:49:23'!
chequearSiLaraPuedeRobarUnHuevoDeAvispaAjeno
	^ (self firmaALaQueLaraLePuedeRobarUnHuevoDeAvispa ~= nil).
	! !

!HabitatDeAvispasYOrugasYPolillas class methodsFor: 'huevos' stamp: 'pa 4/25/2022 12:02:17'!
firmaALaQueLaraLePuedeRobarUnHuevoDeAvispa
	^cantidadDeHuevos keys detect: [ :firma | ((self cantidadDeHuevosDeAvispaDeFirma: firma) > 0 ) and: (firma ~= AvispaLara firmaGenetica) ] ifNone: [nil].
	! !

!HabitatDeAvispasYOrugasYPolillas class methodsFor: 'huevos' stamp: 'pa 4/24/2022 12:58:06'!
reiniciarCantidadDeHuevosDeAvispas
	cantidadDeHuevos := Dictionary new.! !

!HabitatDeAvispasYOrugasYPolillas class methodsFor: 'huevos' stamp: 'pa 4/25/2022 11:45:40'!
removerUnHuevoDeAvispaAjenoALara
	| firmaDeHuevoARobar |.
	firmaDeHuevoARobar := self firmaALaQueLaraLePuedeRobarUnHuevoDeAvispa.
	self removerUnHuevoDeAvispaDeFirma: firmaDeHuevoARobar.


	! !

!HabitatDeAvispasYOrugasYPolillas class methodsFor: 'huevos' stamp: 'pa 4/24/2022 12:58:38'!
removerUnHuevoDeAvispaDeFirma: firma
	cantidadDeHuevos at: firma put: (self cantidadDeHuevosDeAvispaDeFirma: firma ) - 1. ! !


!HabitatDeAvispasYOrugasYPolillas class methodsFor: 'polillas' stamp: 'FRJ 4/23/2022 12:47:39'!
añadirUnaPolilla
	cantidadDePolillas := cantidadDePolillas + 1.! !

!HabitatDeAvispasYOrugasYPolillas class methodsFor: 'polillas' stamp: 'pa 4/23/2022 11:42:28'!
cantidadDePolillas
	^cantidadDePolillas! !

!HabitatDeAvispasYOrugasYPolillas class methodsFor: 'polillas' stamp: 'pa 4/23/2022 11:48:06'!
haySuficientesPolillas
	^cantidadDePolillas > 0! !

!HabitatDeAvispasYOrugasYPolillas class methodsFor: 'polillas' stamp: 'FRJ 4/23/2022 12:45:11'!
reiniciarCantidadDePolillas
	cantidadDePolillas := 0.! !

!HabitatDeAvispasYOrugasYPolillas class methodsFor: 'polillas' stamp: 'FRJ 4/23/2022 12:47:53'!
removerUnaPolilla
	cantidadDePolillas := cantidadDePolillas - 1.! !


!HabitatDeAvispasYOrugasYPolillas class methodsFor: 'orugas' stamp: 'FRJ 4/23/2022 12:54:31'!
añadirUnaOruga
	cantidadDeOrugas  := cantidadDeOrugas + 1.! !

!HabitatDeAvispasYOrugasYPolillas class methodsFor: 'orugas' stamp: 'FRJ 4/21/2022 20:32:55'!
cantidadDeOrugas
	^cantidadDeOrugas.! !

!HabitatDeAvispasYOrugasYPolillas class methodsFor: 'orugas' stamp: 'FRJ 4/23/2022 10:54:52'!
haySuficientesOrugas
	^cantidadDeOrugas > 0.! !

!HabitatDeAvispasYOrugasYPolillas class methodsFor: 'orugas' stamp: 'FRJ 4/23/2022 12:45:25'!
reiniciarCantidadDeOrugas
	cantidadDeOrugas := 0.! !

!HabitatDeAvispasYOrugasYPolillas class methodsFor: 'orugas' stamp: 'FRJ 4/23/2022 12:54:47'!
removerUnaOruga
	cantidadDeOrugas := cantidadDeOrugas - 1.! !


!HabitatDeAvispasYOrugasYPolillas class methodsFor: '--** private fileout/in **--' stamp: 'pa 4/25/2022 12:04:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeOrugas := 1.
	cantidadDePolillas := 1.
	cantidadDeHuevos := ((Dictionary new) add: ('OrianaOrnella'->1); yourself).! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'FRJ 4/23/2022 11:00:11'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:11'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:53'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:18'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:46'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:40'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:30'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'FRJ 4/23/2022 12:12:08'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'pa 4/25/2022 11:53:29'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^self habitat cantidadDeHuevosDeAvispaDeFirma: AvispaLara firmaGenetica.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'pa 4/25/2022 11:53:28'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^self habitat cantidadDeHuevosDeAvispaDeFirma: AvispaOriana firmaGenetica.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'pa 4/25/2022 11:53:28'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^self habitat cantidadDeHuevosDeAvispaDeFirma: AvispaOrnella firmaGenetica.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'pa 4/25/2022 11:53:29'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^self habitat cantidadDeHuevosDeAvispaDeFirma: AvispaPolly firmaGenetica.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'pa 4/23/2022 11:54:22'!
habitat
	^HabitatDeAvispasYOrugasYPolillas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'pa 4/23/2022 11:54:00'!
hacerQueElHabitatTengaLosRecursosSuficientes
	self queElHabitatTengaDosOrugasMas.
	self queElHabitatTengaUnaPolillaMas.
	! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'pa 4/23/2022 13:57:29'!
laAvispaLara
	^AvispaLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'FRJ 4/21/2022 20:22:35'!
laAvispaOriana
	^AvispaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'pa 4/23/2022 11:13:32'!
laAvispaOrnella
	^AvispaOrnella! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'pa 4/23/2022 11:33:31'!
laAvispaPolly
	^AvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'FRJ 4/23/2022 12:54:31'!
queElHabitatTengaDosOrugasMas
	2 timesRepeat: [ self habitat añadirUnaOruga ].! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'pa 4/23/2022 11:57:09'!
queElHabitatTengaDosPolillasMas
	2 timesRepeat: [ self queElHabitatTengaUnaPolillaMas ].! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'FRJ 4/23/2022 12:54:31'!
queElHabitatTengaUnaOrugaMas
	self habitat añadirUnaOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'FRJ 4/23/2022 12:47:39'!
queElHabitatTengaUnaPolillaMas
	self habitat añadirUnaPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'pa 4/24/2022 12:58:06'!
retrocederElHabitatAlInicioDeLosTiempos
	self habitat reiniciarCantidadDeHuevosDeAvispas.
	self habitat reiniciarCantidadDeOrugas.
	self habitat reiniciarCantidadDePolillas. 
! !

HabitatDeAvispasYOrugasYPolillas initializeAfterFileIn!