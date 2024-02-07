Class {
	#name : 'DebugPointClassTarget',
	#superclass : 'DebugPointTarget',
	#category : 'DebugPointFramework-Base',
	#package : 'DebugPointFramework',
	#tag : 'Base'
}

{ #category : 'actions' }
DebugPointClassTarget >> install: aLink [

	self install: aLink on: self targetClass
]

{ #category : 'actions' }
DebugPointClassTarget >> install: aLink on: aClassOrObject [

	self subclassResponsibility
]

{ #category : 'accessing' }
DebugPointClassTarget >> scope [

	^ self targetClass
]
