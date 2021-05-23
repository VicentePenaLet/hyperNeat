Class {
	#name : #Gaussian,
	#superclass : #ActivationFunction,
	#category : #'HyperNeat-Core'
}

{ #category : #'target resize' }
Gaussian class >> apply: z [
^ (z*z) negated exp
]
