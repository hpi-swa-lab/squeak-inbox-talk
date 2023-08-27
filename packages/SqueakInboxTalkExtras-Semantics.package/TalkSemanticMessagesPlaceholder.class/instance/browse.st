browsing
browse

	| displayLimit text |
	displayLimit := 100.
	text := Text streamContents: [:stream |
		stream withAttribute: TextEmphasis italic do:
			[stream nextPutAll: 'The following messages were not downloaded yet. However, you might be able to access them in an online mailing list archive:'].
		stream cr; cr.
		(self messages take: displayLimit)
			do: [:message |
				stream
					withAttribute: (PluggableTextAttribute evalBlock: [message browse])
					do:
						[stream nextPutAll: message messageId]]
			separatedBy: [stream cr].
		self messages size > displayLimit ifTrue:
			[stream
				cr;
				nextPutAll: ('<and {1} more not shown, {2} to browse all messages>' format:
					{self messages size - displayLimit.
					'click here' asText
						addAttribute: (PluggableTextAttribute evalBlock: [self messages inspect]);
						yourself})]].
	^ text editWithLabel: 'Other conversations'