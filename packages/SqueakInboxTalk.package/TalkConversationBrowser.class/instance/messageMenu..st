toolbuilder
messageMenu: menu

	menu defaultTarget: (self selectedMessage ifNil: [self conversation]).
	menu
		add: 'inspect (i)' action: #inspect;
		add: 'explore (I)' action: #explore;
		add: 'open in Nabble forum' action: #openInNabble;
		add: 'open in pipermail archive' action: #openInPipermail.
	^ menu