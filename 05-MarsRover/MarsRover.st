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

!MarsRoverTest methodsFor: 'testing' stamp: 'pa 5/31/2022 23:30:09'!
test02TheMarsRoverMoveForwardCorrectly

	marsRover executeCommand: $f.
	self assert: marsRover currentPosition = (0@1) .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pa 5/31/2022 23:30:09'!
test03TheMarsRoverMoveBackwardsCorrectly

	marsRover executeCommand: $b.
	self assert: marsRover currentPosition = (0@-1) .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pa 5/31/2022 23:14:25'!
test04TheMarsRoverRotatesClockwiseCorrectly

	marsRover executeCommand: $r.
	self assert: (marsRover currentDirection isKindOf: FacingEast).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pa 5/31/2022 23:15:00'!
test05TheMarsRoverRotatesCounterClockwiseCorrectly

	marsRover executeCommand: $l.
	self assert: (marsRover currentDirection isKindOf: FacingWest).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pa 5/31/2022 23:14:48'!
test06AfterRotatingMultipleTimesTheMarsRoverIsFacingTheRightDirection

	marsRover executeCommands: 'lllrlr'.
	self assert: (marsRover currentDirection isKindOf: FacingSouth).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pa 5/31/2022 23:30:09'!
test07AfterMovingMultipleTimesTheMarsRoverIsInTheRightPosition

	marsRover executeCommands: 'bfbfbb'.
	self assert: marsRover currentPosition = (0@-2).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pa 5/31/2022 23:30:09'!
test08AfterRotatingAndMovingMultipleTimesTheMarsRoverEndsUpInTheCorrectPositionAndDirection

	marsRover executeCommands: 'brblllfbr'.
	"360 noscope"
	self assert: (marsRover currentPosition = (-1@-1) and:[marsRover currentDirection isKindOf: FacingWest]).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pa 5/31/2022 23:30:09'!
test09AfterAnInvalidCommandTheMarsRoverStopsExecutingTheRest

	self should: [marsRover executeCommands: 'brXfl']
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText = MarsRover commandNotUnderstoodErrorDescription].
	self assert: [(marsRover currentPosition = (0@-1) and:[marsRover currentDirection isKindOf: FacingEast])].! !


!MarsRoverTest methodsFor: 'setup' stamp: 'FRJ 5/29/2022 20:11:33'!
setUp

	marsRover := MarsRover new.! !


!classDefinition: #Compass category: 'MarsRover'!
Object subclass: #Compass
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Compass methodsFor: 'direction' stamp: 'pa 5/29/2022 19:04:13'!
clockwiseDirection

	self subclassResponsibility.! !

!Compass methodsFor: 'direction' stamp: 'pa 5/29/2022 19:15:25'!
counterclockwiseDirection

	self subclassResponsibility.! !

!Compass methodsFor: 'direction' stamp: 'pa 5/31/2022 23:03:16'!
currentCardinalDirection

	self subclassResponsibility.! !


!classDefinition: #FacingEast category: 'MarsRover'!
Compass subclass: #FacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!FacingEast methodsFor: 'direction' stamp: 'pa 5/31/2022 23:14:48'!
clockwiseDirection

	^FacingSouth new.

	! !

!FacingEast methodsFor: 'direction' stamp: 'pa 5/31/2022 23:14:37'!
counterclockwiseDirection

	^FacingNorth new.
! !

!FacingEast methodsFor: 'direction' stamp: 'pa 5/31/2022 23:02:36'!
currentCardinalDirection

	^1@0! !


!classDefinition: #FacingNorth category: 'MarsRover'!
Compass subclass: #FacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!FacingNorth methodsFor: 'direction' stamp: 'pa 5/31/2022 23:14:25'!
clockwiseDirection

	^FacingEast new.! !

!FacingNorth methodsFor: 'direction' stamp: 'pa 5/31/2022 23:15:00'!
counterclockwiseDirection

	^FacingWest new.! !

!FacingNorth methodsFor: 'direction' stamp: 'pa 5/31/2022 23:03:16'!
currentCardinalDirection

	^0@1.! !


!classDefinition: #FacingSouth category: 'MarsRover'!
Compass subclass: #FacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!FacingSouth methodsFor: 'direction' stamp: 'pa 5/31/2022 23:15:00'!
clockwiseDirection

	^FacingWest new.! !

!FacingSouth methodsFor: 'direction' stamp: 'pa 5/31/2022 23:14:25'!
counterclockwiseDirection

	^FacingEast new.! !

!FacingSouth methodsFor: 'direction' stamp: 'pa 5/31/2022 23:03:16'!
currentCardinalDirection

	^0@-1! !


!classDefinition: #FacingWest category: 'MarsRover'!
Compass subclass: #FacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!FacingWest methodsFor: 'direction' stamp: 'pa 5/31/2022 23:14:37'!
clockwiseDirection

	^FacingNorth new.! !

!FacingWest methodsFor: 'direction' stamp: 'pa 5/31/2022 23:14:48'!
counterclockwiseDirection

	^FacingSouth new.! !

!FacingWest methodsFor: 'direction' stamp: 'pa 5/31/2022 23:03:16'!
currentCardinalDirection

	^-1@0.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'currentPosition currentDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'movement' stamp: 'pa 5/31/2022 23:21:27'!
moveBackwards
	
	currentPosition := currentPosition - currentDirection currentCardinalDirection.
	! !

!MarsRover methodsFor: 'movement' stamp: 'pa 5/31/2022 23:09:59'!
moveForward

	currentPosition := currentPosition + currentDirection currentCardinalDirection .
! !

!MarsRover methodsFor: 'movement' stamp: 'pa 5/29/2022 19:31:25'!
rotateClockWise

	currentDirection := currentDirection clockwiseDirection.! !

!MarsRover methodsFor: 'movement' stamp: 'pa 5/29/2022 19:31:25'!
rotateCounterClockwise

	currentDirection := currentDirection counterclockwiseDirection .
	! !


!MarsRover methodsFor: 'accessing' stamp: 'pa 5/31/2022 23:08:46'!
currentDirection
	^currentDirection.! !

!MarsRover methodsFor: 'accessing' stamp: 'pa 5/31/2022 23:30:09'!
currentPosition 
	^currentPosition.
	! !


!MarsRover methodsFor: 'initialization' stamp: 'pa 5/31/2022 23:14:37'!
initialize 
	currentPosition := 0@0.
	currentDirection := FacingNorth new.
	! !


!MarsRover methodsFor: 'private' stamp: 'pa 5/31/2022 23:21:10'!
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
