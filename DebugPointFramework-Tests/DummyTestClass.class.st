"
I am a test class for running DebugPointTest tests.
"
Class {
	#name : 'DummyTestClass',
	#superclass : 'Object',
	#instVars : [
		'id'
	],
	#category : 'DebugPointFramework-Tests-Utils',
	#package : 'DebugPointFramework-Tests',
	#tag : 'Utils'
}

{ #category : 'accessing' }
DummyTestClass >> id [

	^ id
]

{ #category : 'accessing' }
DummyTestClass >> id: anId [
	^id := anId
]

{ #category : 'initialization' }
DummyTestClass >> initialize [

	super initialize.
	id := 0
]
