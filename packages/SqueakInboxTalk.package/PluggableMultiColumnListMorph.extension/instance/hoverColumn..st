*SqueakInboxTalk-UI-accessing-Morphic-ct.1774-override
hoverColumn: viewIndex

	hoverColumn := viewIndex.
	
	self wantsBalloon ifTrue: [
		self activeHand
			removePendingBalloonFor: self;
			triggerBalloonFor: self after: self balloonHelpDelayTime].