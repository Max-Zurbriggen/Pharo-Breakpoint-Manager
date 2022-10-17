Class {
	#name : #BreakpointEditor,
	#superclass : #SpPresenter,
	#instVars : [
		'breakpoint',
		'enabledCheckbox',
		'oneshotCheckbox',
		'oncountCheckbox',
		'currentCountTextbox',
		'breakOnCountTextbox',
		'groupTextbox',
		'conditionCheckbox',
		'conditionTextbox'
	],
	#category : #BreakpointBrowser
}

{ #category : #layout }
BreakpointEditor >> defaultLayout [
		
	^ SpBoxLayout newTopToBottom
		add: (SpGridLayout build: [ :builder |
			builder
				add: 'Enabled:';
				add: enabledCheckbox;
				nextRow;
				add: 'Once active:';
				add: oneshotCheckbox;
				nextRow;
				add: 'On Count active:';
				add: oncountCheckbox;
				nextRow;
				add: 'Current count:';
				add: currentCountTextbox;
				nextRow;
				add: 'Break on count:';
				add: breakOnCountTextbox;
				nextRow;
				add: 'Group:';
				add: groupTextbox]);
"				nextRow;
				add: 'Condition active:';
				add: conditionCheckbox;
				nextRow;
				add: 'Condition:';
				add: conditionTextbox]);"
		yourself.
]

{ #category : #initialization }
BreakpointEditor >> initializePresenters [

	enabledCheckbox := self newCheckBox state: true.
	oneshotCheckbox := self newCheckBox state: false.
	oncountCheckbox := self newCheckBox state: false.
	currentCountTextbox := self newNumberInput beInteger.
	breakOnCountTextbox := self newNumberInput beInteger.
	groupTextbox := self newTextInput editable: false.
	conditionCheckbox := self newCheckBox state: false; enabled: false .
	conditionTextbox := self newTextInput editable: false .
	
	self initializeSaveChanges.
]

{ #category : #initialization }
BreakpointEditor >> initializeSaveChanges [ 
		
	enabledCheckbox whenChangedDo: [ :s | breakpoint enabled: s ].
	oneshotCheckbox whenChangedDo: [ :s | breakpoint once: s ].
	oncountCheckbox whenChangedDo: [ :s | breakpoint onCount: s ].
	currentCountTextbox whenTextChangedDo: [ :state | breakpoint count: state ].
	breakOnCountTextbox whenTextChangedDo: [ :state | breakpoint breakOnCount: state ].
	"groupTextbox whenTextChangedDo: [ :text | breakpoint group: text ]." "disabled because groups cannot be changed like this"
	"conditions not yet implemented"
]

{ #category : #initialization }
BreakpointEditor >> initializeWindow: aWindowPresenter [
	
	aWindowPresenter
		title: 'Breakpoint Editor';		
		windowIcon: (self application iconNamed: #glamorousBug);
		initialExtent: 400@400
]

{ #category : #API }
BreakpointEditor >> selectBreakpoint: aBreakpoint [

	breakpoint := aBreakpoint.
	self update.
	

]

{ #category : #update }
BreakpointEditor >> update [ 
	
	enabledCheckbox state: breakpoint isEnabled.
	oneshotCheckbox state: breakpoint once.
	oncountCheckbox state: breakpoint onCount.
	currentCountTextbox number: breakpoint count.
	breakOnCountTextbox number: breakpoint breakOnCount.
	groupTextbox text: (breakpoint group ifNotNil: [:g | g name ]).
	"conditionCheckbox state: breakpoint ???."
	"conditionTextbox text: (breakpoint condition)."
]
