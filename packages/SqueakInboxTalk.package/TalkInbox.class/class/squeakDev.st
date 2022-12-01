accessing
squeakDev
	<talkInbox: 1>

	^ (self on: TalkMailingList squeakDev)
		projects: {TalkProject trunk. TalkProject ffi}, TalkProject squeakVersions reversed;
		nabbleNodeId: 45488;
		yourself