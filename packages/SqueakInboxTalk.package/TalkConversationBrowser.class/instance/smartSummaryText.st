accessing - smart summary
smartSummaryText

	| header |
	smartSummary ifNil: [
		self requestSmartSummary.
		^ self smartSummaryText].
	
	header := '<b>Smart summary</b>' asTextFromHtml.
	smartSummary = #generating ifFalse: [
		^ header , String space
			, ('[Regenerate]' asText
				addAttribute: (PluggableTextAttribute evalBlock: [self rerequestSmartSummary]);
				yourself)
			, String cr
			, smartSummary].
	
	^ header , '<br><i>Generating...</i>' asTextFromHtml