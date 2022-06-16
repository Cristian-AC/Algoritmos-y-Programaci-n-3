!classDefinition: #TestServiciosFinancieros1 category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TestServiciosFinancieros1
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestServiciosFinancieros1 subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'test' stamp: 'AC 6/15/2022 01:15:24'!
test01ANewEmptyPortfolioIsCreated
	
	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: portfolio numberOfAccounts equals: 0.! !

!PortfolioTest methodsFor: 'test' stamp: 'AC 6/15/2022 01:17:02'!
test02ANewPortfolioIsCreatedAndItsBalanceIsZero
	
	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: portfolio balance equals: 0 * peso.! !

!PortfolioTest methodsFor: 'test' stamp: 'AC 6/16/2022 17:42:12'!
test03ANewPortfolioIsCreateAndNewAccountIsAdded

	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio addAccount: account.
	
	self assert: portfolio numberOfAccounts equals: 1.! !

!PortfolioTest methodsFor: 'test' stamp: 'AC 6/16/2022 17:43:55'!
test04APortfolioIsCreatedAndADepositOf100PesosIsRegistered

	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
	portfolio addAccount: account.
	
	self assert: portfolio balance equals: 100 * peso.! !

!PortfolioTest methodsFor: 'test' stamp: 'AC 6/16/2022 17:48:02'!
test05APortfolioIsCreatedWithTwoAccountsAndDepositOf100PesosIsRegisteredWithEachAccount

	| portfolio firstAccount secondAccount |
	
	portfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: firstAccount.
	Deposit register: 100 * peso on: secondAccount.
	
	portfolio addAccount: firstAccount.
	portfolio addAccount: secondAccount.
	
	self assert: portfolio balance equals: 200 * peso.! !

!PortfolioTest methodsFor: 'test' stamp: 'AC 6/16/2022 17:49:55'!
test06APortfolioIsCreatedWithTwoAccountsAndDepositAndWithdrawaIsAreMade

	| portfolio firstAccount secondAccount |
	
	portfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: firstAccount.
	Withdraw register: 50 * peso on: secondAccount.
	
	portfolio addAccount: firstAccount.
	portfolio addAccount: secondAccount.
	
	self assert: portfolio balance equals: 50 * peso.! !

!PortfolioTest methodsFor: 'test' stamp: 'AC 6/16/2022 17:53:26'!
test07APortfolioIsCreatedAndADepositIsRegistered

	| portfolio account deposit |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: account.
	portfolio addAccount: account.
	
	self assert: (portfolio wasRegistered: deposit).! !

!PortfolioTest methodsFor: 'test' stamp: 'AC 6/16/2022 17:55:24'!
test08APortfolioIsCreatedAndAnExtractionIsRegistered

	| portfolio account withdraw |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	withdraw := Withdraw register: 100 * peso on: account.
	portfolio addAccount: account.
	
	self assert: (portfolio wasRegistered: withdraw).! !

!PortfolioTest methodsFor: 'test' stamp: 'AC 6/16/2022 17:58:47'!
test09APortfolioIsCreatedAndDepositAndWithdrawalAreRegistered

	| portfolio firstAccount secondAccount deposit withdraw |
	
	portfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	
	deposit := Deposit register: 200 * peso on: firstAccount.
	withdraw := Withdraw register: 100 * peso on: secondAccount.
	
	portfolio addAccount: firstAccount.
	portfolio addAccount: secondAccount.
	
	self assert: (portfolio wasRegistered: withdraw).
	self assert: (portfolio wasRegistered: deposit).! !

!PortfolioTest methodsFor: 'test' stamp: 'AC 6/16/2022 18:10:26'!
test10APortfolioIsCreatedWithoutTransactions

	| portfolio account transactions |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio addAccount: account.
	transactions := portfolio transactions.
	
	self assert: transactions isEmpty.! !

!PortfolioTest methodsFor: 'test' stamp: 'AC 6/16/2022 18:14:45'!
test11APortfolioIsCreatedWithATransaction

	| portfolio account transactions listOfTransactions deposit |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: account.
	
	transactions := OrderedCollection new.
	transactions add: deposit.
	
	portfolio addAccount: account.
	listOfTransactions := portfolio transactions.
	
	self assert: listOfTransactions equals: transactions .! !

!PortfolioTest methodsFor: 'test' stamp: 'AC 6/16/2022 18:17:53'!
test12APortfolioIsCreatedWithinAnotherPortfolioAndADepositIsMade

	| portfolio1 portfolio2 account deposit |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: account.
	
	portfolio2 addAccount: account.
	portfolio1 addAccount: portfolio2. 
	
	self assert: (portfolio2 wasRegistered: deposit).! !

!PortfolioTest methodsFor: 'test' stamp: 'AC 6/16/2022 18:19:43'!
test13APortfolioIsCreatedWithinAnotherPortfolioAndDepositIsMadeAndBalanceIsReturned

	| portfolio1 portfolio2 account |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
	
	portfolio2 addAccount: account.
	portfolio1 addAccount: portfolio2. 
	
	self assert: portfolio1 balance equals: 100 * peso.! !

