*SqueakInboxTalkExtras-Semantics-Core
fullTextForSummary: includeTitle

	| text |
	self flag: #prototype. "Too simple heuristic! This might remove too many references from quotes or not discover all quotations. For instance, all inline replies after 'on...wrote...' will be discarded, leaving many empty messages!"
	self flag: #optimize. "regexes very slow..."
	text := self text asString.
	#('________________________________' '=============== Diff') do: [:sep |
		(text findString: sep) in: [:index | index > 0 ifTrue:
			[text := text first: index - 1]]].
	#('^On (.{1,100}), (.{1,100}) wrote\:\s*$' '^Am (.{1,100}) schrieb (.{1,100})\:\s*$' 'Le (.{1,100}), (.{1,100}) a écrit ?\:\s*$') do: [:sepRegex |
		(text allRangesOfRegexMatches: sepRegex) ifNotEmpty: [:ranges |
			text := text first: ranges first start - 1]].
	#('^> ?>[^\r\n]*[\r\n]' '^>( [^\r\n]*)?[\r\n]') do: [:quoteRegex |
		text := text copyWithRegex: quoteRegex matchesReplacedWith: ''].
		
	^ String streamContents: [:stream |
		includeTitle ifTrue: [
			stream
				nextPutAll: 'From: '; nextPutAll: self author asString;
				cr;
				nextPutAll: 'Date: '; print: self date;
				cr; cr].
		
		stream nextPutAll: text]