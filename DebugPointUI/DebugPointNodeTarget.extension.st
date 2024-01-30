Extension { #name : 'DebugPointNodeTarget' }

{ #category : '*DebugPointUI' }
DebugPointNodeTarget >> updateDebugPointUIManager: aDebugPointUIManager [

	aDebugPointUIManager updateCode: self.
	aDebugPointUIManager layout: aDebugPointUIManager defaultLayout
]
