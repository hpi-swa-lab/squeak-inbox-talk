accessing
etoysDev

	^ (self on: TalkMailingList etoysDev)
		projects: {TalkProject etoys};
		nabbleNodeId: 3333966;
		yourself