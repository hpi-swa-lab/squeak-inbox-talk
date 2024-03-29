accessing
text

	| message text |
	message := self selectedMessage.
	message isArray ifTrue: [^ self perform: message second "textSelector"].
	text := (message ifNil: [^ nil]) perform: self messageFormatSelector.
	
	message attachmentNames ifNotEmpty: [:names |
		text := text asText , '\\Attachments: ' withCRs ,
			((names withIndexCollect: [:name :index |
				Text string: ('[{1}]' format: {name}) attributes:
					{PluggableTextAttribute evalBlock: [
						(TextMessageLink toDocument: (message attachmentAt: index))
							actOnClickFor: self currentEvent]}])
			fold: [:a :b | a , ' ' , b])].
	
	^ text