"
I am a select dialog to display DebugPoints so that the scope of a DebugPoint can be set to a specific object.
"
Class {
	#name : 'DebugPointSelectDialog',
	#superclass : 'SpSelectDialog',
	#classTraits : '{} + TraitedClass',
	#instVars : [
		'code',
		'scope',
		'inputFilter',
		'variableTargetPresenter'
	],
	#category : 'DebugPointUI',
	#package : 'DebugPointUI'
}

{ #category : 'layout' }
DebugPointSelectDialog >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  borderWidth: 5;
		  spacing: 5;
		  add: label expand: false;
		  add: (SpPanedLayout newTopToBottom
				   add: list;
				   add: code;
				   yourself);
		  yourself
]

{ #category : 'initialization' }
DebugPointSelectDialog >> initializePresenters [

	label := self newLabel.

	list := DebugPointTablePresenter new.
	code := DebugPointCodePresenter new
		        beForScripting;
		        editable: false.

	self initializeVariableTargetPresenter.

	list transmitDo: [ :dp |
		dp ifNotNil: [ dp updateDebugPointUIManager: self ] ]
]

{ #category : 'initialization' }
DebugPointSelectDialog >> initializeVariableTargetPresenter [

	variableTargetPresenter := DebugPointVariableTargetPresenter new.
	variableTargetPresenter layout: variableTargetPresenter dialogLayout
]

{ #category : 'initialization' }
DebugPointSelectDialog >> initializeWindow: aWindowPresenter [ 
	
	aWindowPresenter
		title: 'Debug Points';		
		windowIcon: (self application iconNamed: #glamorousBug);
		initialExtent: 800@400

]

{ #category : 'api' }
DebugPointSelectDialog >> items: items [
	"filter debug points such that only those that are attached to the class of the inspected object are displayed"

	list items: (items select: [ :db | db targetClass = self scope ])
]

{ #category : 'accessing' }
DebugPointSelectDialog >> scope [  
	^scope
]

{ #category : 'accessing' }
DebugPointSelectDialog >> scope: anObject [ 
"see items: method"
	scope := anObject class
]

{ #category : 'update' }
DebugPointSelectDialog >> updateCode: aDebugPointTarget [

	code updateCode: aDebugPointTarget
]

{ #category : 'update' }
DebugPointSelectDialog >> updateVariableTargetPresenterFrom: aDebugPointTarget [

	variableTargetPresenter target: aDebugPointTarget
]

{ #category : 'update' }
DebugPointSelectDialog >> variableTargetLayout [

	^ SpBoxLayout newTopToBottom
		  borderWidth: 5;
		  spacing: 5;
		  add: label expand: false;
		  add: (SpPanedLayout newTopToBottom
				   add: list;
				   add: variableTargetPresenter;
				   positionOfSlider: 30 percent;
				   yourself);
		  yourself
]
