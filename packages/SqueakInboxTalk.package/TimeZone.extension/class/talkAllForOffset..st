*SqueakInboxTalk-UI-accessing
talkAllForOffset: aDuration

	^ (self timeZones , self timeZonesDST) select: [:ea | ea offset = aDuration]