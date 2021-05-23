Class {
	#name : #NEActivationFunctionMutationOperation,
	#superclass : #NEAbstractNonStructuralMutationOperation,
	#category : #'HyperNeat-Core'
}

{ #category : #'instance creation' }
NEActivationFunctionMutationOperation >> on: anIndividual [
	| node newActivation |
	node := anIndividual nodes atRandom: random.
	newActivation := ActivationFunction allSubclasses atRandom: random.
	node activation: newActivation.
]
