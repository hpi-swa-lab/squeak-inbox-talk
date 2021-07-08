*SqueakInboxTalk-UI-events-processing-Morphic-ct.1774-override
handleMouseMove: anEvent

	anEvent wasHandled ifTrue: [^ self].
	
	super handleMouseMove: anEvent.
	
	self hoverColumn: (self columnAtLocation: anEvent position).