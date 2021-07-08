*SqueakInboxTalk-UI-browsing
browseForSearcher: aTextSearcher

	^ self conversations do: [:conversation | conversation browseForSearcher: aTextSearcher]