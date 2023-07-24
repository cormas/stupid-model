"
Stupid cell 
"
Class {
	#name : #StupidCell,
	#superclass : #CMSpatialEntityCell,
	#instVars : [
		'food'
	],
	#classVars : [
		'MaxFoodProductionRate'
	],
	#category : #'Stupid-Model'
}

{ #category : #accessing }
StupidCell class >> entityName [

	^ 'Cell'
]

{ #category : #accessing }
StupidCell class >> maxFoodProductionRate [

	^ MaxFoodProductionRate
		  ifNil: [ MaxFoodProductionRate := 0.01 ]
]

{ #category : #converting }
StupidCell >> asString [
	" Private - See superimplementor's comment "

	^ String streamContents: [ : stream |
		stream 
			<< super asString;
			cr;
			<< 'food: ';
			<< food asString ]
]

{ #category : #accessing }
StupidCell >> food [
	^ food ifNil: [ food :=  0.1]
]

{ #category : #accessing }
StupidCell >> food: anObject [
	food := anObject
]

{ #category : #converting }
StupidCell >> interestingDetails [
	" Answer a <Collection> of interesting receiver's attributes, from a modeler point of view, to display in a popup for example "

	^ super interestingDetails , { 
		'Food: ' -> (self food asString)
		}
]

{ #category : #pov }
StupidCell >> pov [

	^ self
		  povAttribute: #food
		  min: 0.1
		  max: 0.3
		  color: Color green
]

{ #category : #control }
StupidCell >> step [
	self updateFood.
]

{ #category : #accessing }
StupidCell >> updateFood [

	self food: self food + (self food
		 * (Cormas randomFloatFrom: 0 to: self class maxFoodProductionRate))
]
