updating
updateMessagesFor: aDurationOrNil

	| timespans aggregator |
	timespans := Array with:
		((aDurationOrNil
			ifNil: [DateAndTime new "zero"]
			ifNotNil: [DateAndTime now - aDurationOrNil])
				to: DateAndTime now).
	
	(self mails collect: #date) ifNotEmpty: [:dates |
		| fullTimespan minDate maxDate |
		fullTimespan := timespans first.
		timespans := OrderedCollection new.
		minDate := dates min.
		maxDate := (dates reject: [:date | date > DateAndTime now "invalid"]) max.
		minDate > fullTimespan start ifTrue:
			[timespans add: (fullTimespan start to: minDate)].
		timespans add: (maxDate to: fullTimespan end)].
	
	self wrapperClass closeAllStreams.
	
	aggregator := (self aggregatorClass on: {self name})
		showProgress: true;
		onlyTimespans: timespans;
		yourself.
	
	aggregator class
		downloadListNamed: self name
		forTimespans: timespans.
	
	[
		aggregator
			deriveRulesForAuthorKeyNormalization;
			resetCacheForMailMessages;
			flag: #performance "ct: We are reading the mbox files twice! Can we optimize this?"]
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