Class {
	#name : #BaselineOfStupidModel,
	#superclass : #BaselineOf,
	#category : #BaselineOfStupidModel
}

{ #category : #baselines }
BaselineOfStupidModel >> baseline: spec [

	<baseline>
	spec for: #common do: [
		"Dependencies"
		self loadCormas: spec.

		"Packages"
		spec
			package: 'Stupid-Model' with: [ spec requires: #(Cormas) ];
			package: 'Stupid-Model-Tests' with: [ spec requires: #( 'Stupid-Model' ) ] ]
]

{ #category : #dependencies }
BaselineOfStupidModel >> loadCormas: spec [

	spec
		baseline: 'Cormas'
		with: [ spec loads: #(Core); repository: 'github://cormas/cormas' ]
]
