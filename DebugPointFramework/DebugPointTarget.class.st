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

{ #category : 'scope creation' }
DebugPointTarget >> beForObject: anObject [

	^ DebugPointObjectTarget new
		  targetInstance: anObject;
		  subTarget: self;
		  yourself
]

{ #category : 'actions' }
DebugPointTarget >> browse [

	self subclassResponsibility 
]

{ #category : 'installing' }
DebugPointTarget >> install: aLink [

	self subclassResponsibility
]

{ #category : 'description' }
DebugPointTarget >> scope [

	^ self subclassResponsibility
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
