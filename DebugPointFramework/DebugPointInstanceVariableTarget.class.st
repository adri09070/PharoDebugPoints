Class {
	#name : 'DebugPointInstanceVariableTarget',
	#superclass : 'DebugPointTarget',
	#instVars : [
		'onRead',
		'onWrite'
	],
	#category : 'DebugPointFramework-Implementations',
	#package : 'DebugPointFramework',
	#tag : 'Implementations'
}

{ #category : 'accessing' }
DebugPointInstanceVariableTarget >> accessStrategy: aSymbol [

	onRead := #( #read #all ) includes: aSymbol.
	onWrite := #( #write #all ) includes: aSymbol
]

{ #category : 'action' }
DebugPointInstanceVariableTarget >> browse [

	Smalltalk tools browser
		openOnClass: self instanceVariable owningClass;
		switchToVariables;
		selectVariableNamed: self instanceVariable name
]

{ #category : 'accessing' }
DebugPointInstanceVariableTarget >> instanceVariable [

	^ self target
]

{ #category : 'accessing' }
DebugPointInstanceVariableTarget >> instanceVariable: anInstanceVariable [

	self target: anInstanceVariable
]

{ #category : 'accessing' }
DebugPointInstanceVariableTarget >> targetClass [

	^ self instanceVariable owningClass
]
