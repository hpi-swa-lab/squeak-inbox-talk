private
nabbleEscape: aString

	^ aString copyWithRegex: '(?<=[\\"])' matchesReplacedWith: '\'