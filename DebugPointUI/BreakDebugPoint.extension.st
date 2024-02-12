Extension { #name : 'BreakDebugPoint' }

{ #category : '*DebugPointUI' }
BreakDebugPoint >> uiElement [ 
	^BreakUI new debugPoint: self.
]
