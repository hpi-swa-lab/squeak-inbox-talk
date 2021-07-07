*SqueakInboxTalk-UI-browsing
browseForSearcher: aTextSearcher

	^ (TalkConversationBrowser on: self)
		searcher: aTextSearcher;
		open