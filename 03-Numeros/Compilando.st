!classDefinition: #CicloReproductivoDeAvispasTest category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
TestCase subclass: #CicloReproductivoDeAvispasTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:43:18'!
test01EnElInicioDeLosTiemposHayUnaCantidadDeAvispasVivas

	| unHabitat |
	unHabitat := Habitat conAvispasComeOrugas: 2.	
	self assert: 2 equals: unHabitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:43:26'!
test02EnElInicioDeLosTiemposNoHayHuevosDeAvispas

	| unHabitat |
	unHabitat := Habitat conAvispasComeOrugas: 2.	
	self assert: 0 equals: unHabitat cantidadDeHuevosDeAvispas.! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:43:39'!
test03LasAvispasMuerenAlCambiarDeAño
	| unHabitat |
	unHabitat := Habitat conAvispasComeOrugas: 2.	
	
	unHabitat avanzarUnAño.
	
	self assert: 0 equals: unHabitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'FRJ 5/21/2022 14:22:23'!
test04AlReproducirseUnaAvispaAlSiguienteAñoGestanUnaAvispaDescendiente
	
	| unHabitat avispaQueDejaUnHuevo |
	
	unHabitat := Habitat conAvispasComeOrugas: 2.	
	unHabitat gestarCantidadDeOrugas: 1.
	avispaQueDejaUnHuevo := unHabitat avispas first.
	avispaQueDejaUnHuevo intentarReproducirse.
	
	unHabitat avanzarUnAño.
	
	self assert: 1 equals: unHabitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:47:23'!
test05ReproducirseUnaAvispaAlSiguienteAñoGestanUnaAvispaDescendientePeroNoPuedeGestarNingunaAlOtroAño
	| habitat avispaQueDejaUnaCria |
	habitat := Habitat conAvispasComeOrugas: 2.	
	habitat gestarCantidadDeOrugas: 1.
	avispaQueDejaUnaCria := habitat avispas first.
	avispaQueDejaUnaCria intentarReproducirse.
	
	habitat avanzarUnAño.
	habitat avanzarUnAño.
	
	self assert: 0 equals: habitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:35:59'!
test06AlReproducirseUnaAvispaComeOrugasAlSiguienteAñoGestanUnaDescendienteDeSuFirmaGenetica
	| habitat avispaQueDejaUnHuevo |
	habitat := Habitat conAvispasComeOrugas: 2.	
	habitat gestarCantidadDeOrugas: 1.
	avispaQueDejaUnHuevo := habitat avispas first.
	avispaQueDejaUnHuevo intentarReproducirse.
	
	habitat avanzarUnAño.
	
	self assert: 1 equals: (habitat cantidadDeAvispasVivasCumplanCon: [ : unaAvispa | unaAvispa firmaGenetica = avispaQueDejaUnHuevo firmaGenetica ]).
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:37:40'!
test07AlReproducirseUnaAvispaComePolillasAlSiguienteAñoGestanUnaDescendienteDeSuFirmaGenetica
	| habitat avispaQueDejaUnHuevo |
	habitat := Habitat conAvispasComePolillas: 2.	
	habitat gestarCantidadDePolillas: 1.
	avispaQueDejaUnHuevo := habitat avispas first.
	avispaQueDejaUnHuevo intentarReproducirse.
	
	habitat avanzarUnAño.
	
	self assert: 1 equals: (habitat cantidadDeAvispasVivasCumplanCon: [ : unaAvispa | unaAvispa firmaGenetica = avispaQueDejaUnHuevo firmaGenetica ]).
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'FRJ 5/21/2022 16:29:50'!
test08AlReproducirseUnaAvispaLadronaAlSiguienteAñoGestanUnaDescendienteDeSuFirmaGenetica
	
	| habitat avispaQueDejaUnHuevo avispaQueRoba |
	
	habitat := Habitat conAvispasComeOrugas: 1 ladronas: 	1.
	habitat gestarCantidadDeOrugas: 1.
	avispaQueDejaUnHuevo := (habitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esAvispaComeOrugas ]) first.
	avispaQueRoba := (habitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esAvispaLadrona]) first.
	avispaQueDejaUnHuevo intentarReproducirse.
	avispaQueRoba intentarReproducirse.
	
	habitat avanzarUnAño.
	
	self assert: 1 equals: (habitat cantidadDeAvispasVivasCumplanCon: [ : unaAvispa | unaAvispa firmaGenetica = avispaQueRoba firmaGenetica ]).
	! !


