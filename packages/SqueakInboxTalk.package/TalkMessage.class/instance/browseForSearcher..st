*SqueakInboxTalk-UI-browsing
browseForSearcher: aTextSearcher

	^ (TalkConversationBrowser onMessage: self)
		searcher: aTextSearcher;
		open