*SqueakInboxTalk-UI-converting
talkAsText

	self flag: #moveUpstream.
	^ Text string: Character startOfHeader asString attribute: self asTextAnchor