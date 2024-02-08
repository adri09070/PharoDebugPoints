Extension { #name : 'Object' }

{ #category : '*DebugPointFramework' }
Object >> breakOnAccess: anAccessStrategySymbol [

	^ self class allSlots do: [ :slot |
		  self breakOnAccess: anAccessStrategySymbol toSlotNamed: slot name ]
]

{ #category : '*DebugPointFramework' }
Object >> breakOnAccess: anAccessStrategySymbol toSlotNamed: slotName [

	^ self
		  installDebugPoint: BreakDebugPoint
		  onSlotNamed: slotName
		  onAccess: anAccessStrategySymbol
]

{ #category : '*DebugPointFramework' }
Object >> breakOnCallTo: aMethodSelector [

	^ DebugPointManager
		  installNew: BreakDebugPoint
		  On: (self class compiledMethodAt: aMethodSelector) ast
		  forObject: self
]

{ #category : '*DebugPointFramework' }
Object >> breakOnRead [

	^ self breakOnAccess: #read
]

{ #category : '*DebugPointFramework' }
Object >> breakOnReadTo: aSlotName [

	^ self breakOnAccess: #read toSlotNamed: aSlotName
]

{ #category : '*DebugPointFramework' }
Object >> breakOnReadWrite [

	^ self breakOnAccess: #all
]

{ #category : '*DebugPointFramework' }
Object >> breakOnReadWriteTo: aSlotName [

	^ self breakOnAccess: #all toSlotNamed: aSlotName
]

{ #category : '*DebugPointFramework' }
Object >> breakOnWrite [

	^ self breakOnAccess: #write
]

{ #category : '*DebugPointFramework' }
Object >> breakOnWriteTo: aSlotName [

	^ self breakOnAccess: #write toSlotNamed: aSlotName
]

{ #category : '*DebugPointFramework' }
Object >> breakOnceOnCallTo: aMethodSelector [

	^ DebugPointManager
		  installNew: BreakDebugPoint
		  On: (self class compiledMethodAt: aMethodSelector) ast
		  forObject: self
		  withBehaviors: { OnceBehavior }
]

{ #category : '*DebugPointFramework' }
Object >> installDebugPoint: aDebugPointClass onSlotNamed: slotName onAccess: anAccessStrategySymbol [

	^ DebugPointManager
		  installNew: aDebugPointClass
		  forObject: self
		  onVariableNamed: slotName
		  accessStrategy: anAccessStrategySymbol
]

{ #category : '*DebugPointFramework' }
Object >> watchOnAccess: anAccessStrategySymbol [

	^ self class allSlots do: [ :slot |
		  self watchOnAccess: anAccessStrategySymbol toSlotNamed: slot name ]
]

{ #category : '*DebugPointFramework' }
Object >> watchOnAccess: anAccessStrategySymbol toSlotNamed: slotName [

	^ self
		  installDebugPoint: WatchDebugPoint
		  onSlotNamed: slotName
		  onAccess: anAccessStrategySymbol
]

{ #category : '*DebugPointFramework' }
Object >> watchOnRead [

	^ self watchOnAccess: #read
]

{ #category : '*DebugPointFramework' }
Object >> watchOnReadTo: aSlotName [

	^ self watchOnAccess: #read toSlotNamed: aSlotName
]

{ #category : '*DebugPointFramework' }
Object >> watchOnReadWrite [

	^ self watchOnAccess: #all
]

{ #category : '*DebugPointFramework' }
Object >> watchOnReadWriteTo: aSlotName [

	^ self watchOnAccess: #all toSlotNamed: aSlotName
]

{ #category : '*DebugPointFramework' }
Object >> watchOnWrite [

	^ self watchOnAccess: #write
]

{ #category : '*DebugPointFramework' }
Object >> watchOnWriteTo: aSlotName [

	^ self watchOnAccess: #write toSlotNamed: aSlotName
]
