!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'sentenceFinder foundSentences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FRJ 5/14/2022 12:53:02'!
test01CantFindSentenceWhenItsEmpty

	foundSentences := sentenceFinder find: 'Win'.
	
	self assert: [ foundSentences size = 0].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FRJ 5/14/2022 12:53:17'!
test02CanFindSentenceWhenItsTheOnlyOne

	sentenceFinder add: 'Winter is here'.
	foundSentences := sentenceFinder find: 'Win'.
	
	self assert: [foundSentences first = 'Winter is here'].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FRJ 5/14/2022 12:53:30'!
test03CanFindMultipleSentencesWhenThereIsMultipleValidSentences

	sentenceFinder add: 'Winter is here'	.
	sentenceFinder add: 'Winter is comming'	.
	sentenceFinder add: 'Everything is winning'.
	sentenceFinder add: 'The winds of Winter'	.
	
	foundSentences := sentenceFinder find: 'Win'.

	self assert: [(foundSentences includes: 'Winter is here') and: [foundSentences includes: 'Winter is comming']].
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FRJ 5/14/2022 12:53:41'!
test04CanOnlyAddStrings

	self 
	should: [ sentenceFinder add: 4 ]
	raise: Error
	withExceptionDo: [ :anError |
		self assert: anError messageText = SentenceFinderByPrefix canOnlyRecieveStringsErrorDescription ]
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FRJ 5/14/2022 12:53:48'!
test05PrefixesCanNotContainEmptySpaces

	self 
	should: [ sentenceFinder find: ' ' ]
	raise: Error
	withExceptionDo: [ :anError |
		self assert: anError messageText = SentenceFinderByPrefix prefixesCanNotContainEmptySpacesErrorDescription ]
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FRJ 5/14/2022 12:53:54'!
test06PrefixesCanNotbeEmpty
	
	self 
	should: [ sentenceFinder find: '' ]
	raise: Error
	withExceptionDo: [ :anError |
		self assert: anError messageText = SentenceFinderByPrefix canNotSearchForAnEmptyPrefixErrorDescription ]
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FRJ 5/14/2022 12:54:15'!
test07PrefixesAreKeySensitive
	
	sentenceFinder add: 'Winter is here'	.
	sentenceFinder add: 'mauasa katai'.
	sentenceFinder add: 'winning is Everything'.
	
	foundSentences := sentenceFinder find: 'Win'.
	
	self assert: [ foundSentences size = 1 and: [foundSentences first = 'Winter is here' ]]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FRJ 5/14/2022 12:54:21'!
test08PrefixesCanOnlyBeStrings
	
	self 
	should: [ sentenceFinder find: 4 ]
	raise: Error
	withExceptionDo: [ :anError |
		self assert: anError messageText = SentenceFinderByPrefix canOnlyRecieveStringsErrorDescription ]
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FRJ 5/14/2022 12:54:38'!
test09SentencesWithoutPrefixCanNotBeFound

	sentenceFinder add: ''	.
	sentenceFinder add: ' '	.
	sentenceFinder add: ' Winter'.
	
	foundSentences := sentenceFinder find: 'Win'.

	self assert: [ foundSentences isEmpty ].
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FRJ 5/14/2022 12:54:56'!
test10CanNotFindSentencesWhenPrefixIsLonger

	sentenceFinder add: 'Wind'	.
	sentenceFinder add: 'Win'	.
	
	foundSentences := sentenceFinder find: 'Winter'.

	self assert: [ foundSentences isEmpty ].
! !


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'FRJ 5/14/2022 12:52:43'!
setUp
	
	sentenceFinder := SentenceFinderByPrefix new.! !


!classDefinition: #Node category: 'Stack-Exercise'!
Object subclass: #Node
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'initialization' stamp: 'FRJ 5/12/2022 20:14:22'!
initializeWithElement: anElement andPreviouseNode: aNode

	self subclassResponsibility.! !


!Node methodsFor: 'accesing' stamp: 'FRJ 5/12/2022 20:48:41'!
obtainElement

	self subclassResponsibility .! !

!Node methodsFor: 'accesing' stamp: 'pa 5/13/2022 23:44:48'!
previouseNode

	self subclassResponsibility .! !


