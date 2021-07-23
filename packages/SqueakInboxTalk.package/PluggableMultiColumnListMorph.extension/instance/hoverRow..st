*SqueakInboxTalk-UI-accessing-Morphic-ct.1774-override
hoverRow: viewIndex

	hoverRow = viewIndex ifTrue: [^ self].
	hoverRow = 0 ifTrue: [self hoverColumn: 0].
	listMorphs do: [:columnListMorph | columnListMorph rowChanged: hoverRow with: viewIndex].
	super hoverRow: viewIndex