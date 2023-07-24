"
A stupid agent
"
Class {
	#name : #StupidAgent,
	#superclass : #CMLocatedAgent,
	#instVars : [
		'agsize'
	],
	#category : #'Stupid-Model'
}

{ #category : #accessing }
StupidAgent class >> entityName [

	^ 'Agent'
]

{ #category : #accessing }
StupidAgent >> agsize [
	^ agsize ifNil: [ agsize := 20 ]
]

{ #category : #accessing }
StupidAgent >> agsize: anObject [
	agsize := anObject
]

{ #category : #growth }
StupidAgent >> gowing [

	self agsize: (self agsize  + self patch food).
	self patch food: 0 .
]

{ #category : #accessing }
StupidAgent >> interestingDetails [
	" Answer a <Collection> of interesting receiver's attributes, from a modeler point of view, to display in a popup for example "

	^ super interestingDetails , { 
		'Size: ' -> (self agsize asString)
		}
]

{ #category : #running }
StupidAgent >> move [
	"move to an empty cell... if not don't move"

	self randomWalkConstrainedBy: [
			:c | c noOccupant ].
]

{ #category : #pov }
StupidAgent >> pov [

	^ Color blue
]

{ #category : #accessing }
StupidAgent >> sizeOfPOV [
	
	^ self agsize
]

{ #category : #control }
StupidAgent >> step [

	self move.
	self gowing.
]
