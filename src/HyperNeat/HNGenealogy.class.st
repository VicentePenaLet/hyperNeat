Class {
	#name : #HNGenealogy,
	#superclass : #Object,
	#instVars : [
		'population',
		'logs'
	],
	#category : #'HyperNeat-Core'
}

{ #category : #accessing }
HNGenealogy >> add: collection [ 
population add: collection
]

{ #category : #accessing }
HNGenealogy >> drawIndividuals [

population do: [ :generation| 
	generation do: [:ind| 
		ind draw]]
]

{ #category : #accessing }
HNGenealogy >> initialize [ 
population := OrderedCollection new.
]

{ #category : #accessing }
HNGenealogy >> loadGeneration: gen [
^ (FileSystem disk workingDirectory / 'logs'/ gen asString ) children collect: [:file| (STONReader on: (file readStream)) next].
]

{ #category : #accessing }
HNGenealogy >> population [
^population
]
