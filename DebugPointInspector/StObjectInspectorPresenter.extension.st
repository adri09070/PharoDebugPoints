Extension { #name : 'StObjectInspectorPresenter' }

{ #category : '*DebugPointInspector' }
StObjectInspectorPresenter >> breakInspectedObjectOnAccess [

	^ self inspectedObject breakOnReadWrite
]

{ #category : '*DebugPointInspector' }
StObjectInspectorPresenter >> breakInspectedObjectOnRead [

	^ self inspectedObject breakOnRead
]

{ #category : '*DebugPointInspector' }
StObjectInspectorPresenter >> breakInspectedObjectOnWrite [

	^ self inspectedObject breakOnWrite
]

{ #category : '*DebugPointInspector' }
StObjectInspectorPresenter >> watchInspectedObjectAccess [

	^ self inspectedObject watchOnReadWrite
]

{ #category : '*DebugPointInspector' }
StObjectInspectorPresenter >> watchInspectedObjectRead [

	^ self inspectedObject watchOnRead
]

{ #category : '*DebugPointInspector' }
StObjectInspectorPresenter >> watchInspectedObjectWrite [

	^ self inspectedObject watchOnWrite
]
