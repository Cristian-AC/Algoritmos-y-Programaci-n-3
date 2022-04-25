!classDefinition: #Lara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Lara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Lara class' category: 'AvispasYAbejasParte2'!
Lara class
	instanceVariableNames: 'huevosDeLara'!

!Lara class methodsFor: 'as yet unclassified' stamp: 'AC 4/24/2022 21:36:28'!
getCantidadDeHuevos
	^huevosDeLara.! !

!Lara class methodsFor: 'as yet unclassified' stamp: 'AC 4/24/2022 21:37:08'!
inicializarValores
	huevosDeLara := 0.! !

!Lara class methodsFor: 'as yet unclassified' stamp: 'AC 4/24/2022 21:54:34'!
intentarReproducirse
	(Oriana getCantidadDeHuevos > 0) | (Ornella getCantidadDeHuevos > 0) | (Polly getCantidadDeHuevos > 0) ifTrue: [self reproducirse].
	 ! !

!Lara class methodsFor: 'as yet unclassified' stamp: 'AC 4/24/2022 21:47:26'!
reproducirse
	huevosDeLara := (huevosDeLara + 1).
	Oriana restarUnHuevo.
	Polly restarUnHuevo.
	Ornella restarUnHuevo.! !


!Lara class methodsFor: '--** private fileout/in **--' stamp: 'AC 4/24/2022 21:55:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	huevosDeLara := 0.! !


!classDefinition: #NuevoHabitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #NuevoHabitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NuevoHabitat class' category: 'AvispasYAbejasParte2'!
NuevoHabitat class
	instanceVariableNames: 'huevosDeAvispas cantidadDeOrugas cantidadDePolillas huevosDePolilla'!

!NuevoHabitat class methodsFor: 'as yet unclassified' stamp: 'AC 4/22/2022 23:10:53'!
cantidadDeHuevosDeAvispas
	^huevosDeAvispas! !

!NuevoHabitat class methodsFor: 'as yet unclassified' stamp: 'AC 4/23/2022 01:44:00'!
cantidadDeOrugas
	^cantidadDeOrugas! !

!NuevoHabitat class methodsFor: 'as yet unclassified' stamp: 'AC 4/23/2022 18:47:39'!
cantidadDePolillas
	^cantidadDePolillas! !

!NuevoHabitat class methodsFor: 'as yet unclassified' stamp: 'AC 4/23/2022 19:01:50'!
crearDosOrugas
	cantidadDeOrugas := (cantidadDeOrugas + 2).! !

!NuevoHabitat class methodsFor: 'as yet unclassified' stamp: 'AC 4/23/2022 19:09:57'!
crearDosPolillas
	cantidadDePolillas := (cantidadDePolillas + 2).! !

!NuevoHabitat class methodsFor: 'as yet unclassified' stamp: 'AC 4/23/2022 19:02:34'!
crearHuevoDeAvispa
	huevosDeAvispas := (huevosDeAvispas + 1).
	cantidadDeOrugas := (cantidadDeOrugas - 1).
	cantidadDePolillas := (cantidadDePolillas -1).! !

!NuevoHabitat class methodsFor: 'as yet unclassified' stamp: 'AC 4/23/2022 01:36:49'!
crearOrugasYPolillas
	cantidadDeOrugas := 10.
	cantidadDePolillas := 10.! !

!NuevoHabitat class methodsFor: 'as yet unclassified' stamp: 'AC 4/23/2022 19:02:48'!
crearUnaOruga
	cantidadDeOrugas := (cantidadDeOrugas + 1).! !

!NuevoHabitat class methodsFor: 'as yet unclassified' stamp: 'AC 4/23/2022 19:01:11'!
crearUnaPolilla
	cantidadDePolillas := (cantidadDePolillas + 1).! !

!NuevoHabitat class methodsFor: 'as yet unclassified' stamp: 'AC 4/24/2022 20:31:34'!
restarUnHuevoDeAvispa
	huevosDeAvispas := (huevosDeAvispas - 1).! !

!NuevoHabitat class methodsFor: 'as yet unclassified' stamp: 'AC 4/24/2022 20:14:02'!
retrocederHabitatAlInicio
	huevosDeAvispas := 0.
	huevosDePolilla := 0.
	cantidadDeOrugas := 0.
	cantidadDePolillas := 0.! !


!NuevoHabitat class methodsFor: '--** private fileout/in **--' stamp: 'AC 4/24/2022 21:55:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	huevosDeAvispas := 0.
	cantidadDeOrugas := 0.
	cantidadDePolillas := 0.
	huevosDePolilla := 0.! !


!classDefinition: #Oriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Oriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Oriana class' category: 'AvispasYAbejasParte2'!
Oriana class
	instanceVariableNames: 'huevosDeOriana'!

!Oriana class methodsFor: 'as yet unclassified' stamp: 'AC 4/24/2022 20:03:16'!
getCantidadDeHuevos
	^huevosDeOriana.! !

!Oriana class methodsFor: 'as yet unclassified' stamp: 'AC 4/24/2022 20:15:34'!
inicializarValores
	huevosDeOriana := 0.! !

!Oriana class methodsFor: 'as yet unclassified' stamp: 'AC 4/24/2022 19:58:10'!
intentarReproducirse
	(NuevoHabitat cantidadDeOrugas > 0) ifTrue: [self reproducirse].! !

!Oriana class methodsFor: 'as yet unclassified' stamp: 'AC 4/24/2022 20:05:32'!
reproducirse
	huevosDeOriana := (huevosDeOriana + 1).
	NuevoHabitat crearHuevoDeAvispa.
	! !

