accessing - toolbuilder
conversationColumns

	^ {
		[:conversation | conversation latestDate talkPrintString].
		[:conversation | "contribution state icon"
		''].
		[:conversation | self subjectFor: conversation].
		[:conversation | "involvement icon"
		'']} withIndexCollect: [:columnBlock :columnIndex |
		self conversations collect: [:conversation |
			conversation = #searching ifFalse: [columnBlock value: conversation] ifTrue: [
				columnIndex = 1
					ifTrue: [
						'Searching...' asText
							addAttribute: TextEmphasis italic;
							yourself]
					ifFalse: ['']]]]