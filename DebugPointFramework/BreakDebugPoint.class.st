"
I am a debug point that breaks when it is hit.
"
Class {
	#name : #BreakDebugPoint,
	#superclass : #DebugPoint,
	#category : #'DebugPointFramework-Implementations'
}

{ #category : #API }
BreakDebugPoint >> hitWithContext: aContext [
	<debuggerCompleteToSender>
	
	(super hitWithContext: aContext) ifFalse: [^self].
	
	Break break.
]

{ #category : #accessing }
BreakDebugPoint >> name [
	^#Breakpoint
]

{ #category : #'ui building' }
BreakDebugPoint >> uiElement [ 
	^SpLabelPresenter new "label: 'Break'".
]