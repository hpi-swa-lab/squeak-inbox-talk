accessing - text
smartSummaryHeader

	| header |
	header := '<b>Smart summary</b>' asTextFromHtml.
	smartSummaryConversation ifNotNil:
		[header := header , (' (powered by {1})' format:
			{(smartSummaryConversation model class semanticIncludesBehaviorNamed: #OpenAIModel)
				ifTrue: ['ChatGPT']
				ifFalse: ['AI']})].
	^ header , String cr
		, ('Experimental. May contain hallucinations, biases, and lack of common or domain knowledge.' asText addAttribute: (TextFontReference toFont: Preferences standardButtonFont); yourself)