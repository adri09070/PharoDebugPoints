Class {
	#name : 'DebugPointVariableTargetPresenter',
	#superclass : 'SpPresenter',
	#classTraits : '{} + TraitedClass',
	#instVars : [
		'target',
		'impactedNodesCache',
		'readCheckbox',
		'writeCheckbox',
		'readWriteCheckbox',
		'toolbar',
		'impactedMethodList',
		'codePresenter'
	],
	#category : 'DebugPointUI',
	#package : 'DebugPointUI'
}

{ #category : 'initialization' }
DebugPointVariableTargetPresenter >> connectPresenters [

	impactedMethodList transmitDo: [ :methodOrBlock |
		methodOrBlock ifNotNil: [ self updateCodeFromMethod: methodOrBlock ] ].

	"implement radio button activation"
	self setupRadioButtonActivationListeners
]

{ #category : 'layout' }
DebugPointVariableTargetPresenter >> defaultLayout [

	^ self newBoxLayoutTopToBottom
		  add: (self newBoxLayoutLeftToRight
				   add: readCheckbox expand: false;
				   add: writeCheckbox expand: false)
		  expand: false;
		  add: (self newBoxLayoutLeftToRight
				   add: readWriteCheckbox expand: false;
				   add: toolbar expand: false;
				   yourself)
		  expand: false;
		  add: (self newPanedLayoutTopToBottom
				   add: impactedMethodList;
				   add: codePresenter;
				   positionOfSlider: 30 percent;
				   yourself);
		  yourself
]

{ #category : 'initialization' }
DebugPointVariableTargetPresenter >> initializeCode [

	codePresenter := self newCode
		                 beNotEditable;
		                 yourself
]

{ #category : 'initialization' }
DebugPointVariableTargetPresenter >> initializeMethodList [

	impactedMethodList := self newFilteringList
		                      items: {  };
		                      sortingBlock: [ :m1 :m2 |
			                      m1 methodClass name < m2 methodClass name
				                      and: [ m1 method name < m2 method name ] ];
		                      yourself
]

{ #category : 'initialization' }
DebugPointVariableTargetPresenter >> initializePresenters [

	self initializeRadioButtons.
	self initializeMethodList.
	self initializeCode.
	self initializeToolbar
]

{ #category : 'initialization' }
DebugPointVariableTargetPresenter >> initializeRadioButtons [

	self initializeReadRadioButton.
	self initializeWriteRadioButton.
	self initializeReadWriteRadioButton.
	readCheckbox associatedRadioButtons: {
			writeCheckbox.
			readWriteCheckbox }
]

{ #category : 'initialization' }
DebugPointVariableTargetPresenter >> initializeReadRadioButton [

	readCheckbox := self newRadioButton
		                label: 'read only';
		                yourself
]

{ #category : 'initialization' }
DebugPointVariableTargetPresenter >> initializeReadWriteRadioButton [

	readWriteCheckbox := self newRadioButton
		                     label: 'read / write';
		                     yourself
]

{ #category : 'initialization' }
DebugPointVariableTargetPresenter >> initializeToolbar [

	toolbar := self newToolbar
		           add: (self newToolbarButton
				            label: 'Refresh';
				            icon: (self iconNamed: #smallUpdate);
				            help: 'Update method list and code';
				            action: [ self updateMethodList ];
				            yourself);
		           yourself
]

{ #category : 'initialization' }
DebugPointVariableTargetPresenter >> initializeWriteRadioButton [

	writeCheckbox := self newRadioButton
		                 label: 'write only';
		                 yourself
]

{ #category : 'initialization' }
DebugPointVariableTargetPresenter >> setupRadioButtonActivationListeners [

	readCheckbox whenActivatedDo: [ self target accessStrategy: #read ].
	writeCheckbox whenActivatedDo: [ self target accessStrategy: #write ].
	readWriteCheckbox whenActivatedDo: [
		self target accessStrategy: #all ]
]

{ #category : 'accessing' }
DebugPointVariableTargetPresenter >> target [

	^ target
]

{ #category : 'accessing' }
DebugPointVariableTargetPresenter >> target: aDebugPointInstanceVariableTarget [

	target := aDebugPointInstanceVariableTarget.
	self updatePresenter
]

{ #category : 'initialization' }
DebugPointVariableTargetPresenter >> updateCodeFromMethod: method [

	codePresenter
		text: method sourceCode;
		beForMethod: method.
	impactedNodesCache
		select: [ :node | node methodNode == method ast ]
		thenDo: [ :node |
			codePresenter addTextSegmentDecoration:
				(SpTextPresenterDecorator forHighlight
					 interval: (node start to: node stop + 1);
					 yourself) ]
]

{ #category : 'initialization' }
DebugPointVariableTargetPresenter >> updateImpactedNodesCache [

	impactedNodesCache := self target impactedNodes
]

{ #category : 'initialization' }
DebugPointVariableTargetPresenter >> updateMethodList [

	self updateImpactedNodesCache.
	impactedMethodList items: (impactedNodesCache collect: [ :node |
			 node methodOrBlockNode compiledMethod ]) asIdentitySet
]

{ #category : 'initialization' }
DebugPointVariableTargetPresenter >> updatePresenter [

	self target ifNil: [ ^ self ].
	self updateMethodList.
	self updateRadioButtonsState
]

{ #category : 'initialization' }
DebugPointVariableTargetPresenter >> updateRadioButtonsState [

	readCheckbox state: self target isReadOnly.
	writeCheckbox state: self target isWriteOnly.
	readWriteCheckbox state: self target isReadWrite
]