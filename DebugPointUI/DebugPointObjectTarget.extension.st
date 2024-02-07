Extension { #name : 'DebugPointObjectTarget' }

{ #category : '*DebugPointUI' }
DebugPointObjectTarget >> updateDebugPointUIManager: aDebugPointUIManager [

	^ self subTarget updateDebugPointUIManager: aDebugPointUIManager 
]
