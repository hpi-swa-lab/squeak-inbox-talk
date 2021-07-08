initialize-release
defaultPredicate

	^ [:each |
		#('Sat' 'Sun') includes: each latestDate dayOfWeekAbbreviation
		"weekend squeakers"]