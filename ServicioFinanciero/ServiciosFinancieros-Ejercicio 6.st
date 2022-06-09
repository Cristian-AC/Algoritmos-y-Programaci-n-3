!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'Test - Iniciation' stamp: 'AC 6/6/2022 00:43:45'!
test01ANewEmptyPortfolioIsCreated

	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: portfolio numberOfAccounts equals: 0.! !

!PortfolioTest methodsFor: 'Test - Iniciation' stamp: 'AC 6/6/2022 20:22:52'!
test02ANewPortfolioIsCreatedAndItsBalanceIsZero
	
	| portfolio |

	portfolio := Portfolio new.
	
	self assert: portfolio balance equals: 0 * peso.
	! !

!PortfolioTest methodsFor: 'Test - Iniciation' stamp: 'AC 6/6/2022 20:38:35'!
test03ANewPortfolioIsCreatedAndANewAccountIsAdded

	| portfolio newAccount |
	
	portfolio := Portfolio new.
	newAccount := ReceptiveAccount new.
	
	portfolio addAccount: newAccount.
	
	self assert: portfolio numberOfAccounts equals: 1.! !

!PortfolioTest methodsFor: 'Test - Iniciation' stamp: 'AC 6/6/2022 21:29:46'!
test04APortfolioIsCreatedAndADepositOf100PesosIsRegistered

	| portfolio newAccount |
	
	portfolio := Portfolio new.
	newAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: newAccount.
	portfolio addAccount: newAccount.
	
	self assert: portfolio balance equals: 100 * peso.! !

!PortfolioTest methodsFor: 'Test - Iniciation' stamp: 'AC 6/6/2022 21:40:37'!
test05APortfolioIsCreatedWithTwoAccountsAndADepositOf100PesosIsRegisteredWithEachAccount

	| portfolio newAccount1 newAccount2 |
	
	portfolio := Portfolio new.
	newAccount1 := ReceptiveAccount new.
	newAccount2 := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: newAccount1.
	Deposit register: 100 * peso on: newAccount2.
	
	portfolio addAccount: newAccount1.
	portfolio addAccount: newAccount2.
	
	self assert: portfolio balance equals: 200 * peso.! !

!PortfolioTest methodsFor: 'Test - Iniciation' stamp: 'AC 6/6/2022 23:11:45'!
test06APortfolioIsCreatedWithTwoAccountsAndDepositsAndWithdrawalsAreMade

	| portfolio newAccount1 newAccount2 |
	
	portfolio := Portfolio new.
	newAccount1 := ReceptiveAccount new.
	newAccount2 := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: newAccount1.
	Withdraw register: 50 * peso on: newAccount2.
	
	portfolio addAccount: newAccount1.
	portfolio addAccount: newAccount2.
	
	self assert: portfolio balance equals: 50 * peso.! !

!PortfolioTest methodsFor: 'Test - Iniciation' stamp: 'AC 6/6/2022 23:27:15'!
test07APortfolioIsCreatedAndADepositIsRegistered

	| portfolio newAccount deposit |
	
	portfolio := Portfolio new.
	newAccount := ReceptiveAccount new.
	
	deposit := Deposit register: 200 * peso on: newAccount.
	
	portfolio addAccount: newAccount.
	
	self assert: (portfolio wasRegistered: deposit).! !

!PortfolioTest methodsFor: 'Test - Iniciation' stamp: 'AC 6/7/2022 17:36:12'!
test08APortfolioIsCreatedAndAnExtractionIsRegistered

	| portfolio newAccount withdraw |
	
	portfolio := Portfolio new.
	newAccount := ReceptiveAccount new.
	
	withdraw := Withdraw register: 100 * peso on: newAccount.
	
	portfolio addAccount: newAccount.
	
	self assert: (portfolio wasRegistered: withdraw).! !

!PortfolioTest methodsFor: 'Test - Iniciation' stamp: 'AC 6/7/2022 17:42:46'!
test09APortfolioIsCreatedAndADepositAndAWithdrawalAreRegistered

	| portfolio newAccount1 newAccount2 deposit withdraw |
	
	portfolio := Portfolio new.
	newAccount1 := ReceptiveAccount new.
	newAccount2 := ReceptiveAccount new.
	
	deposit := Deposit register: 200 * peso on: newAccount1.
	withdraw := Withdraw register: 100 * peso on: newAccount2.
	
	portfolio addAccount: newAccount1.
	portfolio addAccount: newAccount2.
	
	self assert: (portfolio wasRegistered: withdraw).
	self assert: (portfolio wasRegistered: deposit).! !

