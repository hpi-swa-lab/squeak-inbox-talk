printing
richMessageText

	^ '{1}. {2} to initialize it.' asText format:
		{self messageText.
		'Click here' asText
			addAttribute: (PluggableTextAttribute evalBlock: [self initializeCorpus]);
			yourself}