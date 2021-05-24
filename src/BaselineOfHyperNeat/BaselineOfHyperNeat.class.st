Class {
	#name : #BaselineOfHyperNeat,
	#superclass : #BaselineOf,
	#category : #BaselineOfHyperNeat
}

{ #category : #baselines }
BaselineOfHyperNeat >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'Roassal3'
				with: [ spec repository: 'github://ObjectProfile/Roassal3/src' ].
			spec
				package: 'HyperNeat' with: [ spec requires: #('Roassal3') ].	
				spec
		group: 'default'
		with: #('HyperNeat')]
]
