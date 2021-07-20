accessing
vmDev

	^ (self on: TalkMailingList vmDev)
		projects: {TalkProject vmMaker};
		nabbleNodeId: 104410;
		yourself