!PortfolioTest methodsFor: 'test' stamp: 'AC 6/16/2022 18:24:04'!
test14APortfolioIsCreatedWithinAnotherPortfolioAndDepositIsMadeAndATransactionIsReturned

	| portfolio1 portfolio2 account deposit listOfTransactions transactions |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: account.
	
	transactions := OrderedCollection new.
	transactions add: deposit.
	
	portfolio2 addAccount: account.
	portfolio1 addAccount: portfolio2. 
	
	listOfTransactions := portfolio1 transactions. 
	
	self assert: listOfTransactions equals: transactions.! !

!PortfolioTest methodsFor: 'test' stamp: 'AC 6/16/2022 18:27:04'!
test15APortfolioIsCreatedAndTheSameAccountCannotBeAdded

	| account portfolio |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio addAccount: account.
	
	self
		should: [portfolio addAccount: account]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText = Portfolio canNotAddThisAccount ].! !

!PortfolioTest methodsFor: 'test' stamp: 'AC 6/16/2022 18:28:16'!
test16APortfolioIsCreatedThatCannotBeToItself

	| portfolio |
	
	portfolio := Portfolio new.
	
	self
		should: [portfolio addAccount: portfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText = Portfolio canNotAddThisAccount ].! !

!PortfolioTest methodsFor: 'test' stamp: 'AC 6/16/2022 18:39:49'!
test17ACreatedPortfolioCannotAndAccountAlreadyIncludeInAnotherPreviuslyAddedPortfolio

	| account portfolio1 portfolio2 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio2 addAccount: account.
	portfolio1 addAccount: portfolio2. 
	
	self
		should: [portfolio1 addAccount: account]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText = Portfolio canNotAddThisAccount ].
		
		! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestServiciosFinancieros1 subclass: #ReceptiveAccountTest
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


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestServiciosFinancieros1 subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'test' stamp: 'AC 6/15/2022 17:01:03'!
test01ATransferIsMadeDecreasesTheBalanceOfTheOriginAccountAndIncreasesItForTheDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 20 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 20 * peso on: destinationAccount.
	
	Transfer amount: 12 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 32 * peso equals: destinationAccount balance.
	 
	! !

!TransferTest methodsFor: 'test' stamp: 'AC 6/15/2022 19:07:09'!
test02ATransferIsMadeAndTheValueIsObtained

	| destinationAccount originAccount transfer|
	
	originAccount := ReceptiveAccount new.
	Deposit register: 20 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 20 * peso on: destinationAccount.
	
	transfer := Transfer amount: 12 * peso from: originAccount to: destinationAccount.
	
	self assert: 12 * peso equals: transfer value.! !

!TransferTest methodsFor: 'test' stamp: 'AC 6/15/2022 19:18:55'!
test03ATransferIsMadeAndTheDepositLegKnowsItsWithdrawalCounterparty

	| destinationAccount originAccount transfer|
	
	originAccount := ReceptiveAccount new.
	Deposit register: 20 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 20 * peso on: destinationAccount.
	
	transfer := Transfer amount: 12 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg. ! !

!TransferTest methodsFor: 'test' stamp: 'AC 6/15/2022 19:22:12'!
test04ATransferIsMadeAndTheWithdrawalLegKnowsItsDepositCounterparty

	| destinationAccount originAccount transfer|
	
	originAccount := ReceptiveAccount new.
	Deposit register: 20 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 20 * peso on: destinationAccount.
	
	transfer := Transfer amount: 12 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg. ! !

!TransferTest methodsFor: 'test' stamp: 'AC 6/15/2022 19:42:04'!
test05ATransferIsMadeToTheSameAccountAndAnErrorIsReturned

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Transfer transferCannotBeMade. 
			self assert: 10 * peso equals: originAccount balance. 
		]! !

!TransferTest methodsFor: 'test' stamp: 'AC 6/15/2022 19:48:55'!
test06AZeroAmountTransferIsMadeAndAnErrorIsReturned

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 * peso from: originAccount to: destinationAccount ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Transfer transferCannotBeMade. 
			self assert: 10 * peso equals: originAccount balance. 
		]! !


!classDefinition: #TestServiciosFinancieros2 category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TestServiciosFinancieros2
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros-Ejercicio'!
TestServiciosFinancieros2 subclass: #AccountSummaryTest
	instanceVariableNames: 'emptyExpectedResult depositExpectedResult withdrawExpectedResult transferWithdrawExpectedResult transferDepositExpectedResult'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountSummaryTest methodsFor: 'setUp' stamp: 'AC 6/16/2022 18:44:13'!
setUp

	emptyExpectedResult := OrderedCollection new.
	emptyExpectedResult add: 'Balance = 0 * pesos'.
	
	depositExpectedResult := OrderedCollection new.
	depositExpectedResult add: 'Deposito por 100 * pesos'. 
	depositExpectedResult add: 'Balance = 100 * pesos'.
	
	withdrawExpectedResult := OrderedCollection new. 
	withdrawExpectedResult add: 'Extraccion por 50 * pesos'.
	withdrawExpectedResult add: 'Balance = -50 * pesos'.
	
	transferWithdrawExpectedResult := OrderedCollection new. 
	transferWithdrawExpectedResult add: 'Salida por transferencia de 20 * pesos'. 
	transferWithdrawExpectedResult add: 'Balance = -20 * pesos'.
	
	transferDepositExpectedResult := OrderedCollection new.
	transferDepositExpectedResult add: 'Entrada por transferencia de 30 * pesos'. 
	transferDepositExpectedResult add: 'Balance = 30 * pesos'.
	! !


