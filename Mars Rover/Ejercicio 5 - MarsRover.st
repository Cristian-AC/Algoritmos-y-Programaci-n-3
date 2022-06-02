!classDefinition: #TestMarsRover category: 'Ejercicio 5 - MarsRover'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 5 - MarsRover'!

!TestMarsRover methodsFor: 'setUp' stamp: 'sadasdas 6/2/2022 01:24:21'!
deployAtOriginPointingAtEastThenSendThisCommand: anOrder

	^self marsRoverDeployeINt: (0 @ 0) whilePointingAt: EastPoint andTheseCommandsAreSend: anOrder.! !

!TestMarsRover methodsFor: 'setUp' stamp: 'sadasdas 6/2/2022 01:24:52'!
deployAtOriginPointingAtNorthThenSendThisCommand: anOrder

	^self marsRoverDeployeINt: (0 @ 0) whilePointingAt: NorthPoint andTheseCommandsAreSend: anOrder.! !

!TestMarsRover methodsFor: 'setUp' stamp: 'sadasdas 6/2/2022 01:25:30'!
deployAtOriginPointingAtSouthThenSendThisCommand: anOrder

	^self marsRoverDeployeINt: (0 @ 0) whilePointingAt: SouthPoint andTheseCommandsAreSend: anOrder.! !

!TestMarsRover methodsFor: 'setUp' stamp: 'sadasdas 6/2/2022 01:25:57'!
deployAtOriginPointingAtWestThenSendThisCommand: anOrder

	^self marsRoverDeployeINt: (0 @ 0) whilePointingAt: WestPoint andTheseCommandsAreSend: anOrder.! !

!TestMarsRover methodsFor: 'setUp' stamp: 'sadasdas 6/2/2022 01:17:47'!
marsRoverDeployeINt: aCoordinates whilePointingAt: aCardinalPoint andTheseCommandsAreSend: anOrder

	| marsRover |
	marsRover := MarsRover deployMarsRoverAt: aCoordinates pointingAt: aCardinalPoint.
	marsRover reciveOrder: anOrder.
	
	^marsRover
	! !


!TestMarsRover methodsFor: 'Test - Basic Functions' stamp: 'AC 6/2/2022 01:41:43'!
test01AfterBeingDeployedTheCardinalPointIsCorrect
	
	| marsRover |
	
	marsRover := MarsRover deployMarsRoverAt: (0 @ 0) pointingAt: NorthPoint.
	
	self assert: (marsRover isPointingAt isKindOf: NorthPoint).
	! !

!TestMarsRover methodsFor: 'Test - Basic Functions' stamp: 'AC 6/2/2022 01:43:07'!
test02AfterBeingDeployedTheCoordinatesAreCorrect

	| marsRover |
	
	marsRover := MarsRover deployMarsRoverAt: (0 @ 0) pointingAt: NorthPoint.

	self assert: (marsRover coordinates = (0 @ 0)).
	
	! !

!TestMarsRover methodsFor: 'Test - Basic Functions' stamp: 'AC 6/2/2022 01:51:23'!
test03AfterRotating90DegreesItPointsToTheEast
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtNorthThenSendThisCommand: 'r'.
	
	self assert: (marsRover isPointingAt isKindOf: EastPoint).
	
! !

!TestMarsRover methodsFor: 'Test - Basic Functions' stamp: 'AC 6/2/2022 01:54:53'!
test04AfterRotating180DegreesItPointsToTheSouth
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtNorthThenSendThisCommand: 'rr'.
	
	self assert: (marsRover isPointingAt isKindOf: SouthPoint).! !

!TestMarsRover methodsFor: 'Test - Basic Functions' stamp: 'AC 6/2/2022 02:06:19'!
test05TheCoordinatesAreCorrectAfterAplyingACommandToModifyTheCoordinates
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtNorthThenSendThisCommand: 'f'.
	
	self assert: (marsRover coordinates = (0 @ 1)).
	
	! !

