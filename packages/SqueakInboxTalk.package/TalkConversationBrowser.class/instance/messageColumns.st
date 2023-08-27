accessing
messageColumns

	| messages |
	messages := self messages.
	^ {#authorTimestamp} collect: [:columnBlock |
		messages collect: [:message |
			message isArray
				ifTrue: [(message first "key" findFeatures joinSeparatedBy: String space) asText
					addAttribute: TextEmphasis italic;
					yourself]
				ifFalse: [columnBlock value: message]]]