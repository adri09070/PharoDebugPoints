"
I am the UI for the complete DebugPoint Manager.
"
Class {
	#name : 'DebugPointManagerUI',
	#superclass : 'SpPresenter',
	#classTraits : '{} + TraitedClass',
	#instVars : [
		'dpTable',
		'dpEditor',
		'dpCode',
		'inputFilter',
		'selectAllCheckbox',
		'variableTargetPresenter'
	],
	#category : 'DebugPointUI',
	#package : 'DebugPointUI'
}

{ #category : 'world menu' }
DebugPointManagerUI class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'Debug Point Manager')
		parent: #Debug;
		action: [ self new open ];
		order: -3;
		help: 'for more information contact max.zurbriggen@uzh.ch';
		icon: (self iconNamed: #glamorousBug).
	aBuilder withSeparatorAfter
]

{ #category : 'action handling' }
DebugPointManagerUI >> activateAllDebugPoints [

	dpTable items do: [ :debugPoint |
		self activateDebugPoint: debugPoint ]
]

{ #category : 'action handling' }
DebugPointManagerUI >> activateDebugPoint: debugPoint [

	(debugPoint getBehavior: ChainBehavior)
		ifNil: [ debugPoint enabled: true ]
		ifNotNil: [ debugPoint resetChain ]
]

{ #category : 'initialization' }
DebugPointManagerUI >> connectPresenters [

	inputFilter whenSubmitDo: [ :text |
		self items: DebugPoint all asOrderedCollection ].
	selectAllCheckbox
		whenActivatedDo: [ self activateAllDebugPoints ];
		whenDeactivatedDo: [ self deactivateAllDebugPoints ]
]

{ #category : 'action handling' }
DebugPointManagerUI >> deactivateAllDebugPoints [

	dpTable items do: [ :debugPoint |
		self deactivateDebugPoint: debugPoint ]
]

{ #category : 'action handling' }
DebugPointManagerUI >> deactivateDebugPoint: debugPoint [

	debugPoint enabled: false
]

{ #category : 'layout' }
DebugPointManagerUI >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newLeftToRight
				   add: selectAllCheckbox expand: false;
				   add: inputFilter;
				   yourself)
		  expand: false;
		  add: (SpPanedLayout newLeftToRight
				   add: (SpPanedLayout newTopToBottom
						    add: dpTable;
						    add: dpCode;
						    positionOfSlider: 50 percent;
						    yourself);
				   add: dpEditor;
				   positionOfSlider: 50 percent;
				   yourself);
		  yourself
]

{ #category : 'initialization' }
DebugPointManagerUI >> initialize [ 

	super initialize.
	SystemAnnouncer uniqueInstance weak when: DebugPointAdded send: #updateTable to: self.
	SystemAnnouncer uniqueInstance weak when: DebugPointRemoved send: #updateTable to: self.
	SystemAnnouncer uniqueInstance weak when: DebugPointChanged send: #updateEditor to: self.
		
	
]

{ #category : 'initialization' }
DebugPointManagerUI >> initializePresenters [

	self initializeTable.
	dpEditor := DebugPointEditor new.
	dpCode := DebugPointCodePresenter new editable: false.

	inputFilter := self newSearchInput
		               placeholder: 'Search by name';
		               yourself.
	selectAllCheckbox := self newCheckBox
		                     label: '(De)activate all';
		                     yourself.
	self initializeVariableTargetPresenter
]

{ #category : 'presenter building' }
DebugPointManagerUI >> initializeTable [

	dpTable := DebugPointTablePresenter new.

	dpTable whenSelectionChangedDo: [ :sel |
		dpEditor debugPoint: dpTable selectedItem.
		dpTable selectedItem ifNotNil: [ :dp |
			dp updateDebugPointUIManager: self ] ]
]

{ #category : 'presenter building' }
DebugPointManagerUI >> initializeVariableTargetPresenter [

	variableTargetPresenter := DebugPointVariableTargetPresenter new
]

{ #category : 'initialization' }
DebugPointManagerUI >> initializeWindow: aWindowPresenter [
	
	aWindowPresenter
		title: 'Debug Point Browser';		
		windowIcon: (self application iconNamed: #glamorousBug);
		initialExtent: 800@550
]

{ #category : 'api' }
DebugPointManagerUI >> items: aDebugPointCollection [

	dpTable items: (aDebugPointCollection select: [ :db |
			 db name beginsWith: inputFilter text ])
]

{ #category : 'enumerating' }
DebugPointManagerUI >> select: aDebugPoint [
	dpTable selectItem: aDebugPoint 
]

{ #category : 'updating - presenters' }
DebugPointManagerUI >> updateCode: aDebugPointTarget [

	dpCode updateCode: aDebugPointTarget
]

{ #category : 'updating - presenters' }
DebugPointManagerUI >> updateEditor [
	dpTable refresh.
	dpEditor updateAll .

	
]

{ #category : 'updating - presenters' }
DebugPointManagerUI >> updateTable [
	| prevSel |
	prevSel := dpTable selectedItem.
	dpTable items: DebugPoint all asOrderedCollection .
	dpTable selectItem: prevSel.

	
]

{ #category : 'updating - presenters' }
DebugPointManagerUI >> updateVariableTargetPresenterFrom: aDebugPointTarget [

	variableTargetPresenter target: aDebugPointTarget
]

{ #category : 'layout' }
DebugPointManagerUI >> variableTargetLayout [

	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newLeftToRight
				   add: selectAllCheckbox expand: false;
				   add: inputFilter;
				   yourself)
		  expand: false;
		  add: (SpPanedLayout newLeftToRight
				   add: (SpPanedLayout newTopToBottom
						    add: dpTable;
						    add: variableTargetPresenter;
						    positionOfSlider: 40 percent;
						    yourself);
				   add: dpEditor;
				   positionOfSlider: 50 percent;
				   yourself);
		  yourself
]