!TestMarsRover methodsFor: 'Test - Basic Functions' stamp: 'AC 6/2/2022 02:09:06'!
test06TheCoordinatesAreCorrectAfterAplyingSeveralCommandsToModifyTheCoordinates
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtNorthThenSendThisCommand: 'ffbbbffbbb'.
	
	self assert: (marsRover coordinates = (0 @ -2)).! !

!TestMarsRover methodsFor: 'Test - Basic Functions' stamp: 'AC 6/2/2022 02:25:23'!
test07AfterApplyingACommandToModifyTheCoordinatesAndACommandToModifyTheCardinalPointTheBehaviorIsCorrect
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtNorthThenSendThisCommand: 'fl'.
	
	self assert: (marsRover isPointingAt isKindOf: WestPoint).
	self assert: (marsRover coordinates = (0 @ 1)).
	
	! !

!TestMarsRover methodsFor: 'Test - Basic Functions' stamp: 'AC 6/2/2022 02:27:50'!
test08AfterApplyingACommandSecuenseTheCardinalPointAndTheCoordinatesAreCorrect
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtEastThenSendThisCommand: 'fffrrr'.
	
	self assert: (marsRover isPointingAt isKindOf: NorthPoint).
	self assert: (marsRover coordinates = (3 @ 0)).
	
	! !

!TestMarsRover methodsFor: 'Test - Basic Functions' stamp: 'AC 6/2/2022 02:46:07'!
test09AfterApplyingACommandSecuenseTheRoverReturnsToTheOrigin
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtEastThenSendThisCommand: 'fflffrrffrffrr'.
	
	self assert: (marsRover isPointingAt isKindOf: EastPoint).
	self assert: (marsRover coordinates = (0 @ 0)).
	
	! !

!TestMarsRover methodsFor: 'Test - Basic Functions' stamp: 'AC 6/2/2022 02:38:51'!
test10TheMarsRoverCanBeDeployedAnywhere
	
	| marsRover |
	
	marsRover := MarsRover deployMarsRoverAt: (15 @ 27) pointingAt: WestPoint.
	
	self deny: ((0 @ 0) = marsRover coordinates).
! !

!TestMarsRover methodsFor: 'Test - Basic Functions' stamp: 'AC 6/2/2022 02:50:38'!
test11ASequenceIsSentWithAnInvalidCommandAndAnErrorIsReturned
	
	self
		should: [ self deployAtOriginPointingAtNorthThenSendThisCommand: 'ffbxbrrl'.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover invalidCommand ].
! !


!classDefinition: #CardinalPoints category: 'Ejercicio 5 - MarsRover'!
Object subclass: #CardinalPoints
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 5 - MarsRover'!

!CardinalPoints methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 00:59:16'!
turnLeft: aMarsRover

	self subclassResponsibility. ! !

!CardinalPoints methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 01:00:20'!
turnRight: aMarsRover

	self subclassResponsibility. ! !

!CardinalPoints methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 01:01:24'!
walkBack: aMarsRover 	

	self subclassResponsibility. ! !

!CardinalPoints methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 01:01:54'!
walkForward: aMarsRover 	

	self subclassResponsibility. ! !


!classDefinition: #EastPoint category: 'Ejercicio 5 - MarsRover'!
CardinalPoints subclass: #EastPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 5 - MarsRover'!

!EastPoint methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 00:59:16'!
turnLeft: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: NorthPoint new.! !

!EastPoint methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 01:00:20'!
turnRight: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: SouthPoint new.! !

!EastPoint methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 01:01:24'!
walkBack: aMarsRover 	
	
	aMarsRover modifyMarsRoverCoordinatesWith: (-1 @ 0)! !

!EastPoint methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 01:01:54'!
walkForward: aMarsRover
	
	aMarsRover modifyMarsRoverCoordinatesWith: (1 @ 0)! !


