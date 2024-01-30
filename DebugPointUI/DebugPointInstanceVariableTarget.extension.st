Extension { #name : 'DebugPointInstanceVariableTarget' }

{ #category : '*DebugPointUI' }
DebugPointInstanceVariableTarget >> updateDebugPointUIManager: aDebugPointUIManager [

	aDebugPointUIManager updateVariableTargetPresenterFrom: self.
	aDebugPointUIManager layout:
		aDebugPointUIManager variableTargetLayout
]
