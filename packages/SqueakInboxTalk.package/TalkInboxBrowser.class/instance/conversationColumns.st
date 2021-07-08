accessing - toolbuilder
conversationColumns

	^ {
		[:conversation | conversation latestDate talkPrintString].
		[:conversation | self subjectFor: conversation].
		[:conversation | '']} withIndexCollect: [:columnBlock :columnIndex |
		self conversations collect: [:conversation |
			conversation = #searching
				ifFalse: [columnBlock value: conversation]ifTrue: [
					columnIndex = 1
						ifTrue: [
							'Searching...' asText
								addAttribute: TextEmphasis italic;
								yourself]
						ifFalse: ['']]
				]]