!classDefinition: #NorthPoint category: 'Ejercicio 5 - MarsRover'!
CardinalPoints subclass: #NorthPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 5 - MarsRover'!

!NorthPoint methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 00:59:16'!
turnLeft: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: WestPoint new.! !

!NorthPoint methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 01:00:20'!
turnRight: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: EastPoint new.! !

!NorthPoint methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 01:01:24'!
walkBack: aMarsRover
	
	aMarsRover modifyMarsRoverCoordinatesWith: (0 @ -1)! !

!NorthPoint methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 01:01:54'!
walkForward: aMarsRover
	
	aMarsRover modifyMarsRoverCoordinatesWith: (0 @ 1)! !


!classDefinition: #SouthPoint category: 'Ejercicio 5 - MarsRover'!
CardinalPoints subclass: #SouthPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 5 - MarsRover'!

!SouthPoint methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 00:59:16'!
turnLeft: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: EastPoint new.! !

!SouthPoint methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 01:00:20'!
turnRight: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: WestPoint new.! !

!SouthPoint methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 01:01:24'!
walkBack: aMarsRover 	
	
	aMarsRover modifyMarsRoverCoordinatesWith: (0 @ 1)! !

!SouthPoint methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 01:01:54'!
walkForward: aMarsRover
	
	aMarsRover modifyMarsRoverCoordinatesWith: (0 @ -1)! !


!classDefinition: #WestPoint category: 'Ejercicio 5 - MarsRover'!
CardinalPoints subclass: #WestPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 5 - MarsRover'!

!WestPoint methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 00:59:16'!
turnLeft: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: SouthPoint new.! !

!WestPoint methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 01:00:20'!
turnRight: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: NorthPoint new.! !

!WestPoint methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 01:07:12'!
walkBack: aMarsRover 	
	
	aMarsRover modifyMarsRoverCoordinatesWith: (1 @ 0)! !

!WestPoint methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 01:07:20'!
walkForward: aMarsRover
	
	aMarsRover modifyMarsRoverCoordinatesWith: (-1 @ 0)! !


!classDefinition: #MarsRover category: 'Ejercicio 5 - MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'cardinalPoint coordinates'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 5 - MarsRover'!

!MarsRover methodsFor: 'private' stamp: 'sadasdas 6/2/2022 00:51:44'!
modifyMarsRoverCoordinatesWith: someCoordinates

	coordinates := coordinates + someCoordinates. ! !

!MarsRover methodsFor: 'private' stamp: 'AC 6/2/2022 17:06:21'!
reciveOrder: anOrderOfCommands 
	
	anOrderOfCommands do: [ :aCommand | | actualCommand |
		
		actualCommand := RoverCommands identifyCommand: aCommand.
		
		actualCommand runOn: self.
		].! !

!MarsRover methodsFor: 'private' stamp: 'sadasdas 6/2/2022 00:51:54'!
updatePointedCardinalPoint: aCardinalPoint

	cardinalPoint := aCardinalPoint. ! !


!MarsRover methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 01:01:24'!
moveBackward

	cardinalPoint walkBack: self.  ! !

!MarsRover methodsFor: 'movement' stamp: 'sadasdas 6/2/2022 01:01:54'!
moveForward

	cardinalPoint walkForward: self.  ! !


!MarsRover methodsFor: 'initialization' stamp: 'sadasdas 6/2/2022 00:54:04'!
initializeWith: initialCoordinates and: aCardinalPoint

	cardinalPoint := aCardinalPoint. 
	coordinates := initialCoordinates.
! !


!MarsRover methodsFor: 'rotate' stamp: 'sadasdas 6/2/2022 00:59:16'!
rotateLeft

	cardinalPoint turnLeft: self.  ! !

!MarsRover methodsFor: 'rotate' stamp: 'sadasdas 6/2/2022 01:00:20'!
rotateRight

	cardinalPoint turnRight: self.  ! !


!MarsRover methodsFor: 'accessing' stamp: 'sadasdas 6/2/2022 00:51:17'!
coordinates

	^coordinates.! !

