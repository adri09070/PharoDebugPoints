Extension { #name : 'BreakDebugPoint' }

{ #category : '*DebugPointUI' }
BreakDebugPoint >> uiElement [ 
	^BreakPresenter new debugPoint: self.
]
