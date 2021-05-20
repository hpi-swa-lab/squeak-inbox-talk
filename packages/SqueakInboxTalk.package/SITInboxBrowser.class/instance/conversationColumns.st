accessing
conversationColumns

	^ {
		[:conversation | conversation latestDate sitPrintString].
		[:conversation |
			'   {1} ({2})' format: {
				conversation subject.
				(conversation contributions
					ifNotEmpty: [:contributions | contributions gather: #conversations]
					ifEmpty: [conversation messages]) size}]} collect: [:columnBlock | self conversations collect: columnBlock]