!MarsRover methodsFor: 'accessing' stamp: 'sadasdas 6/2/2022 00:51:24'!
isPointingAt 

	^cardinalPoint.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Ejercicio 5 - MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'errors' stamp: 'sadasdas 6/2/2022 01:02:49'!
invalidCommand	

	^'There is a character in the recived command that is not valid for the Rover.'! !


!MarsRover class methodsFor: 'initialization' stamp: 'sadasdas 6/2/2022 01:03:42'!
deployMarsRoverAt: aCoordinates pointingAt: aCardinalPoint
	
	^self new initializeWith: aCoordinates and: aCardinalPoint new.! !


!classDefinition: #RoverCommands category: 'Ejercicio 5 - MarsRover'!
Object subclass: #RoverCommands
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 5 - MarsRover'!

!RoverCommands methodsFor: 'execution' stamp: 'AC 6/2/2022 17:06:21'!
runOn: aMarsRover

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RoverCommands class' category: 'Ejercicio 5 - MarsRover'!
RoverCommands class
	instanceVariableNames: ''!

!RoverCommands class methodsFor: 'initialization' stamp: 'srs 11/14/2021 01:49:45'!
canInstanciateWith: aCommand

	self subclassResponsibility.! !


!RoverCommands class methodsFor: 'private' stamp: 'sadasdas 6/2/2022 01:09:21'!
identifyCommand: parsedCommand

	RoverCommands subclasses do: [:subclass| (subclass canInstanciateWith: parsedCommand) ifTrue: [ ^subclass new]].
	self error: MarsRover invalidCommand. ! !


!classDefinition: #Backward category: 'Ejercicio 5 - MarsRover'!
RoverCommands subclass: #Backward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 5 - MarsRover'!

!Backward methodsFor: 'execution' stamp: 'AC 6/2/2022 17:06:21'!
runOn: aMarsRover

	aMarsRover moveBackward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backward class' category: 'Ejercicio 5 - MarsRover'!
Backward class
	instanceVariableNames: ''!

!Backward class methodsFor: 'initialization' stamp: 'srs 11/14/2021 01:50:20'!
canInstanciateWith: aCommand

	^ $b = aCommand. ! !


!classDefinition: #Forward category: 'Ejercicio 5 - MarsRover'!
RoverCommands subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 5 - MarsRover'!

!Forward methodsFor: 'execution' stamp: 'AC 6/2/2022 17:06:21'!
runOn: aMarsRover
	
	aMarsRover moveForward. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: 'Ejercicio 5 - MarsRover'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'initialization' stamp: 'srs 11/14/2021 01:50:53'!
canInstanciateWith: aCommand

	^ $f = aCommand. 
! !


!classDefinition: #Left category: 'Ejercicio 5 - MarsRover'!
RoverCommands subclass: #Left
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 5 - MarsRover'!

!Left methodsFor: 'execution' stamp: 'AC 6/2/2022 17:06:21'!
runOn: aMarsRover
	
	aMarsRover rotateLeft. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Left class' category: 'Ejercicio 5 - MarsRover'!
Left class
	instanceVariableNames: ''!

!Left class methodsFor: 'initialization' stamp: 'srs 11/14/2021 01:51:33'!
canInstanciateWith: aCommand

	^ $l = aCommand. ! !


!classDefinition: #Right category: 'Ejercicio 5 - MarsRover'!
RoverCommands subclass: #Right
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 5 - MarsRover'!

!Right methodsFor: 'execution' stamp: 'AC 6/2/2022 17:06:21'!
runOn: aMarsRover

	aMarsRover rotateRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Right class' category: 'Ejercicio 5 - MarsRover'!
Right class
	instanceVariableNames: ''!

!Right class methodsFor: 'initialization' stamp: 'srs 11/14/2021 01:51:48'!
canInstanciateWith: aCommand

	^ $r = aCommand. ! !
