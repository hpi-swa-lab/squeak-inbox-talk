accessing - contribution
summary

	self conversations ifNotEmpty: [ | matcher |
		matcher := '^.*={20} Summary ={20}\s+(.*$)' asRegex.
		matcher
			matchesIn: self latestConversation initialMessage text
			do: [:match | ^ matcher subexpression: 2]].
	
	^ self versionInfo summary