!AccountSummaryTest methodsFor: 'test' stamp: 'AC 6/16/2022 01:00:55'!
test01AnAccountWithoutMovementsHasOnlyBalanceInAccountSummary

	| firstAccount accountSummary |
	
	firstAccount := ReceptiveAccount new.
	accountSummary := AccountSummary of: firstAccount.
	
	self assert: accountSummary generate equals: emptyExpectedResult .
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'AC 6/16/2022 01:00:44'!
test02AnAccountWithDepositHasOnlyDepositInAccountSummary
	
	| firstAccount accountSummary |
	
	firstAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: firstAccount. 
	accountSummary := AccountSummary of: firstAccount.
	
	self assert: accountSummary generate equals: depositExpectedResult.
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'AC 6/16/2022 01:00:35'!
test03AnAccountWithWithdrawHasOnlyDepositInAccountSummary
	
	| firstAccount accountSummary |
	
	firstAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: firstAccount. 
	accountSummary := AccountSummary of: firstAccount.
	
	self assert: accountSummary generate equals: withdrawExpectedResult.
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'AC 6/16/2022 01:00:27'!
test04AnAccountWithTransferWithdrawHasOnlyTransferWithdrawInAccountSummary
	
	| firstAccount secondAccount accountSummary |
	
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	Transfer amount: 20 * peso from: firstAccount to: secondAccount.
	accountSummary := AccountSummary of: firstAccount.
	
	self assert: accountSummary generate equals: transferWithdrawExpectedResult.
	! !

!AccountSummaryTest methodsFor: 'test' stamp: 'AC 6/16/2022 01:00:16'!
test05AnAccountWithTransferDepositHasOnlyTransferDepositInAccountSummary
	
	| firstAccount secondAccount accountSummary |
	
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	Transfer amount: 30 * peso from: secondAccount to: firstAccount.
	accountSummary := AccountSummary of: firstAccount.
	
	self assert: accountSummary generate equals: transferDepositExpectedResult.
	! !


!classDefinition: #DeteailedTreePrinterTest category: 'ServiciosFinancieros-Ejercicio'!
TestServiciosFinancieros2 subclass: #DeteailedTreePrinterTest
	instanceVariableNames: 'firstExpectedResult secondExpectedResult thirdExpectedResult fourthExpectedResult'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DeteailedTreePrinterTest methodsFor: 'test' stamp: 'AC 6/16/2022 14:02:05'!
test01PortfolioDetailedTreePrinterOfEmptyPortfolio

	| familyPortfolio detailedTreePrinter |
	
	familyPortfolio := Portfolio withName: 'Portfolio de la familia'.
	detailedTreePrinter := DetailedTreePrinter of: familyPortfolio.
	
	self assert: detailedTreePrinter generate equals: firstExpectedResult. ! !

!DeteailedTreePrinterTest methodsFor: 'test' stamp: 'AC 6/16/2022 14:42:19'!
test02PortfolioDetailedTreePrinterOfPortfolioWithAnAccount

	| familyPortfolio detailedTreePrinter account |
	
	account := ReceptiveAccount withName: 'Cuenta mia'.
	Deposit register: 100 * peso on: account.
	familyPortfolio := Portfolio withName: 'Portfolio de la familia' withAccount: account.
	detailedTreePrinter := DetailedTreePrinter of: familyPortfolio.
	
	self assert: detailedTreePrinter generate equals: secondExpectedResult. ! !

!DeteailedTreePrinterTest methodsFor: 'test' stamp: 'AC 6/16/2022 14:46:22'!
test03PortfolioDetailedTreePrinterOfPortfolioWithPortfolioAndAnAccountLinkedToThatLastPortfolio

	| familyPortfolio detailedTreePrinter juanAccount childrenPortfolio |
	
	juanAccount := ReceptiveAccount withName: 'Cuenta de Juan'.
	Deposit register: 100 * peso on: juanAccount.
	childrenPortfolio := Portfolio withName: 'Portfolio de hijos' withAccount: juanAccount. 
	familyPortfolio := Portfolio withName: 'Portfolio de la familia' withAccount: childrenPortfolio .
	detailedTreePrinter := DetailedTreePrinter of: familyPortfolio.
	
	self assert: detailedTreePrinter generate equals: thirdExpectedResult. ! !

