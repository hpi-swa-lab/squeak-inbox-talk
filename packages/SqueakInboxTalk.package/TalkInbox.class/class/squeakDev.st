accessing
squeakDev

	^ (self on: TalkMailingList squeakDev)
		projects: {TalkProject trunk. TalkProject ffi};
		nabbleNodeId: 45488;
		yourself