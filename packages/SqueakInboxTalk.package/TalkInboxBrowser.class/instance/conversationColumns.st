accessing - toolbuilder
conversationColumns

	^ {
		[:conversation | conversation latestDate talkPrettyPrintString].
		[:conversation | "contribution state icon"
		''].
		[:conversation | self subjectFor: conversation].
		[:conversation | "involvement icon"
		'']} withIndexCollect: [:columnBlock :columnIndex |
		self conversations collect: [:conversation |
			conversation = #searching
				ifFalse:
					[((cachedConversationColumns ifNil: [cachedConversationColumns := Dictionary new])
						at: columnIndex ifAbsentPut: [WeakIdentityKeyDictionary new])
							at: conversation ifAbsentPut:
								[| text |
								text := columnBlock value: conversation.
								conversation isTalkAnnouncement ifTrue:
									[text := text asText
										addAttribute: TextEmphasis bold;
										yourself].
								text]]
				ifTrue:
					[columnIndex = 1
						ifTrue: [
							'Searching...' asText
								addAttribute: TextEmphasis italic;
								yourself]
						ifFalse: ['']]]]