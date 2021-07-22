updating
aspectDependencies

	^ super aspectDependencies
		at: #currentText put: #(#text #hasSearchError);
		at: #headerText put: #(#selectedMessage);
		at: #labelString put: #(#conversation);
		at: #messages put: #(#conversation);
		at: #messageColumns put: #messages;
		at: #revertChanges put: #(#currentText);
		at: #selectedMessageIndex put: #(#selectedMessage);
		at: #selectedMatch put: #search;
		at: #selectedTextInterval put: #(#selectedMessage);
		at: #text put: #(#selectedMessage #search);
		yourself