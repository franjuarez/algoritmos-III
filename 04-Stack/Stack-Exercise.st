!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'LimitedStack tests' stamp: 'FRJ 5/16/2022 17:23:56'!
test01LimitedStackIsEmptyAndMaximumSizeIsCorrectWhenCreated

	| limitedStack |
	
	limitedStack := LimitedStack withLimit: 5.
	
	self assert: (limitedStack isEmpty and: [limitedStack limit = 5]).! !

!OOStackTest methodsFor: 'LimitedStack tests' stamp: 'FRJ 5/16/2022 17:24:01'!
test02CanNotPushIfStackIsFull

	| limitedStack |
	
	limitedStack := LimitedStack withLimit: 1.
	limitedStack push:1.
	
	self
		should: [ limitedStack push: 1]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = LimitedStack stackIsFullErrorDescription ]! !

!OOStackTest methodsFor: 'LimitedStack tests' stamp: 'FRJ 5/16/2022 17:24:07'!
test03LimitCanNotBeNegative
	
	self
		should: [  LimitedStack withLimit: -1.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = LimitedStack maximumSizeCanNotBeLessThanZeroErrorDescription ].! !

!OOStackTest methodsFor: 'LimitedStack tests' stamp: 'FRJ 5/16/2022 17:24:12'!
test04CanNeverPushIfLimitIsZero

	| limitedStack |
	
	limitedStack := LimitedStack withLimit: 0.
	
	self
		should: [ limitedStack push: 1]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = LimitedStack stackIsFullErrorDescription ]! !


!OOStackTest methodsFor: 'general Stack tests' stamp: 'FRJ 5/16/2022 17:22:15'!
test01StackShouldBeEmptyWhenCreated

	| unlimitedStack |
	
	unlimitedStack := UnlimitedStack new.
	
	self assert: unlimitedStack isEmpty! !

!OOStackTest methodsFor: 'general Stack tests' stamp: 'FRJ 5/16/2022 17:22:25'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := UnlimitedStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'general Stack tests' stamp: 'FRJ 5/16/2022 17:22:35'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := UnlimitedStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'general Stack tests' stamp: 'FRJ 5/16/2022 17:22:44'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := UnlimitedStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'general Stack tests' stamp: 'FRJ 5/16/2022 17:23:03'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := UnlimitedStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'general Stack tests' stamp: 'FRJ 5/16/2022 17:23:17'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := UnlimitedStack new .
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'general Stack tests' stamp: 'FRJ 5/16/2022 17:23:21'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := UnlimitedStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'general Stack tests' stamp: 'FRJ 5/16/2022 17:23:28'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := UnlimitedStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'general Stack tests' stamp: 'FRJ 5/16/2022 17:23:33'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := UnlimitedStack new .
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'general Stack tests' stamp: 'FRJ 5/16/2022 17:23:39'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := UnlimitedStack new.
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

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FRJ 5/16/2022 11:13:25'!
test02CanFindSentenceWhenItsTheOnlyOne

	sentenceFinder add: 'Winter is here'.
	foundSentences := sentenceFinder find: 'Win'.
	
	self assert: [foundSentences includes: 'Winter is here'].! !

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

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FRJ 5/16/2022 11:13:04'!
test07PrefixesAreKeySensitive
	
	sentenceFinder add: 'Winter is here'	.
	sentenceFinder add: 'mauasa katai'.
	sentenceFinder add: 'winning is Everything'.
	
	foundSentences := sentenceFinder find: 'Win'.
	
	self assert: [ foundSentences size = 1 and: [foundSentences includes: 'Winter is here' ]]! !

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

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FRJ 5/16/2022 11:12:35'!
test11CanFindSentencesThatAreTheSameAsPrefix

	sentenceFinder add: 'Win'	.
	
	foundSentences := sentenceFinder find: 'Win'.

	self assert: [ foundSentences includes: 'Win' ].
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

!OOStack methodsFor: 'testing' stamp: 'pa 5/16/2022 15:47:09'!
canPush

	self subclassResponsibility.! !

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

!OOStack methodsFor: 'operations' stamp: 'pa 5/16/2022 16:04:26'!
push: anElement

	self canPush ifFalse: [^self error: LimitedStack stackIsFullErrorDescription ].
	
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


!classDefinition: #LimitedStack category: 'Stack-Exercise'!
OOStack subclass: #LimitedStack
	instanceVariableNames: 'maximumSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!LimitedStack methodsFor: 'initialization' stamp: 'FRJ 5/16/2022 12:30:10'!
