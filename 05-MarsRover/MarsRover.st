!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'testing' stamp: 'FRJ 5/29/2022 20:10:38'!
test01TheMarsRoverStartsAtTheCorrectPosition

	self assert: marsRover position = (0@0).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FRJ 5/29/2022 20:10:37'!
test02TheMarsRoverStartsPointingAtTheRightDirection

	self assert: (marsRover direction isKindOf: North).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FRJ 5/29/2022 20:24:20'!
test03TheMarsRoverDoesNotUnderstandInvalidCommands

	self should: [marsRover command: $h]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText = MarsRover commandNotUnderstoodErrorDescription ].! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FRJ 5/29/2022 20:10:38'!
test04TheMarsRoverMoveForwardCorrectly

	marsRover command: $f.
	self assert: marsRover position = (0@1) .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FRJ 5/29/2022 20:10:38'!
test05TheMarsRoverMoveBackwardsCorrectly

	marsRover command: $b.
	self assert: marsRover position = (0@-1) .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FRJ 5/29/2022 20:10:38'!
test06TheMarsRoverRotatesClockwiseCorrectly

	marsRover command: $r.
	self assert: (marsRover direction isKindOf: East).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FRJ 5/29/2022 20:10:38'!
test07TheMarsRoverRotatesCounterClockwiseCorrectly

	marsRover command: $l.
	self assert: (marsRover direction isKindOf: West).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FRJ 5/29/2022 20:17:03'!
test08AfterRotatingMultipleTimesTheMarsRoverIsFacingTheRightDirection

	marsRover commands: 'lllrlr'.
	self assert: (marsRover direction isKindOf: South).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FRJ 5/29/2022 20:17:32'!
test09AfterMovingMultipleTimesTheMarsRoverIsInTheRightPosition

	marsRover commands: 'bfbfbb'.
	self assert: marsRover position = (0@-2).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FRJ 5/29/2022 20:17:53'!
test10AfterRotatingAndMovingMultipleTimesTheMarsRoverEndsUpInTheCorrectPositionAndDirection

	marsRover commands: 'brblllfbr'.
	"360 noscope"
	self assert: (marsRover position = (-1@-1) and:[marsRover direction isKindOf: West]).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FRJ 5/29/2022 20:27:09'!
test11AfterAnInvalidCommandTheMarsRoverStopsExecutingTheRest

	self should: [marsRover commands: 'brXfl']
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText = MarsRover commandNotUnderstoodErrorDescription].
	self assert: [(marsRover position = (0@-1) and:[marsRover direction isKindOf: East])].! !


!MarsRoverTest methodsFor: 'setup' stamp: 'FRJ 5/29/2022 20:11:33'!
setUp

	marsRover := MarsRover new.! !


!classDefinition: #Direction category: 'MarsRover'!
Object subclass: #Direction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

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


!classDefinition: #East category: 'MarsRover'!
Direction subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

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


!classDefinition: #North category: 'MarsRover'!
Direction subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

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


!classDefinition: #South category: 'MarsRover'!
Direction subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

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


!classDefinition: #West category: 'MarsRover'!
Direction subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

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


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'currentPosition currentDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

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


!MarsRover methodsFor: 'as yet unclassified' stamp: 'FRJ 5/29/2022 20:01:25'!
command: anInstruction

	anInstruction = $f ifTrue: [^self moveForward].
	anInstruction = $b ifTrue: [^self moveBackwards ].
	anInstruction = $r ifTrue: [^self rotateClockWise].
	anInstruction = $l ifTrue: [^self rotateCounterClockwise].
	
	self error: self class commandNotUnderstoodErrorDescription.
	
	
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'FRJ 5/29/2022 20:16:40'!
commands: instructions
	
	instructions do: [:instruction | self command: instruction ].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'error descriptions' stamp: 'FRJ 5/29/2022 19:54:14'!
commandNotUnderstoodErrorDescription

	^'Command not understood'.! !
