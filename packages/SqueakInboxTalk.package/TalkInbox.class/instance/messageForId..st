accessing
messageForId: id

	^ self messagesPerIds at: id ifAbsentPut:
		[(messagePlaceholders ifNil: [messagePlaceholders := WeakValueDictionary new])
			at: id ifAbsentPut: (TalkMessagePlaceholder inbox: self messageId: id)]