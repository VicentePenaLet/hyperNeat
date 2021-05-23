Class {
	#name : #HNGenealogyIndividual,
	#superclass : #Object,
	#instVars : [
		'id',
		'gen',
		'parents',
		'children',
		'lastMutation',
		'crossOver',
		'nConnections',
		'nNeurons',
		'activationFunctions',
		'canvas'
	],
	#category : #'HyperNeat-Core'
}

{ #category : #accessing }
HNGenealogyIndividual >> activationFunctions [
^activationFunctions
]

{ #category : #accessing }
HNGenealogyIndividual >> addChild: aGenealogyIndividual [
children add: aGenealogyIndividual.
]

{ #category : #accessing }
HNGenealogyIndividual >> addParent: aGenealogyIndividual [
parents add: aGenealogyIndividual.
]

{ #category : #accessing }
HNGenealogyIndividual >> addToActivationFunction: class [
|previous|
class ifNotNil:[
previous := activationFunctions at: class.
activationFunctions at: class put: (previous + 1).]

]

{ #category : #accessing }
HNGenealogyIndividual >> children [
^children
]

{ #category : #accessing }
HNGenealogyIndividual >> computeStatistics [


]

{ #category : #accessing }
HNGenealogyIndividual >> crossOver [
^crossOver
]

{ #category : #accessing }
HNGenealogyIndividual >> crossOver: boolean [.
crossOver := boolean.
]

{ #category : #accessing }
HNGenealogyIndividual >> draw [
|keys y x ind p |
ind := self.
keys := ind activationFunctions keys.
y := OrderedCollection new.
keys do: [:key| y add: (ind activationFunctions at: key)].
x := 1 to: (keys size +2).

nNeurons := ind nNeurons.
nConnections := ind nConnections.

y add: nNeurons.
y add: nConnections.

canvas := RSChart new.
p := RSBarPlot  new x: x y: y.
canvas addPlot: p.

canvas addDecoration: RSHorizontalTick new.
canvas addDecoration: RSVerticalTick new. 
]

{ #category : #accessing }
HNGenealogyIndividual >> gen [
^gen
]

{ #category : #accessing }
HNGenealogyIndividual >> gen: aGeneration [
gen := aGeneration
]

{ #category : #accessing }
HNGenealogyIndividual >> id [
^id
]

{ #category : #accessing }
HNGenealogyIndividual >> id: anId [ 
id := anId
]

{ #category : #accessing }
HNGenealogyIndividual >> initialize [ 
|keys|
children := OrderedCollection new.
parents := OrderedCollection new.
activationFunctions := Dictionary new.
keys:= ActivationFunction allSubclasses.

keys do: [ :key| activationFunctions at: key put: 0].
]

{ #category : #accessing }
HNGenealogyIndividual >> lastMutation [
^lastMutation
]

{ #category : #accessing }
HNGenealogyIndividual >> lastMutation: aMutation [
lastMutation := aMutation.
]

{ #category : #accessing }
HNGenealogyIndividual >> loadFromLogs [

]

{ #category : #accessing }
HNGenealogyIndividual >> nConnections [
^nConnections
]

{ #category : #accessing }
HNGenealogyIndividual >> nConnections: n [
nConnections := n
]

{ #category : #accessing }
HNGenealogyIndividual >> nNeurons [
^nNeurons

]

{ #category : #accessing }
HNGenealogyIndividual >> nNeurons: n [
nNeurons := n
]

{ #category : #accessing }
HNGenealogyIndividual >> parents [
^parents
]