!DeteailedTreePrinterTest methodsFor: 'test' stamp: 'AC 6/16/2022 14:58:01'!
test04PortfolioDetailedTreePrinterOfPortfolioWithAccountAndPortfolio

	| familyPortfolio detailedTreePrinter juanAccount childrenPortfolio angelesAccount account |
	
	account := ReceptiveAccount withName: 'Cuenta mia'.
	juanAccount := ReceptiveAccount withName: 'Cuenta de Juan'.
	angelesAccount := ReceptiveAccount withName: 'Cuenta de Angeles'.
	
	Deposit register: 100 * peso on: account.
	Withdraw register: 40 * peso on: account.
	Transfer amount: 50 * peso from: account to: angelesAccount.
	
	Deposit register: 100 * peso on: juanAccount.
	Withdraw register: 30 * peso on: juanAccount.
	
	childrenPortfolio := Portfolio withName: 'Portfolio de hijos' withAccount: juanAccount and: angelesAccount.
	familyPortfolio := Portfolio withName: 'Portfolio de la familia' withAccount: account and: childrenPortfolio.
	detailedTreePrinter := DetailedTreePrinter of: familyPortfolio.
	
	self assert: detailedTreePrinter generate equals: fourthExpectedResult. ! !


!DeteailedTreePrinterTest methodsFor: 'setUp' stamp: 'AC 6/16/2022 15:16:25'!
setUp

	firstExpectedResult := OrderedCollection new.
	firstExpectedResult add: 'Portfolio de la familia'.
	firstExpectedResult add: '  Balance = 0 * pesos'.
	
	secondExpectedResult := OrderedCollection new.
	secondExpectedResult add: 'Portfolio de la familia'.
	secondExpectedResult add: '  Cuenta mia'.
	secondExpectedResult add: '    Deposito por 100 * pesos'.
	secondExpectedResult add: '    Balance = 100 * pesos'.
	secondExpectedResult add: '  Balance = 100 * pesos'.
	
	thirdExpectedResult := OrderedCollection new.
	thirdExpectedResult add: 'Portfolio de la familia'.
	thirdExpectedResult add: '  Portfolio de hijos'.
	thirdExpectedResult add: '    Cuenta de Juan'.
	thirdExpectedResult add: '      Deposito por 100 * pesos'.
	thirdExpectedResult add: '      Balance = 100 * pesos'.
	thirdExpectedResult add: '    Balance = 100 * pesos'.
	thirdExpectedResult add: '  Balance = 100 * pesos'.
	
	fourthExpectedResult := OrderedCollection new.
	fourthExpectedResult add: 'Portfolio de la familia'.
	fourthExpectedResult add: '  Cuenta mia'.
	fourthExpectedResult add: '    Deposito por 100 * pesos'.
	fourthExpectedResult add: '    Extraccion por 40 * pesos'.
	fourthExpectedResult add: '    Salida por transferencia de 50 * pesos'.
	fourthExpectedResult add: '    Balance = 10 * pesos'.
	fourthExpectedResult add: '  Portfolio de hijos'.
	fourthExpectedResult add: '    Cuenta de Juan'.
	fourthExpectedResult add: '      Deposito por 100 * pesos'.
	fourthExpectedResult add: '      Extraccion por 30 * pesos'.
	fourthExpectedResult add: '      Balance = 70 * pesos'.
	fourthExpectedResult add: '    Cuenta de Angeles'.
	fourthExpectedResult add: '      Entrada por transferencia de 50 * pesos'.
	fourthExpectedResult add: '      Balance = 50 * pesos'.
	fourthExpectedResult add: '    Balance = 120 * pesos'.
	fourthExpectedResult add: '  Balance = 130 * pesos'.
	! !


!classDefinition: #TransferNetTest category: 'ServiciosFinancieros-Ejercicio'!
TestServiciosFinancieros2 subclass: #TransferNetTest
	instanceVariableNames: 'emptyExpectedNetValue transferDepositExpectedNetValue transferWithdrawExpectedNetValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferNetTest methodsFor: 'test' stamp: 'AC 6/16/2022 17:26:46'!
test01AnAccountWithoutMovementsHasZeroAccountNetTransferValue

	| account accountTransfer |
	
	account := ReceptiveAccount new.
	accountTransfer := AccountTransferNet of: account.
	
	self assert: accountTransfer generate equals: emptyExpectedNetValue. ! !

!TransferNetTest methodsFor: 'test' stamp: 'AC 6/16/2022 17:36:36'!
test02AnAccountWithTransferDepositHasTheCorrectAccountNetTransferValue

	| firstAccount secondAccount accountTransfer |
	
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	Transfer amount: 30 * peso from: secondAccount to: firstAccount.
	accountTransfer := AccountTransferNet of: firstAccount.
	
	self assert: accountTransfer generate equals: transferDepositExpectedNetValue. ! !

!TransferNetTest methodsFor: 'test' stamp: 'AC 6/16/2022 17:39:24'!
test03AnAccountWithTransferWithdrawHasTheCorrectAccountNetTransferValue

	| firstAccount secondAccount accountTransfer |
	
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	Transfer amount: 20 * peso from: firstAccount to: secondAccount.
	accountTransfer := AccountTransferNet of: firstAccount.
	
	self assert: accountTransfer generate equals: transferWithdrawExpectedNetValue. ! !


!TransferNetTest methodsFor: 'setUp' stamp: 'AC 6/16/2022 15:38:26'!
setUp
	
	emptyExpectedNetValue := 'Neto de transferencia = 0 * pesos'.
	transferDepositExpectedNetValue := 'Neto de transferencia = 30 * pesos'.
	transferWithdrawExpectedNetValue := 'Neto de transferencia = -20 * pesos'.! !


