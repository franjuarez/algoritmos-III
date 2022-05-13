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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #Node category: 'Stack-Exercise'!
Object subclass: #Node
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'initialization' stamp: 'FRJ 5/12/2022 20:14:22'!
initializeWithElement: anElement andPreviouseNode: aNode

	self subclassResponsibility.! !


!Node methodsFor: 'as yet unclassified' stamp: 'FRJ 5/12/2022 20:48:41'!
obtainElement

	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Node class' category: 'Stack-Exercise'!
Node class
	instanceVariableNames: ''!

!Node class methodsFor: 'as yet unclassified' stamp: 'FRJ 5/12/2022 20:55:55'!
withElement: anElement andPreviouseNode: aNode

	self subclasses detect: [:subclass | subclass canInstance: aNode ].
	
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


!ActiveNode methodsFor: 'as yet unclassified' stamp: 'FRJ 5/12/2022 20:47:27'!
obtainElement

	^element! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ActiveNode class' category: 'Stack-Exercise'!
ActiveNode class
	instanceVariableNames: ''!

!ActiveNode class methodsFor: 'as yet unclassified' stamp: 'FRJ 5/12/2022 20:52:53'!
canInstance: aNode
	
	^aNode class superclass isKindOf: Node.! !


!classDefinition: #NullNode category: 'Stack-Exercise'!
Node subclass: #NullNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullNode methodsFor: 'initialization' stamp: 'FRJ 5/12/2022 20:15:58'!
initializeWithElement: anElement andPreviouseNode: unNodo ! !


!NullNode methodsFor: 'as yet unclassified' stamp: 'FRJ 5/12/2022 20:49:06'!
obtainElement

	^nil.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NullNode class' category: 'Stack-Exercise'!
NullNode class
	instanceVariableNames: ''!

!NullNode class methodsFor: 'as yet unclassified' stamp: 'FRJ 5/12/2022 20:53:50'!
canInstance: aNode

	^aNode class superclass isKindOf: Node.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'lastElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'FRJ 5/12/2022 20:51:42'!
isEmpty

	^lastElement class isKindOf: NullNode.! !


!OOStack methodsFor: 'initialization' stamp: 'FRJ 5/12/2022 20:50:58'!
initialize

	lastElement := Node withElement: nil andPreviouseNode: nil.! !


!OOStack methodsFor: 'stack operations' stamp: 'FRJ 5/10/2022 22:25:21'!
pop

	self isEmpty ifTrue: [ self error: self class stackEmptyErrorDescription ].

	^elements removeLast.! !

!OOStack methodsFor: 'stack operations' stamp: 'FRJ 5/10/2022 22:12:20'!
push: anObject

	elements addLast: anObject.
! !

!OOStack methodsFor: 'stack operations' stamp: 'FRJ 5/10/2022 22:27:58'!
top

	self isEmpty ifTrue: [ self error: self class stackEmptyErrorDescription ].

	^elements last.
! !


!OOStack methodsFor: 'accesing' stamp: 'FRJ 5/10/2022 22:21:52'!
size

	^elements size.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
