!classDefinition: #MarsRoverTest category: 'mars-rover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'mars-rover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:28:44'!
test01TheMarsRoverStartsAtTheCorrectPosition

	| marsRover |
	
	marsRover  := MarsRover new. 
	
	self assert: [marsRover position = (0@0)].! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:28:10'!
test02TheMarsRoverStartsPointingAtTheRightDirection

	| marsRover |
	
	marsRover  := MarsRover new. 
	
	self assert: [marsRover direction isKindOf: North ].! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 18:19:56'!
test03TheMarsRoverMoveForwardCorrectly

	| marsRover |
	
	marsRover  := MarsRover new. 
	marsRover comand: $f.
	self assert: [ marsRover position = (0@1) ].! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 18:12:48'!
test04TheMarsRoverMoveBackwardsCorrectly

	| marsRover |
	
	marsRover  := MarsRover new. 
	marsRover comand: $b.
	self assert: [ marsRover position = (0@-1) ].! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:29:22'!
test05TheMarsRoverRotatesClockwiseCorrectly

	| marsRover |
	
	marsRover  := MarsRover new. 
	marsRover comand: $r.
	self assert: [ marsRover direction isKindOf: East].! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:29:45'!
test06TheMarsRoverRotatesCounterClockwiseCorrectly

	| marsRover |
	
	marsRover  := MarsRover new. 
	marsRover comand: $l.
	self assert: [ marsRover direction isKindOf: West].! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:30:05'!
test07AfterRotatingMultipleTimesTheMarsRoverIsFacingTheRightDirection

	| marsRover |
	
	marsRover  := MarsRover new. 
	marsRover comand: $l.
	marsRover comand: $l.
	marsRover comand: $l.
	marsRover comand: $r.
	marsRover comand: $l.
	marsRover comand: $r.
	self assert: [ marsRover direction isKindOf: South].! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 18:38:40'!
test08AfterMovingMultipleTimesTheMarsRoverIsInTheRightPosition

	| marsRover |
	
	marsRover  := MarsRover new. 
	marsRover comand: $b.
	marsRover comand: $f.
	marsRover comand: $b.
	marsRover comand: $f.
	marsRover comand: $b.
	marsRover comand: $b.
	self assert: [ marsRover position = (0@-2)].! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:30:29'!
test09AfterRotatingAndMovingMultipleTimesTheMarsRoverEndsUpInTheCorrectPositionAndDirection

	| marsRover |
	
	marsRover  := MarsRover new. 
	marsRover comand: $b.
	marsRover comand: $r.
	marsRover comand: $b.
	marsRover comand: $l.
	marsRover comand: $l.
	marsRover comand: $l.
	marsRover comand: $f.
	marsRover comand: $b.
	marsRover comand: $r.
	"360 noscope"
	self assert: [ marsRover position = (-1@-1) and:[marsRover direction isKindOf: West]].! !


!classDefinition: #Direction category: 'mars-rover'!
Object subclass: #Direction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'mars-rover'!

!Direction methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:07:20'!
backwardPosition: currentPosition

	self subclassResponsibility.! !

!Direction methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:04:13'!
clockwiseDirection

	self subclassResponsibility.! !

!Direction methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:15:25'!
counterclockwiseDirection

	self subclassResponsibility.! !

!Direction methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:10:36'!
forwardPosition: currentPosition

	self subclassResponsibility.! !


!classDefinition: #East category: 'mars-rover'!
Direction subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'mars-rover'!

!East methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:06:46'!
backwardPosition: currentPosition
	
	^currentPosition - (1@0)! !

!East methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:16:51'!
clockwiseDirection

	^South new.

	! !

!East methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:21:39'!
counterclockwiseDirection

	^North new.
! !

!East methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:20:48'!
forwardPosition: currentPosition

	^currentPosition + (1@0).
! !


!classDefinition: #North category: 'mars-rover'!
Direction subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'mars-rover'!

!North methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:08:18'!
backwardPosition: currentPosition

	^currentPosition - (0@1)! !

!North methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:17:23'!
clockwiseDirection

	^East new.! !

!North methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:21:58'!
counterclockwiseDirection

	^West new.! !

!North methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:11:56'!
forwardPosition: currentPosition

	^currentPosition + (0@1) .
	! !


!classDefinition: #South category: 'mars-rover'!
Direction subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'mars-rover'!

!South methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:09:09'!
backwardPosition: currentPosition

	^currentPosition + (0@1).! !

!South methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:18:34'!
clockwiseDirection

	^West new.! !

!South methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:22:22'!
counterclockwiseDirection

	^East new.! !

!South methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:12:21'!
forwardPosition: currentPosition

	
	^currentPosition - (0@1).! !


!classDefinition: #West category: 'mars-rover'!
Direction subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'mars-rover'!

!West methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:09:31'!
backwardPosition: currentPosition

	^currentPosition + (1@0).! !

!West methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:19:12'!
clockwiseDirection

	^North new.! !

!West methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:22:39'!
counterclockwiseDirection

	^South new.! !

!West methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:12:40'!
forwardPosition: currentPosition

	^currentPosition - (1@0).! !


!classDefinition: #MarsRover category: 'mars-rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'currentPosition currentDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'mars-rover'!

!MarsRover methodsFor: 'movement' stamp: 'pa 5/29/2022 19:31:25'!
moveBackwards
	
	currentPosition := currentDirection backwardPosition: currentPosition .
	! !

!MarsRover methodsFor: 'movement' stamp: 'pa 5/29/2022 19:31:25'!
moveForward

	currentPosition := currentDirection forwardPosition: currentPosition .
! !

!MarsRover methodsFor: 'movement' stamp: 'pa 5/29/2022 19:31:25'!
rotateClockWise

	currentDirection := currentDirection clockwiseDirection.! !

!MarsRover methodsFor: 'movement' stamp: 'pa 5/29/2022 19:31:25'!
rotateCounterClockwise

	currentDirection := currentDirection counterclockwiseDirection .
	! !


!MarsRover methodsFor: 'accessing' stamp: 'pa 5/29/2022 19:31:25'!
direction
	^currentDirection.! !

!MarsRover methodsFor: 'accessing' stamp: 'pa 5/29/2022 19:31:01'!
position 
	^currentPosition 
	! !


!MarsRover methodsFor: 'initialization' stamp: 'pa 5/29/2022 19:31:25'!
initialize 
	currentPosition := 0@0.
	currentDirection := North new.
	! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'pa 5/29/2022 19:14:23'!
comand: anInstruction
	anInstruction = $f ifTrue: [self moveForward].
	anInstruction = $b ifTrue: [self moveBackwards ].
	anInstruction = $r ifTrue: [self rotateClockWise].
	anInstruction = $l ifTrue: [self rotateCounterClockwise].
	! !