!PortfolioTest methodsFor: 'Test - Iniciation' stamp: 'AC 6/7/2022 18:36:27'!
test10APortfolioIsCreatedWithoutTransactions

	| portfolio newAccount transactions |
	
	portfolio := Portfolio new.
	newAccount := ReceptiveAccount new.
	
	portfolio addAccount: newAccount.
	
	transactions := portfolio transactions.
	
	self assert: transactions isEmpty.! !

!PortfolioTest methodsFor: 'Test - Iniciation' stamp: 'AC 6/7/2022 19:14:59'!
test11APortfolioIsCreatedWithATransaction

	| portfolio listOfTransactions newAccount deposit transactions |
	
	portfolio := Portfolio new.
	newAccount := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: newAccount.
		
	transactions := OrderedCollection new.
	transactions add: deposit.	
	
	portfolio addAccount: newAccount.

	listOfTransactions := portfolio transactions.
	self assert: listOfTransactions equals: transactions ! !

!PortfolioTest methodsFor: 'Test - Iniciation' stamp: 'AC 6/7/2022 19:50:34'!
test12APortfolioIsCreatedWithinAnotherPortfolioAndADepositIsMade

	| portfolio1 portfolio2 newAccount deposit |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	newAccount := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: newAccount.
		
	portfolio2 addAccount: newAccount.	
	portfolio1 addAccount: portfolio2.
	
	self assert: (portfolio2 wasRegistered: deposit).! !

!PortfolioTest methodsFor: 'Test - Iniciation' stamp: 'AC 6/7/2022 20:11:22'!
test13APortfolioIsCreatedWithinAnotherPortfolioAndADepositIsMadeAndABalanceIsReturned

	| portfolio1 portfolio2 newAccount |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	newAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: newAccount.
		
	portfolio2 addAccount: newAccount.	
	portfolio1 addAccount: portfolio2.
	
	self assert: portfolio1 balance equals: 100 * peso.! !

!PortfolioTest methodsFor: 'Test - Iniciation' stamp: 'AC 6/7/2022 20:15:20'!
test14APortfolioIsCreatedWithinAnotherPortfolioAndADepositIsMadeAndATransactionIsReturned

	| portfolio1 portfolio2 newAccount deposit listOfTransactions transactions |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	newAccount := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: newAccount.
	
	transactions := OrderedCollection new.
	transactions add: deposit.
		
	portfolio2 addAccount: newAccount.	
	portfolio1 addAccount: portfolio2.
	
	listOfTransactions := portfolio1 transactions.
	
	self assert: listOfTransactions equals: transactions! !

!PortfolioTest methodsFor: 'Test - Iniciation' stamp: 'AC 6/8/2022 23:35:48'!
test15APortfolioIsCreatedAndTheSameAccountCannotBeAdded

	| newAccount portfolio |
	
	portfolio := Portfolio new.
	newAccount := ReceptiveAccount new.

	portfolio addAccount: newAccount. 
	
	self 
		should: [portfolio addAccount: 	newAccount]
		raise: Error - MessageNotUnderstood
		withExceptionDo:[ :anError | self assert: anError messageText = Portfolio canNotAddThisAccount].	
	 	
! !

!PortfolioTest methodsFor: 'Test - Iniciation' stamp: 'AC 6/8/2022 23:46:15'!
test16APortfolioIsCreatedThatCannotBeAddedToItself

	| portfolio |

	portfolio := Portfolio new.

	self 
		should: [portfolio addAccount: portfolio]
		raise: Error - MessageNotUnderstood
		withExceptionDo:[ :anError | self assert: anError messageText = Portfolio canNotAddThisAccount].	! !

!PortfolioTest methodsFor: 'Test - Iniciation' stamp: 'AC 6/9/2022 17:16:31'!
test17ACreatedPortfolioCannotAddAnAccountAlreadyIncludedInAnotherPreviouslyAddedPortfolio

	| newAccount portfolio1 portfolio2 |
	
	newAccount := ReceptiveAccount new.

	portfolio2 := Portfolio new.
	portfolio2 addAccount: newAccount.
	
	portfolio1 := Portfolio new.
	portfolio1 addAccount: portfolio2.
	
	self 
		should: [portfolio1 addAccount: 	newAccount]
		raise: Error - MessageNotUnderstood
		withExceptionDo:[ :anError | self assert: anError messageText = Portfolio canNotAddThisAccount].	! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'operations' stamp: 'AC 6/5/2022 21:46:08'!
operateOn: aBalance
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


!Deposit methodsFor: 'operations' stamp: 'AC 6/5/2022 22:41:50'!
operateOn: aBalance
	aBalance addValue: self value.! !

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