initializeWith: maximumCapacity

	maximumSize := maximumCapacity.! !


!LimitedStack methodsFor: 'accesing' stamp: 'FRJ 5/16/2022 12:31:46'!
limit

	^maximumSize ! !


!LimitedStack methodsFor: 'testing' stamp: 'pa 5/16/2022 15:45:59'!
canPush

	^size < maximumSize ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LimitedStack class' category: 'Stack-Exercise'!
LimitedStack class
	instanceVariableNames: ''!

!LimitedStack class methodsFor: 'error descriptions' stamp: 'pa 5/16/2022 16:11:10'!
maximumSizeCanNotBeLessThanZeroErrorDescription

	^'Maximum size can not be less than zero'! !

!LimitedStack class methodsFor: 'error descriptions' stamp: 'pa 5/16/2022 16:01:08'!
stackIsFullErrorDescription

	^'Stack is full'! !


!LimitedStack class methodsFor: 'instance creation' stamp: 'pa 5/16/2022 16:10:33'!
withLimit: maximumCapacity

	maximumCapacity < 0 ifTrue: [self error: self maximumSizeCanNotBeLessThanZeroErrorDescription].  
	^self new initializeWith: maximumCapacity.! !


!classDefinition: #UnlimitedStack category: 'Stack-Exercise'!
OOStack subclass: #UnlimitedStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!UnlimitedStack methodsFor: 'testing' stamp: 'pa 5/16/2022 15:45:21'!
canPush

	^true! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'sentencesStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'FRJ 5/16/2022 17:28:22'!
initialize

	sentencesStack := UnlimitedStack new.
	! !


!SentenceFinderByPrefix methodsFor: 'checking' stamp: 'FRJ 5/16/2022 11:05:16'!
checkPrefix: aPrefix

	self ifCondition: (aPrefix isKindOf: String) not raiseError: self class canOnlyRecieveStringsErrorDescription.
	self ifCondition: aPrefix isEmpty raiseError: self class canNotSearchForAnEmptyPrefixErrorDescription.
	self ifCondition: (aPrefix allSatisfy: [:letter | letter ~= $ ]) not raiseError: self class prefixesCanNotContainEmptySpacesErrorDescription.
	! !

!SentenceFinderByPrefix methodsFor: 'checking' stamp: 'FRJ 5/16/2022 10:59:31'!
ifCondition: aCondition raiseError: anError

	aCondition ifTrue: [ self error: anError ].
	! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'FRJ 5/16/2022 11:05:50'!
add: aSentence

	self ifCondition: (aSentence isKindOf: String) not raiseError: self class canOnlyRecieveStringsErrorDescription.
	
	sentencesStack push: aSentence.
	! !

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'pa 5/14/2022 17:50:45'!
find: aPrefix
	
	self checkPrefix: aPrefix.
	
	^self obtainValidSentences: sentencesStack acordingToCondition: [:aSentence | self sentence: aSentence StartsWithPrefix: aPrefix]
	! !

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'FRJ 5/16/2022 10:50:43'!
obtainValidSentences: sentences acordingToCondition: aCondition
	
	| validSentences |
	
	validSentences := self invertSentencesAndObtainSentencesAcordingToCondition: aCondition.
	
	self invertSentencesAndObtainSentencesAcordingToCondition: nil.
	
	^validSentences.
	
	! !

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'FRJ 5/16/2022 11:09:02'!
sentence: aSentence StartsWithPrefix: aPrefix

	| result |

	aPrefix size > aSentence size ifTrue: [ ^false ].

	result := true.
	
	1 to: (aPrefix size) do: [:index | result := result and: [(aPrefix at: index) = (aSentence at: index)] ].

	^result.! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'FRJ 5/16/2022 17:31:22'!
invertSentencesAndObtainSentencesAcordingToCondition: aCondition
	
	| invertedStack validSentences aSentence|
	
	invertedStack := UnlimitedStack new.
	validSentences := OrderedCollection new.
	
	(aCondition isKindOf: BlockClosure) ifFalse: 
	[^ self invertSentencesAndObtainSentencesAcordingToCondition: [:nothing | false]].
	
	[sentencesStack isEmpty] whileFalse: [
		aSentence := sentencesStack pop.
		invertedStack push: aSentence.
		(aCondition value: aSentence) ifTrue: [ validSentences add: aSentence ].
		].
	
	sentencesStack := invertedStack.
	 
	^validSentences.
	
	! !

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
