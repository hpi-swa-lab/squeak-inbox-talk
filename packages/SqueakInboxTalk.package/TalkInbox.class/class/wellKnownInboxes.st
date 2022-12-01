accessing
wellKnownInboxes

	^ ((Pragma allNamed: #talkInbox in: self class) , (Pragma allNamed: #talkInbox: in: self class)
		sorted: [:pragma | pragma numArgs > 0 ifTrue: [pragma argumentAt: 1] ifFalse: [Float infinity]] ascending , [:pragma | pragma selector] ascending)
			collect: [:pragma | self perform: pragma selector]