!classDefinition: #TreePrinterTest category: 'ServiciosFinancieros-Ejercicio'!
TestServiciosFinancieros2 subclass: #TreePrinterTest
	instanceVariableNames: 'firstExpectedResult secondExpectedResult thirdExpectedResult fourthExpectedResult'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TreePrinterTest methodsFor: 'test' stamp: 'AC 6/16/2022 11:02:53'!
test01PortfolioTreePrinterOfEmptyPortfolio

	| familyPortfolio treePrinter |
	
	familyPortfolio := Portfolio withName: 'Portfolio de la familia'.
	treePrinter := TreePrinter of: familyPortfolio.
	
	self assert: treePrinter generate equals: firstExpectedResult. ! !

!TreePrinterTest methodsFor: 'test' stamp: 'AC 6/16/2022 11:24:18'!
test02PortfolioTreePrinterOfPortfolioWithReceptiveaccount

	| familyPortfolio treePrinter account |
	
	account := ReceptiveAccount withName: 'Cuenta mia'.
	familyPortfolio := Portfolio withName: 'Portfolio de la familia' withAccount: account.
	treePrinter := TreePrinter of: familyPortfolio.
	
	self assert: treePrinter generate equals: secondExpectedResult. ! !

!TreePrinterTest methodsFor: 'test' stamp: 'AC 6/16/2022 11:29:19'!
test03PortfolioTreePrinterOfPortfolioWithReceptiveaccountAndPortfolio

	| familyPortfolio treePrinter account childrenPortfolio |
	
	account := ReceptiveAccount withName: 'Cuenta mia'.
	childrenPortfolio := Portfolio withName: 'Portfolio de hijos'.
	familyPortfolio := Portfolio withName: 'Portfolio de la familia' withAccount: account and: childrenPortfolio. 
	treePrinter := TreePrinter of: familyPortfolio.
	
	self assert: treePrinter generate equals: thirdExpectedResult. ! !

!TreePrinterTest methodsFor: 'test' stamp: 'AC 6/16/2022 12:21:02'!
test04PortfolioTreePrinterOfPortfolioWithReceptiveaccountAndPortfolioWithReceptiveAccounts

	| familyPortfolio treePrinter account childrenPortfolio juanAccount angelesAccount |
	
	account := ReceptiveAccount withName: 'Cuenta mia'.
	juanAccount := ReceptiveAccount withName: 'Cuenta de Juan'.
	angelesAccount := ReceptiveAccount withName: 'Cuenta de Angeles'.
	childrenPortfolio := Portfolio withName: 'Portfolio de hijos' withAccount: juanAccount and: angelesAccount.
	familyPortfolio := Portfolio withName: 'Portfolio de la familia' withAccount: account and: childrenPortfolio. 
	treePrinter := TreePrinter of: familyPortfolio.
	
	self assert: treePrinter generate equals: fourthExpectedResult. ! !


!TreePrinterTest methodsFor: 'setUp' stamp: 'AC 6/16/2022 12:39:17'!
setUp
	
	firstExpectedResult := OrderedCollection new.
	firstExpectedResult add: 'Portfolio de la familia'.
	
	secondExpectedResult := OrderedCollection new.
	secondExpectedResult add: 'Portfolio de la familia'.
	secondExpectedResult add: '  Cuenta mia'.
	
	thirdExpectedResult := OrderedCollection new.
	thirdExpectedResult add: 'Portfolio de la familia'.
	thirdExpectedResult add: '  Cuenta mia'.
	thirdExpectedResult add: '  Portfolio de hijos'.
	
	fourthExpectedResult := OrderedCollection new.
	fourthExpectedResult add: 'Portfolio de la familia'.
	fourthExpectedResult add: '  Cuenta mia'.
	fourthExpectedResult add: '  Portfolio de hijos'.
	fourthExpectedResult add: '    Cuenta de Juan'.
	fourthExpectedResult add: '    Cuenta de Angeles'.
	
	! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: 'accountName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'main protocol' stamp: 'AC 6/15/2022 23:04:40'!
balance
	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'AC 6/15/2022 23:04:53'!
transactions
	self subclassResponsibility ! !


!Account methodsFor: 'tree printer' stamp: 'AC 6/15/2022 23:03:38'!
name
	^accountName copy! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancieros-Ejercicio'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'instance creation' stamp: 'AC 6/16/2022 10:39:42'!
withName: anAccountName
	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'AC 6/15/2022 00:25:41'!
initialize
	accounts := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'AC 6/15/2022 20:44:35'!
initializeNamed: anAccountName
	accounts := OrderedCollection new.
	accountName := anAccountName 
	! !

!Portfolio methodsFor: 'initialization' stamp: 'AC 6/16/2022 11:17:50'!
initializeNamed: anAccountName withAccount: anAccount
	accounts := OrderedCollection with: anAccount.
	accountName := anAccountName 

	
! !

!Portfolio methodsFor: 'initialization' stamp: 'AC 6/16/2022 11:19:12'!
initializeNamed: anAccountName withAccount: anAccount and: anotherAccount
	accounts := OrderedCollection with: anAccount with: anotherAccount. 
	accountName := anAccountName ! !


