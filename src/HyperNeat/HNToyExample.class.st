Class {
	#name : #HNToyExample,
	#superclass : #Object,
	#instVars : [
		'datasets',
		'activationFunctionMutationOperationProb',
		'addConnectionMutationOperationProb',
		'addNodeMutationOperationProb',
		'connectionWeightMutationOperationProb',
		'crossoverOperationProb',
		'neat',
		'elitismN'
	],
	#category : #'HyperNeat-Examples'
}

{ #category : #running }
HNToyExample >> activationFunctionMutationOperationProb [
^activationFunctionMutationOperationProb
]

{ #category : #running }
HNToyExample >> activationFunctionMutationOperationProb: prob [
activationFunctionMutationOperationProb:= prob
]

{ #category : #running }
HNToyExample >> addConnectionMutationOperationProb [
^addConnectionMutationOperationProb
]

{ #category : #running }
HNToyExample >> addConnectionMutationOperationProb: prob [
addConnectionMutationOperationProb:= prob
]

{ #category : #running }
HNToyExample >> addNodeMutationOperationProb [
^addNodeMutationOperationProb
]

{ #category : #running }
HNToyExample >> addNodeMutationOperationProb: prob [
addNodeMutationOperationProb:= prob
]

{ #category : #running }
HNToyExample >> connectionWeightMutationOperationProb [
^connectionWeightMutationOperationProb
]

{ #category : #running }
HNToyExample >> connectionWeightMutationOperationProb: prob [
connectionWeightMutationOperationProb:= prob
]

{ #category : #running }
HNToyExample >> crossoverOperationProb [
^crossoverOperationProb
]

{ #category : #running }
HNToyExample >> crossoverOperationProb: prob [
crossoverOperationProb:= prob
]

{ #category : #running }
HNToyExample >> initialize [ 
neat := NEAT new.
]

{ #category : #running }
HNToyExample >> neat [ 
^neat
]

{ #category : #running }
HNToyExample >> optimize [ 
| i values |
i := 0.
values := #(0.1 0.3 0.5 0.7).
values do:[:activation| 
	values do:[:weight|
		values do:[:connection|
			values do: [:node|
				values do: [:crossover||ex|
					ex := HNToyExample new.
					ex activationFunctionMutationOperationProb: activation.
					ex connectionWeightMutationOperationProb: weight.
					ex addConnectionMutationOperationProb: connection.
					ex addNodeMutationOperationProb: node.
					ex crossoverOperationProb: crossover.
					ex neat logFileName: ('logs/{1}.txt' format: {i}).
					ex run.
					i := i+1.
					]]]]].
]

{ #category : #running }
HNToyExample >> run [ 
|substrate getPosition|
substrate:= OrderedCollection new.
(-1 to: 1 ) do:[:x| (-1 to: 1 ) do: [ :y| substrate add: (Array with: x with: y)]].


NEIndividualCPPN inputs: substrate. 
NEIndividualCPPN outputs: substrate.

neat populationSize: 100. 
neat resetConfig.
neat individualClass: NEIndividualCPPN.
neat resetConfig.

neat activationFunctionMutationOperationProb: activationFunctionMutationOperationProb.
neat connectionWeightMutationOperationProb: connectionWeightMutationOperationProb.
neat addConnectionMutationOperationProb: addConnectionMutationOperationProb.
neat addNodeMutationOperationProb: addNodeMutationOperationProb.
neat crossoverOperationProb: crossoverOperationProb.

neat for: NEActivationFunctionMutationOperation prob: activationFunctionMutationOperationProb.
neat for: NEConnectionWeightMutationOperation prob: connectionWeightMutationOperationProb.
neat for: NEAddConnectionMutationOperation prob: addConnectionMutationOperationProb.
neat for: NEAddNodeMutationOperation prob: addNodeMutationOperationProb.
neat for: NECrossoverOperation prob: crossoverOperationProb.
neat numberOfInputs: 5.
neat numberOfOutputs: 1.
neat updateHyperParameters.

getPosition:= [ :individual| |out m position|
	out:= individual network nodes select:[:node| node isOutput].
	m := 0.
	out do: [:node| (m <= node result) ifTrue:[m:= node result. position:= node position]].
	position].
datasets := OrderedCollection new.
ToyExampleGenerator random: neat random.
neat fitness: [ :cpp | 
		| score network y1 y2 result error dataset|
		score := 0.
		dataset:= ToyExampleGenerator run.
		datasets add: dataset.
		cpp buildANNFromCPP.
		dataset do: [ :example |  example evaluate: cpp.
										 result:= getPosition value: cpp.
										 example predicted: result.
										 error:= (result  - (example smallPosition)) squared sum.
										 score:= score + error].
									score negated asFloat].

neat numberOfGenerations: 50.
neat run.
^neat
]

{ #category : #running }
HNToyExample >> tournamentSize: n [
self neat tournamentSize: n.
]
