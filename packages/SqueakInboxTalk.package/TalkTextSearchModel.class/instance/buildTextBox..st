toolbuilder
buildTextBox: aBuilder

	^ aBuilder pluggableInputFieldSpec new
		model: self;
		name: #searchTerm;
		getText: #searchTerm;
		setText: #accept:;
		editText: #searchTerm:;
		indicateUnacceptedChanges: false;
		plainTextOnly: false; "Required for error highlighting (see #annotateSearchTermWith:). We avoid user-provided formattings through immediate observer updates."
		help: self helpText;
		color: #color;
		yourself