accessing
messageColumns

	| messages |
	messages := self messages.
	^ {#authorTimestamp} collect: [:columnBlock |
		messages collect: [:message |
			message = #smartSummary
				ifTrue: ['smart summary' asText addAttribute: TextEmphasis italic; yourself]
				ifFalse: [columnBlock value: message]]]