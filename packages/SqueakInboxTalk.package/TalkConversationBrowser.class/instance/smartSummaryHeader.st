accessing - smart summary
smartSummaryHeader

	^ '<b>Smart summary (powered by ChatGPT)</b><br>' asTextFromHtml
		, ('Experimental. May contain hallucinations, biases, and lack of common or domain knowledge.' asText addAttribute: (TextFontReference toFont: Preferences standardButtonFont); yourself)