!Node methodsFor: 'error handling' stamp: 'pa 5/13/2022 23:41:53'!
ifNullNodeRaiseError: anError

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Node class' category: 'Stack-Exercise'!
Node class
	instanceVariableNames: ''!

!Node class methodsFor: 'instance creation' stamp: 'pa 5/13/2022 23:18:27'!
canInstance

	self subclassResponsibility.! !

!Node class methodsFor: 'instance creation' stamp: 'pa 5/13/2022 23:21:59'!
withElement: anElement andPreviouseNode: aNode

	| newNodeClass |

	newNodeClass := self subclasses detect: [:subclass | subclass canInstance: aNode ].
	^newNodeClass new initializeWithElement: anElement andPreviouseNode: aNode.
	
	
	! !


!classDefinition: #ActiveNode category: 'Stack-Exercise'!
Node subclass: #ActiveNode
	instanceVariableNames: 'previouseNode element'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ActiveNode methodsFor: 'initialization' stamp: 'FRJ 5/12/2022 20:13:13'!
initializeWithElement: anElement andPreviouseNode: unNodo 

	element := anElement.
	previouseNode := unNodo.! !


!ActiveNode methodsFor: 'accessing' stamp: 'FRJ 5/12/2022 20:47:27'!
obtainElement

	^element! !

!ActiveNode methodsFor: 'accessing' stamp: 'pa 5/13/2022 23:26:51'!
previouseNode

	^previouseNode ! !


!ActiveNode methodsFor: 'error handling' stamp: 'pa 5/13/2022 23:41:27'!
ifNullNodeRaiseError: anError

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ActiveNode class' category: 'Stack-Exercise'!
ActiveNode class
	instanceVariableNames: ''!

!ActiveNode class methodsFor: 'instance creation' stamp: 'pa 5/13/2022 23:18:05'!
canInstance: aNode
	
	^aNode class superclass = Node.! !


!classDefinition: #NullNode category: 'Stack-Exercise'!
Node subclass: #NullNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullNode methodsFor: 'initialization' stamp: 'FRJ 5/12/2022 20:15:58'!
initializeWithElement: anElement andPreviouseNode: unNodo ! !


!NullNode methodsFor: 'error handling' stamp: 'pa 5/13/2022 23:41:18'!
ifNullNodeRaiseError: anError

	 self error: anError.! !


!NullNode methodsFor: 'accesing' stamp: 'pa 5/13/2022 23:19:20'!
obtainElement

	^self class error: self class canNotObtainElementFromNullNodeErrorDescription.! !

!NullNode methodsFor: 'accesing' stamp: 'pa 5/13/2022 23:27:00'!
previouseNode! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NullNode class' category: 'Stack-Exercise'!
NullNode class
	instanceVariableNames: ''!

!NullNode class methodsFor: 'instance creation' stamp: 'pa 5/14/2022 17:07:20'!
canInstance: aNode

	^(ActiveNode canInstance: aNode)not.! !


!NullNode class methodsFor: 'error descriptions' stamp: 'pa 5/13/2022 23:19:53'!
canNotObtainElementFromNullNodeErrorDescription

	^ 'canNotObtainElementFromNullNode'! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'lastNode size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'pa 5/13/2022 23:32:37'!
isEmpty

	^size = 0.! !


!OOStack methodsFor: 'initialization' stamp: 'pa 5/13/2022 23:30:48'!
initialize

	lastNode := Node withElement: nil andPreviouseNode: nil.
	size := 0! !


!OOStack methodsFor: 'operations' stamp: 'pa 5/13/2022 23:43:55'!
pop

	| poppedElement |

	poppedElement := self top.
	lastNode := lastNode previouseNode.
	size := size -1. 

	^poppedElement .! !

!OOStack methodsFor: 'operations' stamp: 'pa 5/13/2022 23:31:37'!
push: anElement

	lastNode := Node withElement: anElement  andPreviouseNode: lastNode.
	size := size + 1.
! !

!OOStack methodsFor: 'operations' stamp: 'pa 5/13/2022 23:40:36'!
top
	
	lastNode ifNullNodeRaiseError: self class stackEmptyErrorDescription.

	^lastNode obtainElement .
! !


!OOStack methodsFor: 'accesing' stamp: 'pa 5/13/2022 23:30:39'!
size

	^size.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #Prefix category: 'Stack-Exercise'!