!Oriana class methodsFor: 'as yet unclassified' stamp: 'AC 4/24/2022 21:40:28'!
restarUnHuevo
	huevosDeOriana := (huevosDeOriana - 1).! !


!Oriana class methodsFor: '--** private fileout/in **--' stamp: 'AC 4/24/2022 21:55:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	huevosDeOriana := 0.! !


!classDefinition: #Ornella category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Ornella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Ornella class' category: 'AvispasYAbejasParte2'!
Ornella class
	instanceVariableNames: 'huevosDeOrnella'!

!Ornella class methodsFor: 'as yet unclassified' stamp: 'AC 4/24/2022 20:18:30'!
getCantidadDeHuevos
	^huevosDeOrnella.! !

!Ornella class methodsFor: 'as yet unclassified' stamp: 'AC 4/24/2022 20:17:15'!
inicializarValores
	huevosDeOrnella := 0.! !

!Ornella class methodsFor: 'as yet unclassified' stamp: 'AC 4/24/2022 19:59:25'!
intentarReproducirse
	(NuevoHabitat cantidadDeOrugas > 0) ifTrue: [self reproducirse].! !

!Ornella class methodsFor: 'as yet unclassified' stamp: 'AC 4/24/2022 20:35:48'!
reproducirse
	NuevoHabitat crearHuevoDeAvispa.
	Oriana reproducirse.
	NuevoHabitat crearUnaOruga.
	NuevoHabitat restarUnHuevoDeAvispa.
	huevosDeOrnella := (huevosDeOrnella + 1).! !

!Ornella class methodsFor: 'as yet unclassified' stamp: 'AC 4/24/2022 21:46:30'!
restarUnHuevo
	huevosDeOrnella := (huevosDeOrnella - 1).! !


!Ornella class methodsFor: '--** private fileout/in **--' stamp: 'AC 4/24/2022 21:55:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	huevosDeOrnella := 0.! !


!classDefinition: #Polly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Polly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Polly class' category: 'AvispasYAbejasParte2'!
Polly class
	instanceVariableNames: 'huevosDePolly'!

!Polly class methodsFor: 'as yet unclassified' stamp: 'AC 4/24/2022 20:18:44'!
getCantidadDeHuevos
	^huevosDePolly.! !

!Polly class methodsFor: 'as yet unclassified' stamp: 'AC 4/24/2022 20:17:25'!
inicializarValores
	huevosDePolly := 0.! !

!Polly class methodsFor: 'as yet unclassified' stamp: 'AC 4/24/2022 19:59:58'!
intentarReproducirse
	(NuevoHabitat cantidadDePolillas > 0) ifTrue: [self reproducirse].! !

!Polly class methodsFor: 'as yet unclassified' stamp: 'AC 4/24/2022 20:21:21'!
reproducirse
	NuevoHabitat crearHuevoDeAvispa.
	huevosDePolly := (huevosDePolly + 1).! !

!Polly class methodsFor: 'as yet unclassified' stamp: 'AC 4/24/2022 21:46:56'!
restarUnHuevo
	huevosDePolly := (huevosDePolly - 1).! !


!Polly class methodsFor: '--** private fileout/in **--' stamp: 'AC 4/24/2022 21:55:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	huevosDePolly := 0.! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'AC 4/22/2022 22:52:05'!
test01EnElInicioDeLosTiemposNoHayHuevos	


	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:44'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:11'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:53'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:18'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:46'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:40'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:30'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AC 4/24/2022 21:52:27'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^Lara getCantidadDeHuevos.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AC 4/24/2022 20:03:44'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^Oriana getCantidadDeHuevos.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AC 4/24/2022 20:19:57'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^Ornella getCantidadDeHuevos.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AC 4/24/2022 20:20:30'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^Polly getCantidadDeHuevos.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AC 4/22/2022 22:48:45'!
habitat
	^NuevoHabitat! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AC 4/23/2022 01:51:25'!
hacerQueElHabitatTengaLosRecursosSuficientes
	NuevoHabitat crearOrugasYPolillas! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AC 4/24/2022 21:37:33'!
laAvispaLara
	Lara inicializarValores.
	^Lara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AC 4/24/2022 20:15:58'!
laAvispaOriana
	Oriana inicializarValores.
	^Oriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AC 4/24/2022 20:17:45'!
laAvispaOrnella
	Ornella inicializarValores.
	^Ornella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AC 4/24/2022 20:18:05'!
laAvispaPolly
	Polly inicializarValores.
	^Polly.
! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AC 4/23/2022 01:45:26'!
queElHabitatTengaDosOrugasMas
	NuevoHabitat crearDosOrugas! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AC 4/23/2022 19:10:43'!
queElHabitatTengaDosPolillasMas
	NuevoHabitat crearDosPolillas! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AC 4/23/2022 01:39:21'!
queElHabitatTengaUnaOrugaMas
	NuevoHabitat crearUnaOruga! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AC 4/23/2022 18:50:40'!
queElHabitatTengaUnaPolillaMas
	NuevoHabitat crearUnaPolilla! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AC 4/22/2022 23:21:21'!
retrocederElHabitatAlInicioDeLosTiempos
	NuevoHabitat retrocederHabitatAlInicio! !

Lara initializeAfterFileIn!
NuevoHabitat initializeAfterFileIn!
Oriana initializeAfterFileIn!
Ornella initializeAfterFileIn!
Polly initializeAfterFileIn!