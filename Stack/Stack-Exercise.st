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

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Ac 5/15/2022 17:52:31'!
test01SeEnviaUnPrefijoVacioYSeDevuelveUnError

	| finder |
	
	finder := SentenceFinderByPrefix with: OOStack new.
	
	self
		should: [ finder find: ' ']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ : anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidPrefixErrorDescription ].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Ac 5/15/2022 17:56:00'!
test02SeEnviaUnPrefijoQueContieneUnEspacioVacioYSeRetornaUnError

	| finder |
	
	finder := SentenceFinderByPrefix with: OOStack new.
	
	self
		should: [ finder find: 'winter is']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ : anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidPrefixErrorDescription ].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Ac 5/15/2022 18:21:36'!
test03SeBuscaUnPrefijoEnUnStackVacioYSeRetornaUnaColeccionVacia

	| finder collection |
	
	finder := SentenceFinderByPrefix with: OOStack new.
	
	collection := finder find: 'Winter'.
	
	self assert: collection size equals: 0.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Ac 5/15/2022 21:17:47'!
test04SeBuscaUnStringConUnPrefijoYSeDevuelveEseString

	| finder collection newStack |
	
	newStack := OOStack new.
	
	newStack push: 'Winter is comming'.
	
	finder := SentenceFinderByPrefix with: newStack.
	
	collection := finder find: 'Wint'.
	
	self assert: 'Winter is comming' equals: collection first.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Ac 5/15/2022 21:25:53'!
test05SeBuscaUnStringConPrefijoQueNoEstaDentroElStackYSeDevuelveUnaColeccionVacia

	| finder collection newStack |
	
	newStack := OOStack new.
	
	newStack push: 'Winning is everything'.
	
	finder := SentenceFinderByPrefix with: newStack.
	
	collection := finder find: 'Wint'.
	
	self assert: collection size equals: 0.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Ac 5/15/2022 21:34:23'!
test06SeIntroducenVariosStringYSeBuscaUnPrefijoQueCoincideConDosYSeRetornaUnaColeccionDeTamanioDos

	| finder collection newStack |
	
	newStack := OOStack new.
	
	newStack push: 'Winter is comming'.
	newStack push: 'Winning is everything'.
	newStack push: 'The winter is here'.
	newStack push: 'The winds is of Winter'.
	
	
	finder := SentenceFinderByPrefix with: newStack.
	
	collection := finder find: 'Win'.
	
	self assert: collection size equals: 2.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Ac 5/15/2022 21:39:24'!
test07SeIntroducenVariosStringYSeBuscaUnPrefijoQueCoincideConDosYSeDevuelvenEsosDosString

	| finder collection newStack |
	
	newStack := OOStack new.
	
	newStack push: 'Winter is comming'.
	newStack push: 'Winning is everything'.
	newStack push: 'The winter is here'.
	newStack push: 'The winds is of Winter'.
	
	
	finder := SentenceFinderByPrefix with: newStack.
	
	collection := finder find: 'Win'.
	
	self assert: collection includes: 'Winter is comming'.
	self assert: collection includes: 'Winning is everything'.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Ac 5/15/2022 21:56:41'!
test08SeIntroducenVariosStringYSeBuscaUnPrefijoQueNoExisteYSeDevuelveUnaColeccionVacia

	| finder collection newStack |
	
	newStack := OOStack new.
	
	newStack push: 'Winter is comming'.
	newStack push: 'Winning is everything'.
	newStack push: 'The winter is here'.
	newStack push: 'The winds is of Winter'.
	
	
	finder := SentenceFinderByPrefix with: newStack.
	
	collection := finder find: 'Algo3'.
	
	self assert: collection size equals: 0.
	
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'size stack stackState'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'lkl 5/14/2022 16:30:46'!
changeState: aState

	stackState := aState.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lkl 5/14/2022 15:34:10'!
initialize
	stack := OrderedCollection new.
	stackState := StackEmpty new.
	size := 0. ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AC 5/12/2022 12:12:10'!
isEmpty
	 (size > 0) ifTrue: [ ^ false ].
	
	^ true.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lkl 5/14/2022 16:42:48'!
pop 

	^ stackState popFromStack: self.
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lkl 5/14/2022 17:42:24'!
popString
	
	size := size - 1.
	size = 0 ifTrue: [ self changeState: StackEmpty new].
	^ stack removeFirst.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lkl 5/14/2022 16:14:56'!
