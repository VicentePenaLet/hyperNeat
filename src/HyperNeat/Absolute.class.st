Class {
	#name : #Absolute,
	#superclass : #ActivationFunction,
	#category : #'HyperNeat-Core'
}

{ #category : #'target resize' }
Absolute class >> apply: z [
	^ z abs
]