!Portfolio methodsFor: 'main protocol' stamp: 'AC 6/15/2022 00:43:05'!
addTransactionsTo: aCollectionOfTransactions
	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'AC 6/16/2022 14:36:40'!
balance
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 * peso]
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'AC 6/16/2022 18:11:02'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions.! !

!Portfolio methodsFor: 'main protocol' stamp: 'AC 6/16/2022 17:53:15'!
wasRegistered: aTransaction
	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !


!Portfolio methodsFor: 'tree printer' stamp: 'AC 6/16/2022 00:04:11'!
addToAccountReport: aReportToPrint
	aReportToPrint addAPortfolio: self.! !


!Portfolio methodsFor: 'account management' stamp: 'AC 6/16/2022 18:37:02'!
accountsAndPortfolios
	^accounts copy.! !

!Portfolio methodsFor: 'account management' stamp: 'AC 6/16/2022 18:33:37'!
addAccount: anAccountToAdd
	
	self verifyAccount: anAccountToAdd with: accounts.
	self verifyThatAccountIsNotIncludeInItself: anAccountToAdd.
	
	accounts do: [ :anAccount |
		(anAccount isKindOf: Portfolio) ifTrue:[ anAccountToAdd checkIfYouHaveAccountIsInCommonWith: anAccount ] ]. 
	
	accounts add: anAccountToAdd.
	 ! !

!Portfolio methodsFor: 'account management' stamp: 'AC 6/16/2022 18:36:27'!
checkIfYouHaveAccountIsInCommonWith: aPortfolio

	self accountsAndPortfolios do: [ :anotherAccount | self verifyAccount: anotherAccount with: aPortfolio ].! !

!Portfolio methodsFor: 'account management' stamp: 'AC 6/15/2022 01:14:02'!
numberOfAccounts
	^accounts size! !

!Portfolio methodsFor: 'account management' stamp: 'AC 6/15/2022 01:08:15'!
verifyAccount: anAccountToAdd with: aCollectionOfAccounts
	(aCollectionOfAccounts includes: anAccountToAdd) ifTrue: [ self error: Portfolio canNotAddThisAccount ]. ! !

!Portfolio methodsFor: 'account management' stamp: 'AC 6/16/2022 18:34:49'!
verifyThatAccountIsNotIncludeInItself: anAccountToAdd

	( anAccountToAdd isEqualTo: self) ifTrue: [self error: Portfolio canNotAddThisAccount ].! !

!Portfolio methodsFor: 'account management' stamp: 'AC 6/16/2022 00:08:37'!
withAccountsDo: aClosure
	accounts do: aClosure ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'AC 6/16/2022 10:39:42'!
withName: anAccountName
	^self new initializeNamed: anAccountName ! !

!Portfolio class methodsFor: 'instance creation' stamp: 'AC 6/16/2022 11:09:30'!
withName: anAccountName withAccount: anAccount
	^self new initializeNamed: anAccountName withAccount: anAccount.! !

!Portfolio class methodsFor: 'instance creation' stamp: 'AC 6/16/2022 11:20:10'!
withName: anAccountName withAccount: anAccount and: anotherAccount
	^self new initializeNamed: anAccountName withAccount: anAccount and: anotherAccount.! !


!Portfolio class methodsFor: 'error' stamp: 'AC 6/15/2022 01:09:25'!
canNotAddThisAccount
	^'The account already exists in the portfolio'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'AC 6/15/2022 00:23:33'!
initialize
	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'AC 6/15/2022 20:49:52'!
initializeNamed: anAccountName
	transactions := OrderedCollection new.
	accountName := anAccountName ! !


!ReceptiveAccount methodsFor: 'tree printer' stamp: 'AC 6/15/2022 20:31:17'!
addToAccountReport: aReportToPrint
	aReportToPrint addReceptiveAccount: self.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'AC 6/15/2022 00:41:26'!
addTransactionsTo: aCollectionOfTransactions
	aCollectionOfTransactions addAll: transactions.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'AC 6/15/2022 00:26:28'!
