!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'testing' stamp: 'pa 5/30/2022 18:59:57'!
test01TheMarsRoverDoesNotUnderstandInvalidCommands

	self should: [marsRover executeCommand: $h]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText = MarsRover commandNotUnderstoodErrorDescription ].! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pa 5/30/2022 19:00:04'!
test02TheMarsRoverMoveForwardCorrectly

	marsRover executeCommand: $f.
	self assert: marsRover position = (0@1) .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pa 5/30/2022 19:00:23'!
test03TheMarsRoverMoveBackwardsCorrectly

	marsRover executeCommand: $b.
	self assert: marsRover position = (0@-1) .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pa 5/30/2022 19:00:33'!
test04TheMarsRoverRotatesClockwiseCorrectly

	marsRover executeCommand: $r.
	self assert: (marsRover direction isKindOf: EastSensor).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pa 5/30/2022 19:00:40'!
test05TheMarsRoverRotatesCounterClockwiseCorrectly

	marsRover executeCommand: $l.
	self assert: (marsRover direction isKindOf: WestSensor).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pa 5/30/2022 19:00:45'!
test06AfterRotatingMultipleTimesTheMarsRoverIsFacingTheRightDirection

	marsRover executeCommands: 'lllrlr'.
	self assert: (marsRover direction isKindOf: SouthSensor).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pa 5/30/2022 19:00:51'!
test07AfterMovingMultipleTimesTheMarsRoverIsInTheRightPosition

	marsRover executeCommands: 'bfbfbb'.
	self assert: marsRover position = (0@-2).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pa 5/30/2022 19:01:18'!
test08AfterRotatingAndMovingMultipleTimesTheMarsRoverEndsUpInTheCorrectPositionAndDirection

	marsRover executeCommands: 'brblllfbr'.
	"360 noscope"
	self assert: (marsRover position = (-1@-1) and:[marsRover direction isKindOf: WestSensor]).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pa 5/30/2022 19:01:13'!
test09AfterAnInvalidCommandTheMarsRoverStopsExecutingTheRest

	self should: [marsRover executeCommands: 'brXfl']
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText = MarsRover commandNotUnderstoodErrorDescription].
	self assert: [(marsRover position = (0@-1) and:[marsRover direction isKindOf: EastSensor])].! !


!MarsRoverTest methodsFor: 'setup' stamp: 'FRJ 5/29/2022 20:11:33'!
setUp

	marsRover := MarsRover new.! !


!classDefinition: #DirectionSensor category: 'MarsRover'!
Object subclass: #DirectionSensor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!DirectionSensor methodsFor: 'position' stamp: 'FRJ 5/29/2022 20:45:20'!
backwardPositionFrom: currentPosition

	self subclassResponsibility.! !

!DirectionSensor methodsFor: 'position' stamp: 'FRJ 5/29/2022 20:45:33'!
forwardPositionFrom: currentPosition

	self subclassResponsibility.! !


!DirectionSensor methodsFor: 'direction' stamp: 'pa 5/29/2022 19:04:13'!
clockwiseDirection

	self subclassResponsibility.! !

!DirectionSensor methodsFor: 'direction' stamp: 'pa 5/29/2022 19:15:25'!
counterclockwiseDirection

	self subclassResponsibility.! !


!classDefinition: #EastSensor category: 'MarsRover'!
DirectionSensor subclass: #EastSensor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!EastSensor methodsFor: 'position' stamp: 'FRJ 5/29/2022 20:45:20'!
backwardPositionFrom: currentPosition
	
	^currentPosition - (1@0)! !

!EastSensor methodsFor: 'position' stamp: 'FRJ 5/29/2022 20:45:33'!
forwardPositionFrom: currentPosition

	^currentPosition + (1@0).
! !


!EastSensor methodsFor: 'direction' stamp: 'FRJ 5/29/2022 21:05:07'!
clockwiseDirection

	^SouthSensor new.

	! !

