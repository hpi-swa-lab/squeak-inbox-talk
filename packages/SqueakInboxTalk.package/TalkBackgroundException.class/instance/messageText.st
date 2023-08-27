printing
messageText

	| text |
	(self exception respondsTo: #richMessageText) ifTrue:
		["ASSUMPTION: All text actions in #richMessageText send a handling message to the exception, so we forward these sends to the original process. However, there might be violations to this assumptions in other cases. If needed, we would need to inject the original exception at #resumeEvaluating:, #return:, etc. ..."
		^ self exception richMessageText copy
			replaceAttributesThat: [:attr | attr isKindOf: TextAction]
			by: [:attr |
				PluggableTextAttribute evalBlock: [:object |
					self resolve: [attr actOnClickFor: object]]]].
	
	text := '{1}<br>{2} to debug the exception.' asTextFromHtml format:
		{self exception description.
		'Click here' asText
			addAttribute: TextEmphasis bold;
			addAttribute: (PluggableTextAttribute evalBlock: [self debug]);
			yourself}.
	text addAttribute: self textColorForError.
	^ text