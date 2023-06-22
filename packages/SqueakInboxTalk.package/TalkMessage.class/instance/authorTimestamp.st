accessing
authorTimestamp

	| allInitials initials |
	allInitials := [self contributions size = 1
		ifTrue: [{self contributions anyOne author}]
		ifFalse: [self mail authorInitials]]
			ifError: [#('<error>') "just needed for debugging"].
	allInitials := allInitials copyWithoutAll: self unwantedAuthorInitials.
	initials := allInitials
		ifEmpty: [self mail authorFullName]
		ifNotEmpty: [
			allInitials size = 1
				ifTrue: [allInitials anyOne]
				ifFalse: [(allInitials sorted: [:ea | ea size] ascending , [:ea | ea count: [:c | c isUppercase]] ascending) first]].
	^ initials , ' ' , self date asDate mmddyyyy, ' ',
		(String streamContents: [:s | self date asTime print24: true showSeconds: false on: s])