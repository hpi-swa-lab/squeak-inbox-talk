toolbuilder
buildTextPane: aBuilder
 
	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #text;
		yourself