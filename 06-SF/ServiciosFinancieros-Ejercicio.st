!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'account tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'account tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'account tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'account tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'account tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'account tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'account tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!ReceptiveAccountTest methodsFor: 'transfering tests' stamp: 'FRJ 6/4/2022 00:27:53'!
test08CanNotTransferZeroPesos

	| receivingAccount transferingAccount |
	
	receivingAccount := ReceptiveAccount new.
	transferingAccount := ReceptiveAccount new.
	
	self should: [ transferingAccount transferAmount: 0 * peso to: receivingAccount ]
	raise: Error
	withExceptionDo: [:anError | 
	self assert: anError messageText = ReceptiveAccount canNotTransferZeroPesosErrorDescription ].
	self assert: (transferingAccount balance = (0 * peso) and: [receivingAccount balance = (0 * peso)]).
	
! !

!ReceptiveAccountTest methodsFor: 'transfering tests' stamp: 'FRJ 6/4/2022 00:32:28'!
test09MakingAValidTransactionWorksCorrectly

	| receivingAccount transferingAccount |
	
	receivingAccount := ReceptiveAccount new.
	transferingAccount := ReceptiveAccount new.
	Deposit register: 1 * peso on: transferingAccount.
	
	transferingAccount transferAmount: 1 * peso to: receivingAccount.
	self assert: (transferingAccount balance = (0 * peso) and: [receivingAccount balance = (1 * peso)]).
	
! !

!ReceptiveAccountTest methodsFor: 'transfering tests' stamp: 'FRJ 6/4/2022 00:33:16'!
test10SeBorrara

	| receivingAccount transferingAccount |
	
	receivingAccount := ReceptiveAccount new.
	transferingAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: transferingAccount.
	
	transferingAccount transferAmount: 10 * peso to: receivingAccount.
	self assert: (transferingAccount balance = (0 * peso) and: [receivingAccount balance = (10 * peso)]).
	
! !

!ReceptiveAccountTest methodsFor: 'transfering tests' stamp: 'FRJ 6/4/2022 00:35:52'!
test11CanNotTransferToTheTransferingAccount

	| anAccount |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: anAccount.
	
	self should: [ anAccount transferAmount: 10 * peso to: anAccount ]
	raise: Error
	withExceptionDo: [:anError | 
	self assert: anError messageText = ReceptiveAccount canNotTransferToTheTransferingAccountErrorDescription ].
	self assert: (anAccount balance = (10 * peso)).
	
! !

!ReceptiveAccountTest methodsFor: 'transfering tests' stamp: 'FRJ 6/4/2022 00:36:33'!
test12CanNotTransferANegativeAmountOfPesos

	| receivingAccount transferingAccount |
	
	receivingAccount := ReceptiveAccount new.
	transferingAccount := ReceptiveAccount new.
	
	self should: [ transferingAccount transferAmount: -10 * peso to: receivingAccount ]
	raise: Error
	withExceptionDo: [:anError | 
	self assert: anError messageText = ReceptiveAccount canNotTransferANegativeAmountOfPesosErrorDescription ].
	self assert: (transferingAccount balance = (0 * peso) and: [receivingAccount balance = (0 * peso)]).
	
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'FRJ 6/3/2022 23:27:34'!
modifyBalance: aBalance

	^aBalance + value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'FRJ 6/3/2022 23:27:03'!
modifyBalance: aBalance

	^aBalance - value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FRJ 6/3/2022 23:03:21'!
balance

	^(transactions inject: 0 into: [:balance :aTransaction | aTransaction modifyBalance: balance ])! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'error handling' stamp: 'FRJ 6/4/2022 00:25:11'!
raiseErrorWhenTransferingToAnInvalidAccount: anAccount orWithAnvalidAmount: anAmount

	anAmount = 0 ifTrue: [ self error: ReceptiveAccount canNotTransferZeroPesosErrorDescription ].
	anAmount < 0 ifTrue: [ self error: ReceptiveAccount canNotTransferANegativeAmountOfPesosErrorDescription ].
	self = anAccount  ifTrue: [ self error: ReceptiveAccount canNotTransferToTheTransferingAccountErrorDescription ]! !


!ReceptiveAccount methodsFor: 'private' stamp: 'FRJ 6/4/2022 00:10:18'!
withdraw: anAmount andDepositItTo: aReceivingAccount

	Withdraw register: anAmount on: self.
	Deposit register: anAmount on: aReceivingAccount! !


!ReceptiveAccount methodsFor: 'transfering' stamp: 'FRJ 6/4/2022 00:23:22'!
transferAmount: anAmount to: aReceivingAccount
	
	self raiseErrorWhenTransferingToAnInvalidAccount: aReceivingAccount orWithAnvalidAmount: anAmount.
	
	self withdraw: anAmount andDepositItTo: aReceivingAccount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Ejercicio'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'FRJ 6/4/2022 00:16:03'!
canNotTransferANegativeAmountOfPesosErrorDescription
	^'Can not transfer a negative amount of Pesos'! !

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'FRJ 6/4/2022 00:04:20'!
canNotTransferToTheTransferingAccountErrorDescription
	^'Can not transfer to the transfering account'! !

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'FRJ 6/4/2022 00:04:24'!
canNotTransferZeroPesosErrorDescription
	^'Can not transfer Zero Pesos'! !
