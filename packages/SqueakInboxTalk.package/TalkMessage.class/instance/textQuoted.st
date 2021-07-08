sending messages
textQuoted

	^ self text copyWithRegex: '^' matchesReplacedWith: '> '