!EastSensor methodsFor: 'direction' stamp: 'FRJ 5/29/2022 21:04:37'!
counterclockwiseDirection

	^NorthSensor new.
! !


!classDefinition: #NorthSensor category: 'MarsRover'!
DirectionSensor subclass: #NorthSensor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!NorthSensor methodsFor: 'direction' stamp: 'FRJ 5/29/2022 21:04:24'!
clockwiseDirection

	^EastSensor new.! !

!NorthSensor methodsFor: 'direction' stamp: 'FRJ 5/29/2022 21:05:21'!
counterclockwiseDirection

	^WestSensor new.! !


!NorthSensor methodsFor: 'position' stamp: 'FRJ 5/29/2022 20:45:20'!
backwardPositionFrom: currentPosition

	^currentPosition - (0@1)! !

!NorthSensor methodsFor: 'position' stamp: 'FRJ 5/29/2022 20:45:33'!
forwardPositionFrom: currentPosition

	^currentPosition + (0@1) .
	! !


!classDefinition: #SouthSensor category: 'MarsRover'!
DirectionSensor subclass: #SouthSensor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!SouthSensor methodsFor: 'position' stamp: 'FRJ 5/29/2022 20:45:20'!
backwardPositionFrom: currentPosition

	^currentPosition + (0@1).! !

!SouthSensor methodsFor: 'position' stamp: 'FRJ 5/29/2022 20:45:33'!
forwardPositionFrom: currentPosition

	
	^currentPosition - (0@1).! !


!SouthSensor methodsFor: 'direction' stamp: 'FRJ 5/29/2022 21:05:21'!
clockwiseDirection

	^WestSensor new.! !

!SouthSensor methodsFor: 'direction' stamp: 'FRJ 5/29/2022 21:04:24'!
counterclockwiseDirection

	^EastSensor new.! !


!classDefinition: #WestSensor category: 'MarsRover'!
DirectionSensor subclass: #WestSensor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!WestSensor methodsFor: 'position' stamp: 'FRJ 5/29/2022 20:45:20'!
backwardPositionFrom: currentPosition

	^currentPosition + (1@0).! !

!WestSensor methodsFor: 'position' stamp: 'FRJ 5/29/2022 20:45:33'!
forwardPositionFrom: currentPosition

	^currentPosition - (1@0).! !


!WestSensor methodsFor: 'direction' stamp: 'FRJ 5/29/2022 21:04:36'!
clockwiseDirection

	^NorthSensor new.! !

!WestSensor methodsFor: 'direction' stamp: 'FRJ 5/29/2022 21:05:07'!
counterclockwiseDirection

	^SouthSensor new.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'currentPosition currentDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'movement' stamp: 'FRJ 5/29/2022 20:45:20'!
moveBackwards
	
	currentPosition := currentDirection backwardPositionFrom: currentPosition .
	! !

!MarsRover methodsFor: 'movement' stamp: 'FRJ 5/29/2022 20:45:33'!
moveForward

	currentPosition := currentDirection forwardPositionFrom: currentPosition .
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


!MarsRover methodsFor: 'initialization' stamp: 'FRJ 5/29/2022 21:04:37'!
initialize 
	currentPosition := 0@0.
	currentDirection := NorthSensor new.
	! !


!MarsRover methodsFor: 'private' stamp: 'FRJ 5/29/2022 21:01:42'!
executeCommand: aCommand

	aCommand = $f ifTrue: [^self moveForward].
	aCommand = $b ifTrue: [^self moveBackwards ].
	aCommand = $r ifTrue: [^self rotateClockWise].
	aCommand = $l ifTrue: [^self rotateCounterClockwise].
	
	self error: self class commandNotUnderstoodErrorDescription.
	
	
	! !


!MarsRover methodsFor: 'command' stamp: 'FRJ 5/29/2022 21:02:15'!
executeCommands: commands
	
	commands do: [:command | self executeCommand: command ].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'error descriptions' stamp: 'FRJ 5/29/2022 19:54:14'!
commandNotUnderstoodErrorDescription

	^'Command not understood'.! !
