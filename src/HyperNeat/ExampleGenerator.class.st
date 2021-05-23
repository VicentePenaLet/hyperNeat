Class {
	#name : #ExampleGenerator,
	#superclass : #Object,
	#instVars : [
		'examples'
	],
	#classInstVars : [
		'examples',
		'random'
	],
	#category : #'HyperNeat-Neat-VisualDiscrimination'
}

{ #category : #running }
ExampleGenerator class >> run [ 
	random := Random seed: 42.
	examples:= OrderedCollection new.
	1 to: 25 do:[:unused||ex x y| 
					ex := Example new.
					ex	createGrid.
					x:= (1 to: 7) atRandom: random.
					y:= (1 to: 7) atRandom: random.
					ex spawnSmall: 0 position: (Array with: x with:y). 
					examples add: ex].
 ^examples
]