!classDefinition: #ReproduccionAvispasTests category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
TestCase subclass: #ReproduccionAvispasTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'JMB 5/20/2022 01:12:57'!
test01CuandoUnAvispaComeOrugasSeReproducePorPrimeraVezDejaUnHuevo
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1.
	unHabitat gestarCantidadDeOrugas: 1.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	unaAvispaAReproducirse intentarReproducirse.
	
	self assert: 1 equals: unHabitat cantidadDeHuevosDeAvispas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'JMB 5/20/2022 01:12:57'!
test02CadaVezQueUnaAvispaComeOrugasSeReproduceDejaUnHuevoMas
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1.
	unHabitat gestarCantidadDeOrugas: 2.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaAReproducirse intentarReproducirse.
	
	unaAvispaAReproducirse intentarReproducirse.
	
	self assert: 2 equals: unHabitat cantidadDeHuevosDeAvispas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'JMB 5/20/2022 01:12:57'!
test03ParaDejarUnHuevoUnaAvispaComeOrugasReduceLaPoblacionDeUnaOrugaANinguna
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1.
	unHabitat gestarCantidadDeOrugas: 1.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	
	unaAvispaAReproducirse intentarReproducirse.
	
	self assert: 0 equals: unHabitat cantidadDeOrugas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'JMB 5/20/2022 01:12:57'!
test04ParaDejarUnHuevoUnaAvispaComeOrugasDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1.
	unHabitat gestarCantidadDeOrugas: 2.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	unaAvispaAReproducirse intentarReproducirse.
	
	self assert: 1 equals: unHabitat cantidadDeOrugas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'JMB 5/20/2022 01:12:57'!
test05CuandoNoHayOrugasUnaAvispaComeOrugasNoPuedeDejarHuevos
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
		
	unaAvispaAReproducirse intentarReproducirse.
	
	self assert: 0 equals: unHabitat cantidadDeHuevosDeAvispas.! !


!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'JMB 5/20/2022 01:13:36'!
test06CuandoUnaAvispaComePolillasSeReproduceDejaUnHuevo
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComePolillas: 1.
	unHabitat gestarCantidadDePolillas: 1.
	unaAvispaAReproducirse := (self elegirAvispasComePolillasDe: unHabitat) first.
	
	unaAvispaAReproducirse intentarReproducirse.
	
	self assert: 1 equals: unHabitat cantidadDeHuevosDeAvispas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'JMB 5/20/2022 01:13:36'!
test07ParaDejarUnHuevoUnaAvispaComePolillasReduceLaPoblacionDeUnaPolillaANinguna
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComePolillas: 1.
	unHabitat gestarCantidadDePolillas: 1.
	unaAvispaAReproducirse := (self elegirAvispasComePolillasDe: unHabitat) first.
	
	unaAvispaAReproducirse intentarReproducirse.
	
	self assert: 0 equals: unHabitat cantidadDePolillas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'JMB 5/20/2022 01:13:36'!
test08ParaDejarUnHuevoUnaAvispaComePolillasDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComePolillas: 1.
	unHabitat gestarCantidadDePolillas: 2.
	unaAvispaAReproducirse := (self elegirAvispasComePolillasDe: unHabitat) first.
	
	unaAvispaAReproducirse intentarReproducirse.
	
	self assert: 1 equals: unHabitat cantidadDePolillas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'JMB 5/20/2022 01:13:36'!