Object subclass: #Prefix
	instanceVariableNames: 'string'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prefix class' category: 'Stack-Exercise'!
Prefix class
	instanceVariableNames: ''!

!Prefix class methodsFor: 'as yet unclassified' stamp: 'pa 5/14/2022 17:03:53'!
canInstance! !

!Prefix class methodsFor: 'as yet unclassified' stamp: 'pa 5/14/2022 17:02:51'!
with: aString

	| newPrefixClass |

	newPrefixClass := self subclasses detect: [:subclass | subclass canInstance: aString ].
	^newPrefixClass new initializeWith: aString .! !


!classDefinition: #NullPrefix category: 'Stack-Exercise'!
Prefix subclass: #NullPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NullPrefix class' category: 'Stack-Exercise'!
NullPrefix class
	instanceVariableNames: ''!

!NullPrefix class methodsFor: 'as yet unclassified' stamp: 'pa 5/14/2022 17:03:32'!
canInstance
! !


!classDefinition: #ValidPrefix category: 'Stack-Exercise'!
Prefix subclass: #ValidPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ValidPrefix class' category: 'Stack-Exercise'!
ValidPrefix class
	instanceVariableNames: ''!

!ValidPrefix class methodsFor: 'as yet unclassified' stamp: 'pa 5/14/2022 17:11:15'!
canInstance
! !

!ValidPrefix class methodsFor: 'as yet unclassified' stamp: 'pa 5/14/2022 17:10:23'!
canInstance: aPrefix

(aPrefix isKindOf: String) ifFalse: [ self error: self class canOnlyRecieveStringsErrorDescription ].
	aPrefix isEmpty ifTrue: [ self error: self class canNotSearchForAnEmptyPrefixErrorDescription ].
	(aPrefix allSatisfy: [:letter | letter ~= $ ]) ifFalse: [
		 self error: self class prefixesCanNotContainEmptySpacesErrorDescription ].! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'sentencesStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'pa 5/14/2022 00:28:03'!
initialize

	sentencesStack := OOStack new.
	! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'FRJ 5/14/2022 12:11:15'!
add: aSentence

	(aSentence isKindOf: String) ifFalse: [ self error: self class canOnlyRecieveStringsErrorDescription ].
	
	sentencesStack push: aSentence.
	! !

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'pa 5/14/2022 16:56:33'!
checkPrefix: aPrefix

	(aPrefix isKindOf: String) ifFalse: [ self error: self class canOnlyRecieveStringsErrorDescription ].
	aPrefix isEmpty ifTrue: [ self error: self class canNotSearchForAnEmptyPrefixErrorDescription ].
	(aPrefix allSatisfy: [:letter | letter ~= $ ]) ifFalse: [
		 self error: self class prefixesCanNotContainEmptySpacesErrorDescription ].
	! !

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'pa 5/14/2022 16:56:03'!
find: aPrefix
	
	| invertedStack validSentences aSentence |
	
	self checkPrefix: aPrefix.
	
	invertedStack := OOStack new.
	validSentences := OrderedCollection new.
	
	"1 to: sentencesStack size do:[]."
	
	[sentencesStack isEmpty] whileFalse: [
		aSentence := sentencesStack pop.
		invertedStack push: aSentence.
		(self sentence: aSentence StartsWithPrefix: aPrefix) ifTrue: [ validSentences add: aSentence ].
		].
	
	[invertedStack isEmpty] whileFalse: [
		sentencesStack push: invertedStack pop.
	].
	
	^validSentences.
	
	! !

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'FRJ 5/14/2022 12:36:58'!
sentence: aSentence StartsWithPrefix: aPrefix

	| result |

	result := true.
	
	aPrefix size > aSentence size ifTrue: [ ^false ].
	
	1 to: (aPrefix size) do: [:index | result := result and: [(aPrefix at: index) = (aSentence at: index)] ].

	^result.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'FRJ 5/14/2022 12:05:22'!
canNotSearchForAnEmptyPrefixErrorDescription

	^'Can not search for an empty prefix'.! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'FRJ 5/14/2022 12:11:20'!
canOnlyRecieveStringsErrorDescription

	^'Can only recieve strings'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'FRJ 5/14/2022 12:05:08'!
prefixesCanNotContainEmptySpacesErrorDescription

	^ 'Prefixes can not contain empty spaces'.! !