*SqueakInboxTalk-UI-accessing-Morphic-ct.1774-override
hoverColumn: viewIndex

	self setProperty: #hoverColumn toValue: viewIndex.
	
	self wantsBalloon ifTrue: [
		self activeHand
			removePendingBalloonFor: self;
			triggerBalloonFor: self after: self balloonHelpDelayTime].