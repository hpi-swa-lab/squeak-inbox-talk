accessing
conversationColumns

	^ {
		[:conversation | conversation latestDate talkPrintString].
		[:conversation |
			String streamContents: [:stream | | contributions count |
				stream
					space: 3;
					flag: #hacked.
				"custom spacing..."
				stream nextPutAll: conversation subject.
				contributions := conversation contributions.
				count := contributions size > 1
					ifTrue: [contributions size]
					ifFalse: [conversation messages size].
				count > 1 ifTrue: [
					stream
						space;
						nextPut: $(;
						print: count;
						nextPut: $)]]]} collect: [:columnBlock | self conversations collect: columnBlock]