balance

	^transactions 
		inject: 0 * peso
		into: [ :currentBalance :transaction | transaction modifyBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'AC 6/16/2022 18:40:57'!
checkIfYouHaveAccountIsInCommonWith: aPortfolio

	aPortfolio verifyAccount: self with: (aPortfolio accountsAndPortfolios ).! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'AC 6/15/2022 20:28:00'!
withTransactionsDo: aClosure
	transactions do: aClosure ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Ejercicio'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'instance creation' stamp: 'AC 6/16/2022 10:39:43'!
withName: anAccountName
	^self new initializeNamed: anAccountName ! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'balance' stamp: 'AC 6/15/2022 00:19:05'!
modifyBalance: aBalance
	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

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


!Deposit methodsFor: 'balance' stamp: 'AC 6/15/2022 00:18:57'!
modifyBalance: aBalance
	^aBalance + value! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'reports' stamp: 'AC 6/16/2022 00:42:33'!
addDescriptionToAccountReport: anAccountReport
	anAccountReport addReportOfDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferLeg methodsFor: 'value' stamp: 'AC 6/15/2022 01:29:00'!
value
	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'AC 6/15/2022 01:28:22'!
initializeWith: aTransfer
	transfer := aTransfer ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'AC 6/15/2022 01:27:17'!
of: aTransfer on: anAccount
	
	| transaction |
	
	transaction := self new initializeWith: aTransfer.
	anAccount register: transaction.
	
	^transaction ! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #TransferDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'private' stamp: 'AC 6/15/2022 19:13:52'!
withdrawLeg
	^transfer withdrawLeg ! !


!TransferDeposit methodsFor: 'reports' stamp: 'AC 6/16/2022 00:58:22'!
addDescriptionToAccountReport: anAccountReport
	anAccountReport addReportOfTransferDeposit: self.! !

!TransferDeposit methodsFor: 'reports' stamp: 'AC 6/16/2022 15:30:06'!
modifyNetValueOnAccountReport: anAccountReport
	anAccountReport makeTransferModificationsByDeposit: self.! !


!TransferDeposit methodsFor: 'balance' stamp: 'AC 6/15/2022 01:29:50'!
modifyBalance: aBalance
	^aBalance + self value! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #TransferWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'private' stamp: 'AC 6/15/2022 19:22:52'!
depositLeg
	^transfer depositLeg ! !


!TransferWithdraw methodsFor: 'reports' stamp: 'AC 6/16/2022 00:57:51'!
addDescriptionToAccountReport: anAccountReport
	anAccountReport addReportOfTransferWithdraw: self.! !

!TransferWithdraw methodsFor: 'reports' stamp: 'AC 6/16/2022 15:29:53'!
modifyNetValueOnAccountReport: anAccountReport
	anAccountReport makeTransferModificationsByWithdraw: self.! !


!TransferWithdraw methodsFor: 'balance' stamp: 'AC 6/15/2022 01:30:30'!
modifyBalance: aBalance
	^aBalance - self value! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'balance' stamp: 'AC 6/15/2022 00:19:39'!
modifyBalance: aBalance
	^aBalance - value! !


!Withdraw methodsFor: 'reports' stamp: 'AC 6/16/2022 00:45:21'!
addDescriptionToAccountReport: anAccountReport
	anAccountReport addReportOfWithdraw: self.! !


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


!classDefinition: #Reports category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Reports
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Reports methodsFor: 'initialization' stamp: 'AC 6/15/2022 19:53:09'!
initializeWith: anAccount
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Reports class' category: 'ServiciosFinancieros-Ejercicio'!
Reports class
	instanceVariableNames: ''!

!Reports class methodsFor: 'instance creation' stamp: 'AC 6/15/2022 19:52:18'!
of: anAccount
	^self new initializeWith: anAccount! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Ejercicio'!
Reports subclass: #AccountSummary
	instanceVariableNames: 'account summary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountSummary methodsFor: 'initialization' stamp: 'AC 6/15/2022 19:55:23'!
initializeWith: anAccount
	summary := OrderedCollection new.
	account := anAccount.! !


!AccountSummary methodsFor: 'private' stamp: 'AC 6/15/2022 20:21:43'!
addReportOfBalance
	summary add: 'Balance = ', account balance asString.! !

!AccountSummary methodsFor: 'private' stamp: 'AC 6/15/2022 19:57:25'!
addReportOfDeposit: aDeposit
	summary add: ('Deposito por ', aDeposit value asString).! !

!AccountSummary methodsFor: 'private' stamp: 'AC 6/15/2022 19:59:21'!
addReportOfTransferDeposit: aTransferDeposit
	summary add: ('Entrada por transferencia de ', aTransferDeposit value asString).! !

!AccountSummary methodsFor: 'private' stamp: 'AC 6/15/2022 20:00:33'!
addReportOfTransferWithdraw: aTransferWithdraw
	summary add: ('Salida por transferencia de ', aTransferWithdraw value asString).! !

!AccountSummary methodsFor: 'private' stamp: 'AC 6/15/2022 20:01:23'!
addReportOfWithdraw: aWithdraw
	summary add: ('Extraccion por ', aWithdraw value asString).! !

!AccountSummary methodsFor: 'private' stamp: 'AC 6/15/2022 20:27:06'!
generate
	account withTransactionsDo: [ :anAccountTransaction | anAccountTransaction addDescriptionToAccountReport: self ].
	self addReportOfBalance.
	
	^summary. ! !


!classDefinition: #AccountTransferNet category: 'ServiciosFinancieros-Ejercicio'!
Reports subclass: #AccountTransferNet
	instanceVariableNames: 'account accountNetValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransferNet methodsFor: 'initialization' stamp: 'AC 6/16/2022 15:19:05'!
initializeWith: anAccount
	account := anAccount.
	accountNetValue := 0 * peso.! !


!AccountTransferNet methodsFor: 'private' stamp: 'AC 6/16/2022 17:29:14'!
generate
	account withTransactionsDo: [ :aTransaction | aTransaction  modifyNetValueOnAccountReport: self].
	
	^'Neto de transferencia = ', accountNetValue asString.! !

!AccountTransferNet methodsFor: 'private' stamp: 'AC 6/16/2022 15:31:58'!
makeTransferModificationsByDeposit: aTransferDeposit
	accountNetValue := accountNetValue + aTransferDeposit value. ! !

!AccountTransferNet methodsFor: 'private' stamp: 'AC 6/16/2022 15:31:13'!
makeTransferModificationsByWithdraw: aTransferWithdraw
	accountNetValue := accountNetValue - aTransferWithdraw value.! !


!classDefinition: #SpecialReports category: 'ServiciosFinancieros-Ejercicio'!
Reports subclass: #SpecialReports
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!classDefinition: #DetailedTreePrinter category: 'ServiciosFinancieros-Ejercicio'!
SpecialReports subclass: #DetailedTreePrinter
	instanceVariableNames: 'portfolio portfolioTree'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DetailedTreePrinter methodsFor: 'private' stamp: 'AC 6/16/2022 14:31:50'!
addAPortfolio: aPortfolio
	(DetailedTreePrinter of: aPortfolio) generate do: [ :accountDetailedPrinter | portfolioTree add: '  ', accountDetailedPrinter ].! !

!DetailedTreePrinter methodsFor: 'private' stamp: 'AC 6/16/2022 14:32:05'!
addReceptiveAccount: aReceptiveAccount
	portfolioTree add: '  ', aReceptiveAccount name.
	(AccountSummary of: aReceptiveAccount) generate do: [ :accountSummary | portfolioTree add: '    ', accountSummary ].! !

!DetailedTreePrinter methodsFor: 'private' stamp: 'AC 6/16/2022 14:35:30'!
generate
	portfolioTree add: portfolio name.
	
	portfolio withAccountsDo: [ :anAccount | anAccount addToAccountReport: self ].
	
	portfolioTree add: '  Balance = ', portfolio balance asString.
	
	^portfolioTree ! !


!DetailedTreePrinter methodsFor: 'initialization' stamp: 'AC 6/16/2022 01:05:42'!
initializeWith: aPortfolio
	portfolio := aPortfolio.
	portfolioTree := OrderedCollection new.! !


!classDefinition: #TreePrinter category: 'ServiciosFinancieros-Ejercicio'!
SpecialReports subclass: #TreePrinter
	instanceVariableNames: 'portfolio portfolioTree'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TreePrinter methodsFor: 'initialization' stamp: 'AC 6/15/2022 20:35:21'!
initializeWith: aPortfolio
	portfolio := aPortfolio.
	portfolioTree := OrderedCollection new.! !


!TreePrinter methodsFor: 'private' stamp: 'AC 6/16/2022 14:29:53'!
addAPortfolio: aPortfolio
	(TreePrinter of: aPortfolio) generate do: [ :anAccount | portfolioTree add: '  ', anAccount ].! !

!TreePrinter methodsFor: 'private' stamp: 'AC 6/16/2022 14:29:57'!
addReceptiveAccount: aReceptiveAccount
	portfolioTree add: '  ', aReceptiveAccount name asString.! !

!TreePrinter methodsFor: 'private' stamp: 'AC 6/16/2022 00:07:48'!
generate
	portfolioTree add: portfolio name.
	
	portfolio withAccountsDo: [ :anAccount | anAccount addToAccountReport: self ].
	
	^portfolioTree ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'amount withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'private' stamp: 'AC 6/15/2022 19:19:17'!
depositLeg
	^depositLeg ! !

!Transfer methodsFor: 'private' stamp: 'AC 6/15/2022 17:15:48'!
value
	^amount! !

!Transfer methodsFor: 'private' stamp: 'AC 6/15/2022 19:10:19'!
withdrawLeg
	^withdrawLeg ! !


!Transfer methodsFor: 'initialization' stamp: 'AC 6/15/2022 16:50:56'!
initializeWith: anAmount withdrawLeg: aTransferWithdraw depositLeg: aTransferDeposit

	amount := anAmount. 
	withdrawLeg := aTransferWithdraw.
	depositLeg := aTransferDeposit. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'AC 6/15/2022 16:45:56'!
amount: anAmount from: originAccount to: destinationAccount

	| transfer deposit withdraw |
	
	self assert: anAmount canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdraw := TransferWithdraw of: transfer on: originAccount.
	deposit := TransferDeposit of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmount withdrawLeg: withdraw depositLeg: deposit.! !


!Transfer class methodsFor: 'error' stamp: 'AC 6/15/2022 16:45:05'!
transferCannotBeMade
	^'The transfer cannot be made'! !


!Transfer class methodsFor: 'assertions' stamp: 'AC 6/15/2022 16:39:55'!
assert: anAmount canBeTransferedTo: destinationAccount from: originAccount

	self assertTransferTo: destinationAccount from: originAccount.
	self assertTransferAmount: anAmount. ! !

!Transfer class methodsFor: 'assertions' stamp: 'AC 6/15/2022 19:44:21'!
assertTransferAmount: anAmount
	^anAmount isZero ifTrue: [ self error: Transfer transferCannotBeMade ].! !

!Transfer class methodsFor: 'assertions' stamp: 'AC 6/15/2022 19:44:32'!
assertTransferTo: destinationAccount from: originAccount

	^originAccount = destinationAccount ifTrue: [ self error: Transfer transferCannotBeMade ].! !
