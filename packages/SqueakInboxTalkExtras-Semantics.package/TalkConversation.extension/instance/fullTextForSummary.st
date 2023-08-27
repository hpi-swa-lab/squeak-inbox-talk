*SqueakInboxTalkExtras-Semantics-Core
fullTextForSummary

	^ String streamContents: [:stream |
		stream nextPutAll: 'Subject: '; nextPutAll: self subject; cr.
		self messages
			do: [:message | stream nextPutAll: message fullTextForSummary]
			separatedBy: [stream cr; cr; cr]]