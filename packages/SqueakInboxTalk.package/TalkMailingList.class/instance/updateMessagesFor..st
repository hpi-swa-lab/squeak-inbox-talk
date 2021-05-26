updating
updateMessagesFor: downloadRange

	| minDownloadDate minDownloadMonth aggregator |
	self wrapperClass closeAllStreams.
	
	minDownloadDate := downloadRange
		ifNil: [DateAndTime new "min"]
		ifNotNil: [:duration | DateAndTime now - duration].
	(self mails collect: #date) ifNotEmpty: [:dates |
		minDownloadDate := dates min > minDownloadDate
			ifTrue: [minDownloadDate]
			ifFalse: [dates max]].
	minDownloadMonth := minDownloadDate asUTC asMonth.
	
	aggregator := (self aggregatorClass on: {self name})
		showProgress: true;
		dateFilter: [:date | date asMonth >= minDownloadMonth];
		yourself.
	
	aggregator class
		downloadListNamed: self name
		forMonthsThat: [:month | month >= minDownloadMonth].
	
	[
		aggregator
			deriveRulesForAuthorKeyNormalization;
			resetCacheForMailMessages]
		on: Warning
		do: [:ex |
			(ex messageText includesSubstring: 'author-key normalization is limited')
				ifTrue: [
					ex resume
					"ignore - not relevant for us since previously derived author keys were already stored into the mail wrappers"]
				ifFalse: [ex pass]].
	aggregator class
		resetCacheForMailInReplyTo;
		resetCacheForMailReplies.
	aggregator resetCacheForMailConversations