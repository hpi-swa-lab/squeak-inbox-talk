accessing - text
similarConversationsHeader

	| header |
	header := '<b>Similar conversations</b>' asTextFromHtml.
	self conversation inbox semanticCorpus ifNotNil: [:corpus |
		header := header , (' (powered by {1} embeddings)' format:
			{(corpus embeddingModel class semanticIncludesBehaviorNamed: #OpenAIModel)
				ifTrue: ['OpenAI']
				ifFalse: ['AI']})].
	^ header , String cr
		, ('Experimental. May be biased or ineffective.' asText addAttribute: (TextFontReference toFont: Preferences standardButtonFont); yourself)