Class {
	#name : 'DebugPointTarget',
	#superclass : 'Object',
	#instVars : [
		'target'
	],
	#category : 'DebugPointFramework-Base',
	#package : 'DebugPointFramework',
	#tag : 'Base'
}

{ #category : 'private' }
DebugPointTarget >> browse [

	self subclassResponsibility 
]

{ #category : 'accessing' }
DebugPointTarget >> target [

	^ target
]

{ #category : 'accessing' }
DebugPointTarget >> target: anObject [

	target := anObject
]

{ #category : 'accessing' }
DebugPointTarget >> targetClass [

	self subclassResponsibility
]

{ #category : 'description' }
DebugPointTarget >> targetString [

	^ self target printString
]
