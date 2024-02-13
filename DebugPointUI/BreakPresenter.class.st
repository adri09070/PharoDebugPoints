"
I am the UI element for a breakpoint.
"
Class {
	#name : 'BreakPresenter',
	#superclass : 'DebugPointPresenter',
	#category : 'DebugPointUI',
	#package : 'DebugPointUI'
}

{ #category : 'layout' }
BreakPresenter >> defaultLayout [ 
	
	^SpBoxLayout newTopToBottom 
		add: (self newLabel label: 'Break') expand: false ;
		yourself.
		

]