test09CuandoNoHayPolillasUnaAvispaComePolillasNoPuedeDejarHuevos
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComePolillas: 1.
	unaAvispaAReproducirse := (self elegirAvispasComePolillasDe: unHabitat) first.
	
	unaAvispaAReproducirse intentarReproducirse.
	
	self assert: 0 equals: unHabitat cantidadDeHuevosDeAvispas.! !


!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 5/20/2022 01:12:57'!
test10CuandoUnaAvispaComeOrugasSeReproduceDejaUnHuevoConSuFirmaGenetica
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1.
	unHabitat gestarCantidadDeOrugas: 1.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	unaAvispaAReproducirse intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaAReproducirse firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 5/20/2022 01:12:57'!
test11CuandoUnaAvispaComeOrugasAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	unaAvispaAReproducirse intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaAReproducirse firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 5/20/2022 21:36:24'!
test12CuandoUnaAvispaComePolillasSeReproduceDejaUnHuevoConSuFirmaGenetica
	| unHabitat unaAvispaComePolillas unaAvispaComeOrugas |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 1.
	unHabitat gestarCantidadDePolillas: 1.
	unaAvispaComePolillas := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaAvispaComeOrugas := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	unaAvispaComePolillas intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaComePolillas firmaGenetica).
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaComeOrugas firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 5/20/2022 01:12:57'!
test13DosAvispasDelMismoTipoDejanHuevosDeLaMismaLineaGenetica
	| unHabitat unaAvispaComeOrugas otraAvispaComeOrugas |
	unHabitat := Habitat conAvispasComeOrugas: 2.
	unHabitat gestarCantidadDeOrugas: 1.
	unaAvispaComeOrugas := (self elegirAvispasComeOrugasDe: unHabitat) first.
	otraAvispaComeOrugas := (self elegirAvispasComeOrugasDe: unHabitat) last.
	
	unaAvispaComeOrugas intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaComeOrugas firmaGenetica).
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: otraAvispaComeOrugas firmaGenetica).! !


!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 5/20/2022 01:14:14'!
test14CuandoUnaAvispaLadronaSeReproduceDejaUnHuevoConSuFirmaGenetica
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 1.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 5/20/2022 01:14:14'!
test15CuandoUnaAvispaLadronaSeReproduceLeSacaUnHuevoAOtraAvispa
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 1.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 5/20/2022 01:14:14'!
test16CuandoUnaAvispaLadronaSeReproduceSoloRobaUnHuevo
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 2.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaASerRobada intentarReproducirse.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 5/20/2022 01:14:14'!
test17CuandoUnaAvispaLadronaNoTieneRecursosNoDejaUnHuevo
	| unHabitat unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).! !


!ReproduccionAvispasTests methodsFor: 'avispas ladronas - selectivas' stamp: 'JMB 5/20/2022 01:14:14'!
test18CuandoUnaAvispaLadronaSeReproduceRobaHuevosDeVariasAvispas
	| unHabitat unaAvispaASerRobada unaAvispaLadrona otraAvispaASerRobada |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 1 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 1.
	unHabitat gestarCantidadDePolillas: 1.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	otraAvispaASerRobada := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	otraAvispaASerRobada intentarReproducirse.
	unaAvispaLadrona intentarReproducirse.
	
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: otraAvispaASerRobada firmaGenetica).
	self assert: 2 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).
	! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas - selectivas' stamp: 'JMB 5/20/2022 01:14:14'!
