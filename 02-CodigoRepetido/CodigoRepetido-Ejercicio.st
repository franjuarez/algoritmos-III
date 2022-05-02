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
	instanceVariableNames: 'customerBook JhonLennon PaulMccartney'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'pa 5/1/2022 20:40:48'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	
	self assertIfTimeDifferenceAfterOperation:  [customerBook addCustomerNamed: JhonLennon] isLessThan: 50 * millisecond.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'pa 5/1/2022 20:40:54'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	customerBook addCustomerNamed: PaulMccartney.
	self assertIfTimeDifferenceAfterOperation:  [customerBook removeCustomerNamed: PaulMccartney] isLessThan: 100 * millisecond.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'pa 5/1/2022 20:31:24'!
test03CanNotAddACustomerWithEmptyName 

	self assertIfOperation: [ customerBook addCustomerNamed: ''] failsDueToError: Error andMeetsConditions: [ :anError | anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage and: [ customerBook isEmpty]]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'pa 5/1/2022 21:01:31'!
test04CanNotRemoveAnInvalidCustomer

	customerBook addCustomerNamed: JhonLennon.
	
	self assertIfOperation: [ customerBook removeCustomerNamed: PaulMccartney ] failsDueToError:  NotFound andMeetsConditions: self conditionThatThereIsOnlyOneCustomerNamedJhonLennon.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'pa 5/1/2022 20:36:04'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	
	self customerBookAddAndSuspendCustomer: PaulMccartney.

	self assertIfCustomerBookHasExpectedNumberOfActiveCustomers: 0 andHasExpectedNumberOfSuspendedCustomers: 1. 
	self assert: (customerBook includesCustomerNamed: PaulMccartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'pa 5/1/2022 21:00:47'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	
	self customerBookAddAndSuspendCustomer: PaulMccartney .
	customerBook  removeCustomerNamed: PaulMccartney .
	
	self assertIfCustomerBookHasExpectedNumberOfActiveCustomers: 0 andHasExpectedNumberOfSuspendedCustomers: 0. 
	self deny: (customerBook includesCustomerNamed: PaulMccartney).

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'pa 5/1/2022 21:01:05'!
test07CanNotSuspendAnInvalidCustomer

	customerBook addCustomerNamed: JhonLennon.
	
	self assertIfOperation: [ customerBook suspendCustomerNamed: 'Ringo Starr']  failsDueToError: CantSuspend andMeetsConditions: self conditionThatThereIsOnlyOneCustomerNamedJhonLennon.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'pa 5/1/2022 21:01:11'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	self customerBookAddAndSuspendCustomer: JhonLennon .
	
	self assertIfOperation: [customerBook suspendCustomerNamed: JhonLennon] failsDueToError: CantSuspend andMeetsConditions: self conditionThatThereIsOnlyOneCustomerNamedJhonLennon.
	
	! !


!CustomerBookTest methodsFor: 'assertions' stamp: 'pa 5/1/2022 20:29:16'!
assertIfCustomerBookHasExpectedNumberOfActiveCustomers: expectedNumberOfActiveCustomers andHasExpectedNumberOfSuspendedCustomers: expectedNumberOfSuspendedCustomers
	| result |.
	result := expectedNumberOfActiveCustomers = customerBook numberOfActiveCustomers.
	result := result and: [expectedNumberOfSuspendedCustomers = customerBook numberOfSuspendedCustomers].
	result := result and: [expectedNumberOfActiveCustomers + expectedNumberOfSuspendedCustomers = customerBook numberOfCustomers].
	self assert: result.! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'pa 5/1/2022 21:30:43'!
assertIfOperation: operation failsDueToError: error andMeetsConditions: conditions
	[operation value. self fail]
		on: error 
		do: [ :anError | self assert: (conditions value: anError)].! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'pa 5/1/2022 20:40:24'!
assertIfTimeDifferenceAfterOperation: operation isLessThan: amountOfTime
	| timeDifference |.
	timeDifference := Time millisecondClockValue * millisecond.
	operation .
	timeDifference := timeDifference - (Time millisecondClockValue * millisecond).
	self assert: (timeDifference < amountOfTime).
	! !


!CustomerBookTest methodsFor: 'setUp' stamp: 'pa 5/1/2022 20:24:09'!
setUp

	customerBook := CustomerBook new.
	JhonLennon := 'JhonLennon'.
	PaulMccartney := 'PaulMccartney'.
	
	! !


!CustomerBookTest methodsFor: 'helpers' stamp: 'pa 5/1/2022 20:58:03'!
conditionThatThereIsOnlyOneCustomerNamedJhonLennon
	^[:anError |customerBook numberOfCustomers = 1 and: [customerBook includesCustomerNamed: JhonLennon]]
	! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'pa 5/1/2022 20:35:06'!
customerBookAddAndSuspendCustomer: customer

	customerBook addCustomerNamed: customer .
	customerBook suspendCustomerNamed: customer .! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'pa 5/1/2022 12:00:07'!
isEmpty
	
	^self numberOfCustomers = 0.! !


!CustomerBook methodsFor: 'initialization' stamp: 'FRJ 4/29/2022 21:16:28'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended := OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'pa 5/1/2022 20:46:37'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	active add: aName.! !

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
