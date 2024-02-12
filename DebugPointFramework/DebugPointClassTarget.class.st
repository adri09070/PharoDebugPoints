Class {
	#name : 'DebugPointClassTarget',
	#superclass : 'DebugPointTarget',
	#category : 'DebugPointFramework-Base',
	#package : 'DebugPointFramework',
	#tag : 'Base'
}

{ #category : 'installing' }
DebugPointClassTarget >> install: aLink [

	self install: aLink on: self targetClass
]

{ #category : 'private ' }
DebugPointClassTarget >> install: aLink on: aClassOrObject [

	self subclassResponsibility
]

{ #category : 'description' }
DebugPointClassTarget >> scope [

	^ 'class {1}' format: { self targetClass }
]
