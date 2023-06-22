updating
aspectDependencies

	^ super aspectDependencies
		at: #actualSelectedMessage put: #(selectedMessage);
		at: #browseAttachmentsColor put: #(selectedMessage);
		at: #browseAttachmentsLabel put: #(selectedMessage);
		at: #currentText put: #(#text #hasSearchError);
		at: #hasActualMessageSelected put: #(#actualSelectedMessage);
		at: #hasMessageSelected put: #(#selectedMessage);
		at: #hasSpecialMessageSelected put: #(#selectedMessage);
		at: #headerSelection put: #(#headerText #search);
		at: #headerText put: #(#selectedMessage);
		at: #labelString put: #(#conversation);
		at: #messages put: #(#conversation);
		at: #messageColumns put: #(#messages);
		at: #messageFormatColor put: #(#messageFormat selectedMessage);
		at: #messageFormatLabel put: #(#messageFormat);
		at: #revertChanges put: #(#currentText);
		at: #selectedMessageIndex put: #(#selectedMessage);
		at: #selectedMatch put: #(#search);
		at: #smartSummaryText put: #(smartSummary);
		at: #text put: #(#messageFormat #selectedMessage #search #smartSummaryText);
		at: #textSelection put: #(#text);
		yourself