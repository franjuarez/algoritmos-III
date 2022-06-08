!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'aPortfolio anAccount aPortfolio2 anAccount2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'set up' stamp: 'pa 6/7/2022 20:48:56'!
setUp
	
	aPortfolio := Portfolio new.
	aPortfolio2 := Portfolio new.
	anAccount := ReceptiveAccount new.
	anAccount2 := ReceptiveAccount new.
	
	
	! !


!PortfolioTest methodsFor: 'testing' stamp: 'pa 6/7/2022 20:48:56'!
test01TheBalanceOfAnEmptyPortfolioIsZero

	self assert: ( aPortfolio balance = (0 * peso)).
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'pa 6/7/2022 20:48:56'!
test02TheBalanceOfAPortfolioWithAnAccoutWhoseBalanceIsZeroIsZero

	
	anAccount := ReceptiveAccount new.
	aPortfolio addAccount: anAccount.
	self assert: ( aPortfolio balance = (0 * peso)).
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'pa 6/7/2022 20:48:56'!
test03TheBalanceOfAPortfolioWithAnAccountIsTheSameAsTheAccountBalance

	Deposit register: (10 * peso) on: anAccount.
	aPortfolio addAccount: anAccount.
	self assert: ( aPortfolio balance = (10 * peso)).
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'pa 6/7/2022 20:48:56'!
test04TheBalanceOfAPortfolioWithManyAccountsIsTheSumOfTheBalanceOfItsAccounts
	
	Deposit register: (10 * peso) on: anAccount.
	Deposit register: (10 * peso) on: anAccount2.
	aPortfolio addAccount: anAccount.
	aPortfolio addAccount: anAccount2.	
	self assert: ( aPortfolio balance = (20 * peso)).
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'pa 6/7/2022 20:48:56'!
test05TheBalanceOfAPortfolioChangesWhenItsAccountsBalanceChanges

	
	aPortfolio addAccount: anAccount.
	Deposit register: (10 * peso) on: anAccount.
	self assert: ( aPortfolio balance = (10 * peso)).
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'pa 6/7/2022 20:48:56'!
test06TheBalanceOfAPortfolioCompossedOfOtherPortfolioIsCorrect
	
	aPortfolio2 addAccount: anAccount.
	aPortfolio addAccount: aPortfolio2 .
	Deposit register: (10 * peso) on: anAccount.
	self assert: ( aPortfolio balance = (10 * peso)).
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'pa 6/7/2022 20:48:56'!
test07AnEmptyPortfolioDoesNotHaveAnyTransactionsRegistered
	
	| aTransaction |
	
	aTransaction := Deposit register: (10 * peso) on: anAccount.
	self deny: ( aPortfolio hasRegistered: aTransaction ).
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'pa 6/7/2022 20:48:56'!
test08APortfolioWhichHasAnAccountWithATransactionHasTheTransactionRegistered
	
	| aTransaction |
	
	aTransaction := Deposit register: (10 * peso) on: anAccount.
	aPortfolio addAccount: anAccount .
	self assert: ( aPortfolio hasRegistered: aTransaction ).
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'pa 6/7/2022 20:48:56'!
test09APortfolioWhichHasAnAccountWithoutTransactionsDoesNotHaveAnyRegistered
	
	| aTransaction |
	
	aTransaction := Deposit register: (10 * peso) on: anAccount2.
	aPortfolio addAccount: anAccount .
	self deny: ( aPortfolio hasRegistered: aTransaction ).
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'pa 6/7/2022 20:48:56'!
test10APortfolioDoesntHaveTransactionsFromOtherAccounts
	
	| aTransaction aTransaction2 |
	
	aTransaction := Deposit register: (10 * peso) on: anAccount.
	aTransaction2 := Deposit register: (20 * peso) on: anAccount2. 
	aPortfolio addAccount: anAccount .
	self deny: ( aPortfolio hasRegistered: aTransaction2 ).
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'pa 6/7/2022 20:48:56'!
test11APortfolioHasAllTheTransactionsOfAnAccountIncludedInIt
	
	| aTransaction aTransaction2 |
	
	aTransaction := Deposit register: (10 * peso) on: anAccount.
	aTransaction2 := Deposit register: (20 * peso) on: anAccount. 
	aPortfolio addAccount: anAccount .
	self assert: ( (aPortfolio hasRegistered: aTransaction) and:[ aPortfolio hasRegistered: aTransaction2 ] ).
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'pa 6/7/2022 20:48:56'!
test12APortfolioHasTheTransactionsOfAllOfItsAccounts
	
	| aTransaction aTransaction2 |
	
	aTransaction := Deposit register: (10 * peso) on: anAccount.
	aTransaction2 := Deposit register: (20 * peso) on: anAccount2. 
	aPortfolio addAccount: anAccount .
	aPortfolio addAccount: anAccount2 .
	self assert: ( (aPortfolio hasRegistered: aTransaction) and:[ aPortfolio hasRegistered: aTransaction2 ] ).
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'pa 6/7/2022 20:48:56'!
test13APortfolioComposedOfOtherPortfoliosHasAllOfItsPortofoliosTransactions
	
	| aTransaction |
	
	aTransaction := Deposit register: (10 * peso) on: anAccount. 
	aPortfolio addAccount: aPortfolio2 .
	aPortfolio2 addAccount: anAccount .
	self assert: ( aPortfolio hasRegistered: aTransaction ).
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'pa 6/7/2022 20:54:38'!
test14AnEmptyPortfolioDoesNotHaveAnyTransactionsRegistered
	
	self assert: ( aPortfolio transactions isEmpty ).
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'pa 6/7/2022 20:53:58'!
test15APortfolioWhichHasAnAccountWithATransactionHasItRegistered
	
	| aTransaction |
	
	aTransaction := Deposit register: (10 * peso) on: anAccount. 
	aPortfolio addAccount: anAccount .
	self assert: ( aPortfolio transactions first = aTransaction ).
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'pa 6/7/2022 20:57:34'!
test16APortfolioComposedOfAnotherPorfolioHasAllTheTrasnseferencesOfItsPorfolios
	
	| aTransaction |
	
	aTransaction := Deposit register: (10 * peso) on: anAccount.
	aPortfolio2 addAccount: anAccount .
	aPortfolio addAccount: aPortfolio2 .
	self assert: ( aPortfolio transactions includes: aTransaction ).
	
	! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'testing' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'testing' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'testing' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'testing' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'testing' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'testing' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'testing' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferingTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferingTest
	instanceVariableNames: 'transferingAccount receivingAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferingTest methodsFor: 'as yet unclassified' stamp: 'pa 6/7/2022 23:18:16'!