test19CuandoUnaAvispaLadronaSeReproduceNoVuelveARobarDeLaUltimaLineaGeneticaQueYaHaRobado
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 0 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 2.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaLadrona intentarReproducirse. 
	
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas - selectivas' stamp: 'JMB 5/20/2022 01:14:14'!
test20CuandoUnaAvispaLadronaSeReproduceNoRobaHuevosDeNingunaFirmaGeneticaALaQueLeHayaRobadoPreviamente
	| unHabitat unaAvispaASerRobada unaAvispaLadrona otraAvispaASerRobada |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 1 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 2.
	unHabitat gestarCantidadDePolillas: 2.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	otraAvispaASerRobada := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaASerRobada intentarReproducirse.
	otraAvispaASerRobada intentarReproducirse.
	unaAvispaLadrona intentarReproducirse.
	unaAvispaLadrona intentarReproducirse.
	
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: otraAvispaASerRobada firmaGenetica).
	self assert: 2 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).
	! !


!ReproduccionAvispasTests methodsFor: 'avispas' stamp: 'FRJ 5/21/2022 16:29:12'!
elegirAvispasComeOrugasDe: unHabitat

	^ unHabitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esAvispaComeOrugas ]! !

!ReproduccionAvispasTests methodsFor: 'avispas' stamp: 'FRJ 5/21/2022 16:29:21'!
elegirAvispasComePolillasDe: unHabitat

	^ unHabitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esAvispaComePolillas]! !

!ReproduccionAvispasTests methodsFor: 'avispas' stamp: 'FRJ 5/21/2022 16:29:28'!
elegirAvispasLadronasDe: unHabitat

	^ unHabitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esAvispaLadrona]! !


!classDefinition: #Avispa category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Object subclass: #Avispa
	instanceVariableNames: 'habitat'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!Avispa methodsFor: 'initialization' stamp: 'FRJ 5/21/2022 16:43:51'!
initializeEnHabitat: unHabitat

	habitat := unHabitat.! !


!Avispa methodsFor: 'testing' stamp: 'FRJ 5/21/2022 16:27:44'!
esAvispaComeOrugas

	^false! !

!Avispa methodsFor: 'testing' stamp: 'FRJ 5/21/2022 16:27:47'!
esAvispaComePolillas

	^false! !

!Avispa methodsFor: 'testing' stamp: 'FRJ 5/21/2022 16:27:37'!
esAvispaLadrona

	^false! !


!Avispa methodsFor: 'reproduccion' stamp: 'FRJ 5/21/2022 16:18:59'!
firmaGenetica

	self error: 'La firma genetica de avispa no es valida'
	! !

!Avispa methodsFor: 'reproduccion' stamp: 'FRJ 5/21/2022 16:35:45'!
intentarReproducirse

	^ self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Avispa class' category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Avispa class
	instanceVariableNames: ''!

!Avispa class methodsFor: 'instance creation' stamp: 'FRJ 5/21/2022 15:58:36'!
enHabitat: unHabitat 

	self subclassResponsibility.! !


!classDefinition: #AvispaComeOrugas category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Avispa subclass: #AvispaComeOrugas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!AvispaComeOrugas methodsFor: 'reproduccion' stamp: 'FRJ 5/21/2022 16:17:54'!
firmaGenetica

	^ #'come-orugas'! !

!AvispaComeOrugas methodsFor: 'reproduccion' stamp: 'FRJ 5/21/2022 16:21:22'!
intentarReproducirse

	habitat tieneOrugas ifTrue: [		habitat tomarUnaOruga.
		habitat dejarUnHuevoDeAvispa: self.].! !


!AvispaComeOrugas methodsFor: 'testing' stamp: 'FRJ 5/21/2022 16:25:58'!
esAvispaComeOrugas

	^true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaComeOrugas class' category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
AvispaComeOrugas class
	instanceVariableNames: ''!

!AvispaComeOrugas class methodsFor: 'instance creation' stamp: 'FRJ 5/21/2022 16:20:07'!
enHabitat: unHabitat

	^self new initializeEnHabitat: unHabitat.! !