push: aString

	stackState push: aString toStack: self.
	
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lkl 5/14/2022 16:32:47'!
pushString: aString
	
	stack addFirst: aString.
	size := size + 1.
	self changeState: StackNotEmpty new. ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AC 5/12/2022 22:10:07'!
signalStackEmptyErrorDescription
	self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AC 5/12/2022 11:22:15'!
size
	^ size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lkl 5/14/2022 17:31:09'!
top

	^ stackState topFrom: self.

	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lkl 5/14/2022 17:32:08'!
topString

	^ stack at: 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'AC 5/12/2022 11:28:32'!
stackEmptyErrorDescription
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack prefixs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'Ac 5/15/2022 16:59:05'!
evaluatePrefix: aPrefix
	
	(aPrefix size = 0) | (aPrefix includesSubString: ' ') ifTrue: [ ^ false ].
	
	^ true.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'Ac 5/15/2022 18:23:19'!
find: aPrefix
	
	self findStringWithPrefix: aPrefix.
	
	^ prefixs.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'Ac 5/15/2022 18:18:08'!
findStringWithPrefix: aPrefix

	| newStack item | 
	
	(self evaluatePrefix: aPrefix) ifFalse: [ ^ self error: SentenceFinderByPrefix invalidPrefixErrorDescription ]. 
	
	newStack := OOStack new.
	
	self popAnElementFromStack: stack evaluate: [ item := stack top. ( self prefixFound: aPrefix inString: item) ifTrue: [ prefixs add: item] ] pushToStack: newStack.
	
	self popAnElementFromStack: newStack evaluate: [] pushToStack: stack.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'lkl 5/14/2022 14:30:14'!
initializeWith: aStack
	stack := aStack.
	prefixs := OrderedCollection new.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'Ac 5/15/2022 18:16:04'!
popAnElementFromStack: aStack evaluate: anElement pushToStack: anotherStack

	[ aStack isEmpty ] whileFalse: [ anElement value.
		anotherStack push: aStack pop. ]! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'Ac 5/15/2022 18:17:32'!
prefixFound: aPrefix inString: aString

	^ ( aString findString: aPrefix startingAt: 1 caseSensitive: true ) = 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'Ac 5/15/2022 17:04:26'!
invalidPrefixErrorDescription
	
	^ 'Invalid Prefix'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'lkl 5/14/2022 14:43:11'!
with: aStack
	^ self new initializeWith: aStack.! !


!classDefinition: #StackState category: 'Stack-Exercise'!
Object subclass: #StackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackState methodsFor: 'as yet unclassified' stamp: 'lkl 5/14/2022 13:26:42'!
isEmpty! !

!StackState methodsFor: 'as yet unclassified' stamp: 'lkl 5/14/2022 17:20:17'!
popFromStack: aStack
	^ self subclassResponsibility ! !

!StackState methodsFor: 'as yet unclassified' stamp: 'lkl 5/14/2022 15:56:33'!
push: aString toStack: aStack
	self subclassResponsibility. ! !

!StackState methodsFor: 'as yet unclassified' stamp: 'lkl 5/14/2022 17:24:29'!
topFromStack
	^ self subclassResponsibility ! !


!classDefinition: #StackEmpty category: 'Stack-Exercise'!
StackState subclass: #StackEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackEmpty methodsFor: 'as yet unclassified' stamp: 'lkl 5/14/2022 17:35:06'!
popFromStack: aStack
	
	^ aStack signalStackEmptyErrorDescription
! !

!StackEmpty methodsFor: 'as yet unclassified' stamp: 'lkl 5/14/2022 16:07:40'!
push: aString toStack: aStack

	aStack pushString: aString.! !

!StackEmpty methodsFor: 'as yet unclassified' stamp: 'lkl 5/14/2022 17:35:19'!
topFrom: aStack
	
	^ aStack signalStackEmptyErrorDescription! !


!classDefinition: #StackNotEmpty category: 'Stack-Exercise'!
StackState subclass: #StackNotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackNotEmpty methodsFor: 'as yet unclassified' stamp: 'lkl 5/14/2022 16:49:29'!
popFromStack: aStack
	
	^ aStack popString.! !

!StackNotEmpty methodsFor: 'as yet unclassified' stamp: 'lkl 5/14/2022 16:38:17'!
push: aString toStack: aStack

	aStack pushString: aString.! !

!StackNotEmpty methodsFor: 'as yet unclassified' stamp: 'lkl 5/14/2022 17:31:41'!
topFrom: aStack
	
	^ aStack topString.! !
