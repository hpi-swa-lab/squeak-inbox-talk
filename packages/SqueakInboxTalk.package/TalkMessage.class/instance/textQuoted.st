sending messages
textQuoted

	^ 'On {1}, {2} wrote:\\{3}' withCRs asText format: {self date. self author. self plainText asString copyWithRegex: '^' matchesReplacedWith: '> '}