setUp
	
	receivingAccount := ReceptiveAccount new.
	transferingAccount := ReceptiveAccount new.! !

!TransferingTest methodsFor: 'as yet unclassified' stamp: 'pa 6/7/2022 23:32:48'!
test01canNotTransferZeroPesos
	
	
	self should: [Transference from: transferingAccount anAmount: 0 * peso to: receivingAccount  ]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText = Transference canNotTransferZeroPesosErrorDescription].
	! !

!TransferingTest methodsFor: 'as yet unclassified' stamp: 'pa 6/7/2022 23:33:37'!
test02transferingBetweenAccountsModifiesTheirBalance

	Deposit register: 10 * peso on: transferingAccount .
	Transference from: transferingAccount anAmount: 10 * peso to: receivingAccount.
	self assert: (transferingAccount balance = (0 * peso) and: [receivingAccount balance = (10 * peso)]).! !

!TransferingTest methodsFor: 'as yet unclassified' stamp: 'pa 6/7/2022 23:33:54'!
test03afterTransferingMultipleTimesTheBalanceOfBothAccountsIsCorrect

	Deposit register: 10 * peso on: transferingAccount .
	Transference from: transferingAccount anAmount: 10 * peso to: receivingAccount.
	Transference from: transferingAccount anAmount: 10 * peso to: receivingAccount.
	self assert: (transferingAccount balance = (-10 * peso) and: [receivingAccount balance = (20 * peso)]).! !

!TransferingTest methodsFor: 'as yet unclassified' stamp: 'pa 6/7/2022 23:34:32'!
test04canNotTransferToTheSameAccount

	| anAccount |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: anAccount .
	
	self should: [Transference from: transferingAccount anAmount: 10 * peso to: transferingAccount ]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText = Transference canNotTransferToTheSameAccountErrorDescription].! !

