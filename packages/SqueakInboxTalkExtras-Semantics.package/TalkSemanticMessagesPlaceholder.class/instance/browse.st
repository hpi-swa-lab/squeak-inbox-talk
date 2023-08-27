browsing
browse

	| text |
	text := Text streamContents: [:stream |
		stream withAttribute: TextEmphasis italic do:
			[stream nextPutAll: 'The following messages were not downloaded yet. However, you might be able to access them in an online mailing list archive:'].
		stream cr; cr.
		self messages
			do: [:message |
				stream
					withAttribute: (PluggableTextAttribute evalBlock: [message browse])
					do:
						[stream nextPutAll: message messageId]]
			separatedBy: [stream cr]].
	^ text editWithLabel: 'Other conversations'