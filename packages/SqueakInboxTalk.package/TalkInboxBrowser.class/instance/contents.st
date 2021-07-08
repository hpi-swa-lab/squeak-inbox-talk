accessing - contents
contents
	"Will be generated asynchronously via #fullContents"

	contents ifNotNil: [^ contents].
	
	^ self simpleContents ifNil: [
		'Loading...' asText
			addAttribute: TextEmphasis italic;
			yourself]