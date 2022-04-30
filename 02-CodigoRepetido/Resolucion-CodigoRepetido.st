!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'FRJ 4/30/2022 12:54:33'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook JohnLennon |
	customerBook := CustomerBook new.
	JohnLennon := 'John Lennon'.
	self assertIfTimeDifferenceAfter:  [customerBook addCustomerNamed: JohnLennon] isLessThan: 50 * millisecond.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FRJ 4/30/2022 12:55:23'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	self assertIfTimeDifferenceAfter:  [customerBook removeCustomerNamed: paulMcCartney] isLessThan: 100 * millisecond.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FRJ 4/30/2022 12:45:21'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self checkIfAction: [ customerBook addCustomerNamed: ''] failsDueToError: Error andConditionsAreMet: [ :anError | anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage and: [ customerBook isEmpty]]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FRJ 4/30/2022 12:43:38'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self checkIfAction: [ customerBook removeCustomerNamed: 'Paul McCartney' ] failsDueToError:  NotFound andConditionsAreMet: [ :anError | customerBook numberOfCustomers = 1 and: [customerBook includesCustomerNamed: johnLennon]].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FRJ 4/30/2022 11:15:05'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.

	self assert: (self verifyValuesOfActiveCostumerBook: customerBook withExpectedActiveCustomers: 0 withExpectedSuspendedCustomers: 1). 
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FRJ 4/30/2022 11:15:00'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: (self verifyValuesOfActiveCostumerBook: customerBook withExpectedActiveCustomers: 0 withExpectedSuspendedCustomers: 0). 
	self deny: (customerBook includesCustomerNamed: paulMcCartney).

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FRJ 4/30/2022 12:46:56'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self checkIfAction: [ customerBook suspendCustomerNamed: 'Ringo Starr']  failsDueToError: CantSuspend andConditionsAreMet: [ :anError | customerBook numberOfCustomers = 1 and: [customerBook includesCustomerNamed: johnLennon]].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FRJ 4/30/2022 12:48:26'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self checkIfAction: [customerBook suspendCustomerNamed: johnLennon] failsDueToError: CantSuspend andConditionsAreMet: [:anError |customerBook numberOfCustomers = 1 and: [customerBook includesCustomerNamed: johnLennon]]
! !


!CustomerBookTest methodsFor: 'helpers' stamp: 'FRJ 4/30/2022 12:52:55'!
assertIfTimeDifferenceAfter: action isLessThan: amountOfTime
	| timeDifference |.
	timeDifference := Time millisecondClockValue * millisecond.
	action .
	timeDifference := timeDifference - (Time millisecondClockValue * millisecond).
	self assert: (timeDifference < amountOfTime).
	! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'FRJ 4/30/2022 12:42:19'!
checkIfAction: action failsDueToError: error andConditionsAreMet: conditions
	[action value. self fail]
		on: error 
		do: [ :anError | self assert: (conditions value: anError)].! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'pa 4/29/2022 22:09:53'!
timeDifferenceAfter: closure
	| timeDifference |.
	timeDifference := Time millisecondClockValue * millisecond.
	closure .
	^timeDifference - (Time millisecondClockValue * millisecond).
	! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'FRJ 4/30/2022 11:14:23'!
verifyValuesOfActiveCostumerBook: customerBook withExpectedActiveCustomers: expectedNumberOfActiveCustomers  withExpectedSuspendedCustomers: expectedNumberOfSuspendedCustomers
	| result |.
	result := expectedNumberOfActiveCustomers = customerBook numberOfActiveCustomers.
	result := result and: [expectedNumberOfSuspendedCustomers = customerBook numberOfSuspendedCustomers].
	result := result and: [expectedNumberOfActiveCustomers + expectedNumberOfSuspendedCustomers = customerBook numberOfCustomers].
	^result.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'FRJ 4/29/2022 21:16:28'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended := OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'FRJ 4/29/2022 21:14:29'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	active add: aName. ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'FRJ 4/29/2022 19:26:59'!
numberOfCustomers
	
	^self numberOfActiveCustomers  + self numberOfSuspendedCustomers.! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'FRJ 4/29/2022 21:23:32'!
removeCustomerNamed: aName 

	active remove: aName ifAbsent: [
		suspended remove: aName ifAbsent: [^ NotFound signal]
		].
	

! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'FRJ 4/29/2022 20:52:03'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage.! !

!CustomerBook methodsFor: 'customer management' stamp: 'FRJ 4/29/2022 21:23:15'!
suspendCustomerNamed: aName 

	active remove: aName ifAbsent: [^CantSuspend signal].
	suspended add: aName.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
