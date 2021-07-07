updating
aspectDependencies

	^ super aspectDependencies
		at: #currentText put: #(#text);
		at: #labelString put: #(#conversation);
		at: #messages put: #(#conversation);
		at: #messageColumns put: #messages;
		at: #selectedMessageIndex put: #(#selectedMessage);
		at: #text put: #(#selectedMessage #search);
		yourself