initialize-release
defaultPredicate
	"Just an example."

	^ [:each |
		#('Sat' 'Sun') includes: each latestDate dayOfWeekAbbreviation
		"weekend squeakers"]