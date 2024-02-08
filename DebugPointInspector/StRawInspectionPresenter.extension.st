Extension { #name : 'StRawInspectionPresenter' }

{ #category : '*DebugPointInspector' }
StRawInspectionPresenter >> breakInspectedObjectOnAccess [

	^ self breakInspectedObjectOnAccess: #all
]

{ #category : '*DebugPointInspector' }
StRawInspectionPresenter >> breakInspectedObjectOnAccess: access [
	| selectedItem |
	selectedItem := self selectedItem.
	selectedItem ifNil:[
		"No selection: halt on all accesses"
		^ self model breakOnAccess: access ].
	selectedItem key asSymbol == #self 
		ifTrue:[
			"Self is selected: halt on all accesses"
			^ self model breakOnAccess: access].
	^ self model breakOnAccess: access toSlotNamed: selectedItem key
]

{ #category : '*DebugPointInspector' }
StRawInspectionPresenter >> breakInspectedObjectOnRead [

	^ self breakInspectedObjectOnAccess: #read
]

{ #category : '*DebugPointInspector' }
StRawInspectionPresenter >> breakInspectedObjectOnWrite [

	^ self breakInspectedObjectOnAccess: #write
]

{ #category : '*DebugPointInspector' }
StRawInspectionPresenter >> watchInspectedObjectAccess [

	^ self watchInspectedObjectOnAccess: #all
]

{ #category : '*DebugPointInspector' }
StRawInspectionPresenter >> watchInspectedObjectOnAccess: access [
	| selectedItem |
	selectedItem := self selectedItem.
	selectedItem ifNil:[
		"No selection: halt on all accesses"
		^ self model watchOnAccess: access ].
	selectedItem key asSymbol == #self 
		ifTrue:[
			"Self is selected: halt on all accesses"
			^ self model watchOnAccess: access].
	^ self model watchOnAccess: access toSlotNamed: selectedItem key
]

{ #category : '*DebugPointInspector' }
StRawInspectionPresenter >> watchInspectedObjectRead [

	^ self watchInspectedObjectOnAccess: #read
]

{ #category : '*DebugPointInspector' }
StRawInspectionPresenter >> watchInspectedObjectWrite [

	^ self watchInspectedObjectOnAccess: #write
]
