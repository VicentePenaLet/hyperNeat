Class {
	#name : #Sigmoid,
	#superclass : #ActivationFunction,
	#category : #'HyperNeat-Core'
}

{ #category : #'target resize' }
Sigmoid class >> apply: z [
	^ 1 / (1 + z negated exp)
]
