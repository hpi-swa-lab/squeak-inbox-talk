toolbuilder
messageMenu: menu

	menu defaultTarget: (self selectedMessage ifNil: [^ nil]).
	menu
		add: 'inspect' action: #inspect;
		add: 'open in nabble archive' action: #openInNabble;
		add: 'open in pipermail archive' action: #openInPipermail.
	^ menu