!classDefinition: #AvispaComePolillas category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Avispa subclass: #AvispaComePolillas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!AvispaComePolillas methodsFor: 'testing' stamp: 'FRJ 5/21/2022 16:26:14'!
esAvispaComePolillas

	^true.! !


!AvispaComePolillas methodsFor: 'reproduccion' stamp: 'FRJ 5/21/2022 16:18:35'!
firmaGenetica

	^ #'come-polillas'
	! !

!AvispaComePolillas methodsFor: 'reproduccion' stamp: 'FRJ 5/21/2022 16:21:44'!
intentarReproducirse

	habitat tienePolillas ifTrue: [ 		habitat tomarUnaPolilla.
		habitat dejarUnHuevoDeAvispa: self.	 ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaComePolillas class' category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
AvispaComePolillas class
	instanceVariableNames: ''!

!AvispaComePolillas class methodsFor: 'instance creation' stamp: 'FRJ 5/21/2022 15:59:35'!
enHabitat: unHabitat

	^self new initializeEnHabitat: unHabitat.! !


!classDefinition: #AvispaLadrona category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Avispa subclass: #AvispaLadrona
	instanceVariableNames: 'firmasPreviamenteRobadas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!AvispaLadrona methodsFor: 'reproduccion' stamp: 'FRJ 5/21/2022 16:18:46'!
firmaGenetica

	^ #ladrona! !

!AvispaLadrona methodsFor: 'reproduccion' stamp: 'FRJ 5/21/2022 16:49:35'!
intentarReproducirse

	| firmaRobada |
	
	(habitat tieneHuevosDeAvispasQueNoSeanDe: firmasPreviamenteRobadas)ifTrue: [		
		firmaRobada := habitat robarUnHuevoQueNoSeaDe: firmasPreviamenteRobadas.
		habitat dejarUnHuevoDeAvispa: self.
		firmasPreviamenteRobadas add: firmaRobada.].! !


!AvispaLadrona methodsFor: 'testing' stamp: 'FRJ 5/21/2022 16:26:24'!
esAvispaLadrona

	^true.! !


!AvispaLadrona methodsFor: 'initialization' stamp: 'FRJ 5/21/2022 16:45:03'!
initializeEnHabitat: unHabitat

	habitat := unHabitat.
	firmasPreviamenteRobadas := OrderedCollection with: self firmaGenetica.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaLadrona class' category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
AvispaLadrona class
	instanceVariableNames: ''!

!AvispaLadrona class methodsFor: 'instance creation' stamp: 'FRJ 5/21/2022 15:59:42'!
enHabitat: unHabitat

	^self new initializeEnHabitat: unHabitat.! !


!classDefinition: #Habitat category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Object subclass: #Habitat
	instanceVariableNames: 'avispas cantidadDeOrugas cantidadDePolillas cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!Habitat methodsFor: 'initialization' stamp: 'JMB 5/20/2022 01:07:16'!
initializeConAvispas: unasAvispasIniciales
	cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica := Dictionary new.
	cantidadDeOrugas := 0.
	cantidadDePolillas := 0.
	avispas := unasAvispasIniciales! !


!Habitat methodsFor: 'avispas' stamp: 'JMB 5/20/2022 01:09:25'!
avispas
	^ avispas! !

!Habitat methodsFor: 'avispas' stamp: 'JMB 5/17/2022 21:13:53'!
cantidadDeAvispasVivas
	^ avispas size! !

!Habitat methodsFor: 'avispas' stamp: 'JMB 5/20/2022 19:32:35'!
cantidadDeAvispasVivasCumplanCon: bloque 
	^ (self elegirAvispasQueCumplanCon: bloque) size! !

!Habitat methodsFor: 'avispas' stamp: 'FRJ 5/21/2022 14:58:59'!
elegirAvispasQueCumplanCon: bloque 

	^ avispas select: [: avispa | bloque value: avispa ].! !


!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/18/2022 12:05:53'!
cantidadDeHuevosConLaFirmaGenetica: unaFirmaGenetica
	^ cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica at: unaFirmaGenetica ifAbsent: [ 0 ]! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/18/2022 12:14:19'!
cantidadDeHuevosDeAvispas
	^ cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica values sum: [ : unaCantidadDeHuevos | unaCantidadDeHuevos ] ifEmpty: [ 0 ]! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/18/2022 16:40:25'!
dejarUnHuevoDeAvispa: unaAvispaAAovar
	| cantidadDeHuevos |
	cantidadDeHuevos := self cantidadDeHuevosConLaFirmaGenetica: unaAvispaAAovar firmaGenetica.
	self contabilizar: cantidadDeHuevos + 1 a: unaAvispaAAovar firmaGenetica.! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/18/2022 22:33:05'!
robarUnHuevoQueNoSeaDe: firmasGeneticasExcluidas
	| cantidadDeHuevos unaFirmaGeneticaARobar |
	unaFirmaGeneticaARobar := self firmaGeneticaARobarQueNoSea: firmasGeneticasExcluidas.
	cantidadDeHuevos := self cantidadDeHuevosConLaFirmaGenetica: unaFirmaGeneticaARobar.
	self contabilizar: cantidadDeHuevos - 1 a: unaFirmaGeneticaARobar.
	^ unaFirmaGeneticaARobar! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'FRJ 5/21/2022 16:36:16'!
tieneHuevosDeAvispasQueNoSeanDe: unasFirmasGeneticas

	^ (self firmasGeneticasDisponiblesARobarQueNoSean: unasFirmasGeneticas) size > 0 .! !


!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 16:41:14'!
cantidadDeOrugas
	^ cantidadDeOrugas! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 11:07:25'!
cantidadDePolillas
	^ cantidadDePolillas! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 09:57:44'!
gestarCantidadDeOrugas: unaCantidadDeOrugasAGestar 
	cantidadDeOrugas := cantidadDeOrugas + unaCantidadDeOrugasAGestar ! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 11:07:45'!
gestarCantidadDePolillas: unaCantidadDePolillasAGestar 
	cantidadDePolillas := cantidadDePolillas + unaCantidadDePolillasAGestar! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 10:06:37'!
tieneOrugas
	^ cantidadDeOrugas > 0! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 11:18:20'!
tienePolillas
	^ cantidadDePolillas > 0! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 09:59:06'!
tomarUnaOruga
	cantidadDeOrugas := cantidadDeOrugas - 1! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 11:09:15'!
tomarUnaPolilla
	cantidadDePolillas := cantidadDePolillas - 1! !


!Habitat methodsFor: 'ciclo' stamp: 'FRJ 5/21/2022 15:39:46'!
avanzarUnAño
	| avispasNuevas |
	avispasNuevas := OrderedCollection new.
	cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica keysAndValuesDo: [:unaFirmaGenetica :cantidad | 		cantidad timesRepeat: [
			avispasNuevas add: (self nuevaAvispaConFirma: unaFirmaGenetica ).
		]].
	avispas := avispasNuevas.
	cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica := Dictionary new.! !


!Habitat methodsFor: 'privados' stamp: 'JMB 5/18/2022 16:38:08'!
contabilizar: unaCantidadDeHuevos a: unaFirmaGenetica
	cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica at: unaFirmaGenetica put: unaCantidadDeHuevos! !

!Habitat methodsFor: 'privados' stamp: 'FRJ 5/21/2022 15:24:25'!
firmaGeneticaARobarQueNoSea: firmasGeneticasExcluidas
	
	^ (self firmasGeneticasDisponiblesARobarQueNoSean: firmasGeneticasExcluidas) first.! !

!Habitat methodsFor: 'privados' stamp: 'FRJ 5/21/2022 15:23:54'!
firmasGeneticasDisponiblesARobarQueNoSean: firmasGeneticasExcluidas
	
	^ cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica keys select: [:firma | 
	(firmasGeneticasExcluidas includes: firma) not and: [(self cantidadDeHuevosConLaFirmaGenetica: firma) > 0]].! !

!Habitat methodsFor: 'privados' stamp: 'FRJ 5/21/2022 16:10:39'!
nuevaAvispaConFirma: unaFirmaGenetica
	
	unaFirmaGenetica = #'come-orugas' ifTrue: [ ^ AvispaComeOrugas enHabitat: self ].
	unaFirmaGenetica = #'come-polillas' ifTrue: [ ^ AvispaComePolillas enHabitat: self ].	
	unaFirmaGenetica = #ladrona ifTrue: [ ^ AvispaLadrona enHabitat: self ].
	
	self error: 'La firma genetica de avispa no es valida'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Habitat class' category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Habitat class
	instanceVariableNames: ''!

!Habitat class methodsFor: 'instance creation' stamp: 'FRJ 5/21/2022 16:05:07'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas
	
	^self conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas comePolillas: 0 ladronas: 0.
! !

!Habitat class methodsFor: 'instance creation' stamp: 'FRJ 5/21/2022 16:04:52'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas comePolillas: unaCantidadDeAvispasComePolillas 
	
	^self conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas comePolillas: unaCantidadDeAvispasComePolillas ladronas: 0.
	 ! !

!Habitat class methodsFor: 'instance creation' stamp: 'FRJ 5/21/2022 16:14:24'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas comePolillas: unaCantidadDeAvispasComePolillas ladronas: unaCantidadDeAvispasLadronas 

	| unasAvispas habitat |
	
	habitat := self new.
	
	unasAvispas := (self crearEnHabitat: habitat cantidadDeAvispasComeOrugas: unaCantidadDeAvispasComeOrugas).
	unasAvispas addAll: (self crearEnHabitat: habitat cantidadDeAvispasComePolillas: unaCantidadDeAvispasComePolillas).
	unasAvispas addAll: (self crearEnHabitat: habitat cantidadDeAvispasLadronas: unaCantidadDeAvispasLadronas).
	
	^habitat initializeConAvispas: unasAvispas ! !

!Habitat class methodsFor: 'instance creation' stamp: 'FRJ 5/21/2022 16:04:38'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas ladronas: unaCantidadDeAvispasLadronas 
	
	^self conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas comePolillas: 0 ladronas: unaCantidadDeAvispasLadronas.! !

!Habitat class methodsFor: 'instance creation' stamp: 'FRJ 5/21/2022 16:06:00'!
conAvispasComePolillas: unaCantidadDeAvispasComePolillas
	
	^self conAvispasComeOrugas: 0 comePolillas: unaCantidadDeAvispasComePolillas  ladronas: 0. ! !


!Habitat class methodsFor: 'private' stamp: 'FRJ 5/21/2022 16:13:07'!
crearEnHabitat: unHabitat cantidadDeAvispasComeOrugas: cantidadDeAvispas

	^((1 to: cantidadDeAvispas) collect: [ : each | AvispaComeOrugas enHabitat: unHabitat ]) asOrderedCollection.! !

!Habitat class methodsFor: 'private' stamp: 'FRJ 5/21/2022 16:13:17'!
crearEnHabitat: unHabitat cantidadDeAvispasComePolillas: cantidadDeAvispas

	^((1 to: cantidadDeAvispas) collect: [ : each | AvispaComePolillas enHabitat: unHabitat ]) asOrderedCollection.! !

!Habitat class methodsFor: 'private' stamp: 'FRJ 5/21/2022 16:13:34'!
crearEnHabitat: unHabitat cantidadDeAvispasLadronas: cantidadDeAvispas

	^((1 to: cantidadDeAvispas) collect: [ : each | AvispaLadrona enHabitat: unHabitat ]) asOrderedCollection.! !
