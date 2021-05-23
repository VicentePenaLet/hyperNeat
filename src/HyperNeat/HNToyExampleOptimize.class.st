Class {
	#name : #HNToyExampleOptimize,
	#superclass : #Object,
	#category : #'HyperNeat-Examples'
}

{ #category : #optimizing }
HNToyExampleOptimize class >> optimize [ 
| i values |
i := 0.
values:= #(0.1 0.3 0.5 0.7).
values copy do:[:activation| 
	values copy do:[:weight|
		values copy do:[:connection|
			values copy do: [:node|
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

{ #category : #optimizing }
HNToyExampleOptimize class >> run [ 
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
