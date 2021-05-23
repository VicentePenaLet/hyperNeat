Class {
	#name : #ToyExample,
	#superclass : #Example,
	#category : #'HyperNeat-Neat-VisualDiscrimination'
}

{ #category : #copying }
ToyExample >> createGrid [
| image |
image:= OrderedCollection new. 
-1 to: 1  do: [ :x| |inner| 
									inner:= OrderedCollection new. 
									-1 to: 1 do:
										[ :y| inner add:  0].
									image add: inner].
grid:=image





]

{ #category : #copying }
ToyExample >> spawnSmall [
   |x y|
	x:= (1 to: 3) atRandom:random.
	y:= (1 to: 3) atRandom:random.
	self spawnSmall: 0 position: (Array with: x with:y). 




]

{ #category : #copying }
ToyExample >> spawnSmall: size [
   |x y|
	x:= (1 to: 3) atRandom: random.
	y:= (1 to: 3) atRandom: random.
	self spawnSmall: size position: (Array with: x with:y). 




]

{ #category : #copying }
ToyExample >> spawnSmall: size position: aPosition [
   |values x y|
	smallSize:= size.
	values:= -1 to: 1.

	x:= aPosition at:1.
	y:= aPosition at:2.

	self putSquare: size atRow: x column: y.
	smallPosition := Array with: (values at: x) with:(values at: y).
	smallIndex:= Array with: x with: y	




]
