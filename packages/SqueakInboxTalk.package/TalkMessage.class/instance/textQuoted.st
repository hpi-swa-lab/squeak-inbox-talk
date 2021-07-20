sending messages
textQuoted

	^ 'On {1}, {2} wrote:\\{3}' withCRs asText format: {self date. self author. self text copyWithRegex: '^' matchesReplacedWith: '> '}