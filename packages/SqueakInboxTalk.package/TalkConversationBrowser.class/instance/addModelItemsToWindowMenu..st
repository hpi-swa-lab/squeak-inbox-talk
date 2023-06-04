toolbuilder
addModelItemsToWindowMenu: menu

	menu addLine.
	menu
		add: 'inspect conversation' target: self conversation action: #inspect;
		add: 'explore conversation' target: self conversation action: #explore.