!TransferingTest methodsFor: 'as yet unclassified' stamp: 'pa 6/7/2022 23:35:54'!
test05canNotTransferANegativeAmount

	self should: [Transference from: transferingAccount anAmount: -10 * peso to: receivingAccount]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText = Transference canNotTransferANegativeAmountErrorDescription].! !

!TransferingTest methodsFor: 'as yet unclassified' stamp: 'pa 6/7/2022 23:40:27'!
test06
	
	| transferencia |
	
	transferencia := Transference from: transferingAccount anAmount: 10 * peso to: receivingAccount.
	
	self assert: transferencia value = (10 * peso). ! !

!TransferingTest methodsFor: 'as yet unclassified' stamp: 'pa 6/7/2022 23:40:40'!
test07
	
	| transferencia transferencia2 |
	
	transferencia := Transference from: transferingAccount anAmount: 10 * peso to: receivingAccount.
	transferencia2 := Transference from: transferingAccount anAmount: 5 * peso to: receivingAccount.
	
	self assert: (transferencia value = (10 * peso) and: [ transferencia2 value = (5 * peso)]). ! !


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


!classDefinition: #BankAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #BankAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!BankAccount methodsFor: 'main protocol' stamp: 'pa 6/7/2022 22:07:24'!
balance

	self subclassResponsibility .! !

!BankAccount methodsFor: 'main protocol' stamp: 'pa 6/7/2022 22:08:14'!
hasRegistered: anAccount

	self subclassResponsibility .! !

!BankAccount methodsFor: 'main protocol' stamp: 'pa 6/7/2022 22:20:55'!
transactions

	self subclassResponsibility .! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
BankAccount subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'main protocol' stamp: 'pa 6/7/2022 18:59:51'!
addAccount: aReceptiveAccount 
	
	accounts add: aReceptiveAccount.! !

!Portfolio methodsFor: 'main protocol' stamp: 'pa 6/7/2022 19:24:45'!
balance
	
	^accounts sum: [:account | account balance ] ifEmpty: [ ^0 * peso ].! !

!Portfolio methodsFor: 'main protocol' stamp: 'pa 6/7/2022 19:28:00'!
hasRegistered: aTransaction 
	
	^accounts anySatisfy: [:anAccount | anAccount hasRegistered: aTransaction ].
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'pa 6/7/2022 22:20:05'!
transactions
	
	^accounts inject: OrderedCollection new into:[:allTransactions :account | allTransactions addAll: account transactions ]! !


!Portfolio methodsFor: 'initialize' stamp: 'pa 6/7/2022 18:59:57'!
initialize

	accounts := OrderedCollection new.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
BankAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions transfered'
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



!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'as yet unclassified' stamp: 'pa 6/7/2022 23:38:29'!
initializeWith: anAmount

	value := anAmount .! !

!Transference methodsFor: 'as yet unclassified' stamp: 'pa 6/7/2022 23:39:08'!
value

	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'error description' stamp: 'pa 6/7/2022 23:32:19'!
canNotTransferANegativeAmountErrorDescription
	
	^'can not transfer a negative amount'! !

!Transference class methodsFor: 'error description' stamp: 'pa 6/7/2022 23:32:10'!
canNotTransferToTheSameAccountErrorDescription
	^'can not transfer to the same account'! !

!Transference class methodsFor: 'error description' stamp: 'pa 6/7/2022 23:32:02'!
canNotTransferZeroPesosErrorDescription
	^'can not transfer zero pesos'.! !


!Transference class methodsFor: 'as yet unclassified' stamp: 'pa 6/7/2022 23:38:01'!
from: aTransferingAccount anAmount: anAmount to: aReceivingAccount

	anAmount = 0 ifTrue: [self error: self canNotTransferZeroPesosErrorDescription].
	anAmount < 0 ifTrue: [self error: self canNotTransferANegativeAmountErrorDescription ].
	aReceivingAccount = aTransferingAccount ifTrue: [self error: self canNotTransferToTheSameAccountErrorDescription ].
	Deposit register: anAmount on: aReceivingAccount .
	Withdraw register: anAmount on: aTransferingAccount .
	^Transference new initializeWith: anAmount .! !
