*SqueakInboxTalk-Core-ui requests
edit: aText label: labelString initialAnswer: initialText shouldStyle: aBoolean accept: anAction

	| workspace window |
	self flag: #moveUpstream.
	
	workspace := Workspace new
		shouldStyle: aBoolean;
		acceptContents: aText;
		acceptAction: anAction.
	window := workspace openLabel: (labelString ifNil: [workspace labelString]).
	initialText ifNotNil: [workspace changed: #editString with: initialText].
	^ window