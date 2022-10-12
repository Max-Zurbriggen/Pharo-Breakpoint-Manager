Extension { #name : #Breakpoint }

{ #category : #'*BreakpointBrowser' }
Breakpoint >> inspectionBreakpoint [
	<inspectorPresentationOrder: -1000 title: 'Editor'>
	
	^ BreakpointEditor new  
		selectBreakpoint: self;
		yourself
]