!Withdraw methodsFor: 'operations' stamp: 'AC 6/5/2022 22:42:31'!
operateOn: aBalance
	aBalance subtractValue: self value.! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Balance category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Balance
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Balance methodsFor: 'initialization' stamp: 'AC 6/5/2022 22:43:34'!
initialize
	value := 0 * peso.! !


!Balance methodsFor: 'accesing' stamp: 'AC 6/5/2022 22:47:39'!
total
	^value.! !


!Balance methodsFor: 'operations' stamp: 'AC 6/5/2022 22:34:09'!
addValue: aValue
	value := value + aValue.! !

!Balance methodsFor: 'operations' stamp: 'AC 6/5/2022 22:34:59'!
subtractValue: aValue
	value := value - aValue.! !


!classDefinition: #NewAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #NewAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!NewAccount methodsFor: 'main protocol' stamp: 'AC 6/6/2022 20:17:53'!
balance
	self subclassResponsibility ! !

!NewAccount methodsFor: 'main protocol' stamp: 'AC 6/9/2022 00:58:04'!
checkIfYouHaveAccountsInCommonWith: anAccountOrAPortfolio
	self subclassResponsibility ! !

!NewAccount methodsFor: 'main protocol' stamp: 'AC 6/6/2022 20:27:08'!
transactions
	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
NewAccount subclass: #Portfolio
	instanceVariableNames: 'portfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'AC 6/6/2022 00:30:14'!
initialize
	portfolio := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'AC 6/9/2022 16:49:51'!
addAccount: aReceptiveAccount

	self verifyThatThisAccount: aReceptiveAccount isNotIncluded: portfolio.
	self verifyThatThisAccountIsNotIncludedInItself: aReceptiveAccount.
	
	portfolio do: [:anAccount |  
		(anAccount isKindOf: Portfolio) ifTrue: [ aReceptiveAccount checkIfYouHaveAccountsInCommonWith: anAccount .		].
	].
	
	portfolio add: aReceptiveAccount ! !

!Portfolio methodsFor: 'main protocol' stamp: 'AC 6/6/2022 20:19:00'!
balance
	^portfolio sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'AC 6/7/2022 19:09:16'!
transactions 

	| transactions |
	
	transactions := OrderedCollection new.
	
	portfolio do: [:anAccount | transactions addAll: (anAccount transactions) ].
	
	^transactions 
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'AC 6/6/2022 23:18:05'!
wasRegistered: aTransaction 

	^portfolio anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction]! !


!Portfolio methodsFor: 'check' stamp: 'AC 6/9/2022 00:07:34'!
accountsAndPortfolios
	^portfolio copy.! !

!Portfolio methodsFor: 'check' stamp: 'AC 6/9/2022 00:09:05'!
checkIfYouHaveAccountsInCommonWith: aPortfolio

	self accountsAndPortfolios do: [:anotherAccount | self verifyThatThisAccount: anotherAccount isNotIncluded: aPortfolio.]! !

!Portfolio methodsFor: 'check' stamp: 'AC 6/8/2022 23:40:30'!
verifyThatThisAccount: aReceptiveAccountOrPortfolio isNotIncluded: aPortfolio

	(aPortfolio includes: aReceptiveAccountOrPortfolio) ifTrue: [ self error: Portfolio canNotAddThisAccount ].! !

!Portfolio methodsFor: 'check' stamp: 'AC 6/8/2022 23:52:05'!
verifyThatThisAccountIsNotIncludedInItself: anAccountOrAPortfolio

	(anAccountOrAPortfolio isEqualTo: self) ifTrue: [self error: Portfolio canNotAddThisAccount]! !


!Portfolio methodsFor: 'accesing' stamp: 'AC 6/6/2022 00:41:53'!
numberOfAccounts
	^ portfolio size.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error' stamp: 'AC 6/8/2022 23:25:46'!
canNotAddThisAccount
	^'The account already exists in the portfolio'.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
NewAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions balance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'AC 6/5/2022 22:15:59'!
initialize

	transactions := OrderedCollection new.
	balance := Balance new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'AC 6/5/2022 22:48:17'!
balance

	"^transactions sum: [ :aTransaction | aTransaction value ] ifEmpty: [ 0 ]"
	
	^balance total.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'AC 6/9/2022 00:52:09'!
checkIfYouHaveAccountsInCommonWith: aPortfolio
	aPortfolio verifyThatThisAccount: self isNotIncluded: (aPortfolio accountsAndPortfolios). ! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'AC 6/5/2022 22:58:41'!
register: aTransaction

	transactions add: aTransaction. 
	aTransaction operateOn: balance.
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !
