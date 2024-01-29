Class {
	#name : 'DebugPointNodeTarget',
	#superclass : 'DebugPointTarget',
	#category : 'DebugPointFramework-Implementations',
	#package : 'DebugPointFramework',
	#tag : 'Implementations'
}

{ #category : 'action' }
DebugPointNodeTarget >> browse [

	^ self method browse
]

{ #category : 'accessing' }
DebugPointNodeTarget >> method [
	"returns the method to which the debug point is attached"

	^ self methodNode compiledMethod
]

{ #category : 'accessing' }
DebugPointNodeTarget >> methodNode [

	^ self node methodNode
]

{ #category : 'accessing' }
DebugPointNodeTarget >> node [

	^ self target
]

{ #category : 'accessing' }
DebugPointNodeTarget >> node: aNode [

	self target: aNode
]

{ #category : 'accessing' }
DebugPointNodeTarget >> sourceCode [

	^ self methodNode sourceCode
]

{ #category : 'accessing' }
DebugPointNodeTarget >> targetClass [

	^ self method methodClass
]

{ #category : 'description' }
DebugPointNodeTarget >> targetString [

	^ self method printString
]
