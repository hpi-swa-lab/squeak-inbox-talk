toolbuilder
buildTextBox: aBuilder

	^ aBuilder pluggableInputFieldSpec new
		model: self;
		getText: #searchTerm;
		setText: #accept:;
		editText: #searchTerm:;
		indicateUnacceptedChanges: false;
		help: self helpText;
		color: #color;
		yourself