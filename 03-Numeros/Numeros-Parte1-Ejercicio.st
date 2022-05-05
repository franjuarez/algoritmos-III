!classDefinition: #NumeroTest category: 'Numeros-Parte1-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 15:15:40'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 15:15:53'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:09:55'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:04'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:00:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:00:32'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:01:10'!
test07FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := Numero with: (Numero with: 7) over: (Numero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:01:43'!
test08FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:03:11'!
test09AparentFraccionesAreEqual

	self assert: oneHalf equals: (Numero with: two over: four)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:03:28'!
test10AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:03:42'!
test11MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (twoFifth) * (fiveHalfs) ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:21'!
test12AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:30'!
test13AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:04:04'!
test14NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:05:06'!
test15NegationOfFraccionIsCorrect

	self assert: (Numero with: negativeOne over: two) equals: oneHalf negated! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:29:45'!
test16SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (Numero with: negativeOne over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:30:07'!
test17SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (Numero with: one over: negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'FRJ 5/4/2022 22:49:32'!
setUp

	zero := Numero with: 0 .
	one := Numero with: 1.
	two := Numero with: 2.
	three:= Numero with: 3.
	four := Numero with: 4.
	five := Numero with: 5.
	eight := Numero with: 8.
	negativeOne := Numero with: -1.
	negativeTwo := Numero with: -2.
	
	oneHalf := Numero with: one over: two.
	oneFifth := Numero with: one over: five.
	twoFifth := Numero with: two over: five.
	twoTwentyfifth := Numero with: two over: (Numero with: 25).
	fiveHalfs := Numero with: five over: two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte1-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: 'type value numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'FRJ 5/4/2022 22:23:23'!
* aMultiplier 

	^self subclassResponsibility.
	! !

!Numero methodsFor: 'arithmetic operations' stamp: 'FRJ 5/3/2022 23:18:43'!
+ anAdder 
	
	^self subclassResponsibility.
	
	! !

!Numero methodsFor: 'arithmetic operations' stamp: 'FRJ 5/4/2022 22:27:06'!
negated
	
	^self subclassResponsibility.! !


!Numero methodsFor: 'testing' stamp: 'FRJ 5/4/2022 22:28:18'!
isNegative
	
	^self subclassResponsibility.! !

!Numero methodsFor: 'testing' stamp: 'pa 5/2/2022 21:51:41'!
isOne

	self subclassResponsibility .! !

!Numero methodsFor: 'testing' stamp: 'pa 5/2/2022 21:49:27'!
isZero
	self subclassResponsibility .! !


!Numero methodsFor: 'initialization' stamp: 'FRJ 5/4/2022 22:30:06'!
initializeWith: aValue
	
	type := #Entero.
	value := aValue! !

!Numero methodsFor: 'initialization' stamp: 'pa 5/2/2022 21:38:39'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	type:=#Fraccion.
	numerator := aNumerator.
	denominator := aDenominator ! !


!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:59:46'!
denominator

	^denominator! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:33:53'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:59:52'!
numerator

	^numerator! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 21:55:04'!
type
	
	^type! !


!Numero methodsFor: 'printing' stamp: 'FRJ 5/4/2022 22:53:42'!
printOn: aStream
	
	"type = #Entero ifTrue:
		[ aStream print: value ].
	
	type = #Fraccion ifTrue:
		[ aStream 
			print: numerator;
			nextPut: $/;
			print: denominator ]."
	^self subclassResponsibility.! !


!Numero methodsFor: 'comparing' stamp: 'pa 5/2/2022 21:38:39'!
= anObject

	^(anObject isKindOf: self class) and: [ type = anObject type and: 
		[ type = #Entero ifTrue: [ value = anObject integerValue] 
		ifFalse: [ type = #Fraccion ifTrue:
			[ (numerator * anObject denominator) = (denominator * anObject numerator) ]]]]! !

!Numero methodsFor: 'comparing' stamp: 'pa 5/2/2022 21:38:39'!
hash
	type = #Entero ifTrue:
		[ ^value hash ].
	type = #Fraccion ifTrue:
		[ ^(numerator hash / denominator hash) hash ].! !


!Numero methodsFor: 'arithmetic operations - private' stamp: 'pa 5/2/2022 21:38:23'!
// aDivisor 
	
	type = #Entero ifTrue:
		[ ^self class with: value // aDivisor integerValue ].
		
	self error: 'Tipo de número no soportado'! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'pa 5/2/2022 21:38:23'!
greatestCommonDivisorWith: anEntero 
	
	type = #Entero ifTrue:
		[^self class with: (value gcd: anEntero integerValue)].
		
	self error: 'Tipo de número no soportado'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte1-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !


!Numero class methodsFor: 'instance creation' stamp: 'FRJ 5/4/2022 23:14:47'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].

	^Entero new initializeWith: aValue! !

!Numero class methodsFor: 'instance creation' stamp: 'pa 5/2/2022 21:49:02'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue: [ ^self with: aDividend negated over: aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^Fraccion new initializeWith: numerator over: denominator! !


!classDefinition: #Entero category: 'Numeros-Parte1-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Entero methodsFor: 'testing' stamp: 'FRJ 5/4/2022 22:19:14'!
* aMultiplier

	^aMultiplier multiplicarPorEntero: self.! !

!Entero methodsFor: 'testing' stamp: 'FRJ 5/3/2022 23:23:46'!
+ anAdder

	^anAdder sumaPorEntero: self.! !

!Entero methodsFor: 'testing' stamp: 'FRJ 5/4/2022 22:37:47'!
isInteger

	! !

!Entero methodsFor: 'testing' stamp: 'FRJ 5/4/2022 22:27:34'!
isNegative

	^value < 0.! !

!Entero methodsFor: 'testing' stamp: 'pa 5/2/2022 21:52:59'!
isOne
	^value = 1.! !

!Entero methodsFor: 'testing' stamp: 'pa 5/2/2022 21:38:53'!
isZero
	^value = 0.! !

!Entero methodsFor: 'testing' stamp: 'FRJ 5/4/2022 22:20:33'!
multiplicarPorEntero: entero

	^self class with: value * entero integerValue 
! !

!Entero methodsFor: 'testing' stamp: 'FRJ 5/4/2022 22:21:50'!
multiplicarPorFraccion: entero

	^self error: 'Tipo de número no soportado'.
! !

!Entero methodsFor: 'testing' stamp: 'FRJ 5/4/2022 22:25:35'!
negated

	^self * (self class with: -1)
! !

!Entero methodsFor: 'testing' stamp: 'FRJ 5/4/2022 22:52:21'!
printOn: aStream

	aStream print: value.! !

!Entero methodsFor: 'testing' stamp: 'FRJ 5/3/2022 23:23:46'!
sumaPorEntero: entero

	^self class with: value + entero integerValue 
! !

!Entero methodsFor: 'testing' stamp: 'FRJ 5/3/2022 23:45:19'!
sumaPorFraccion: fraccion

	^self error: 'Tipo de número no soportado'.
! !


!classDefinition: #Fraccion category: 'Numeros-Parte1-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Fraccion methodsFor: 'testing' stamp: 'FRJ 5/4/2022 22:24:50'!
* aMultiplier

	^aMultiplier multiplicarPorFraccion: self.! !

!Fraccion methodsFor: 'testing' stamp: 'FRJ 5/3/2022 23:45:04'!
+ anAdder

	^anAdder sumaPorFraccion: self.
! !

!Fraccion methodsFor: 'testing' stamp: 'FRJ 5/4/2022 22:27:40'!
isNegative

	^denominator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'pa 5/2/2022 21:52:59'!
isOne
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'pa 5/2/2022 21:37:42'!
isZero
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'FRJ 5/4/2022 22:22:05'!
multiplicarPorEntero: entero

	^self error: 'Tipo de número no soportado'.! !

!Fraccion methodsFor: 'testing' stamp: 'FRJ 5/4/2022 22:22:46'!
multiplicarPorFraccion: fraccion

	^self class with: (numerator * fraccion numerator) over: (denominator * fraccion denominator).! !

!Fraccion methodsFor: 'testing' stamp: 'FRJ 5/4/2022 22:26:41'!
negated

	^self class with: numerator * (self class with: -1) over: denominator.! !

!Fraccion methodsFor: 'testing' stamp: 'FRJ 5/4/2022 22:53:01'!
printOn: aStream

	aStream
	print: numerator;
	nextPut: $/;
	print: denominator! !

!Fraccion methodsFor: 'testing' stamp: 'FRJ 5/3/2022 23:45:28'!
sumaPorEntero: entero

	^self error: 'Tipo de número no soportado'! !

!Fraccion methodsFor: 'testing' stamp: 'FRJ 5/3/2022 23:45:50'!
sumaPorFraccion: fraccion

	| newNumerator newDenominator |
		
	newNumerator := (numerator * fraccion denominator) + (denominator * fraccion numerator).
	newDenominator := denominator * fraccion denominator.
		
	^ self class with: newNumerator over: newDenominator.! !
