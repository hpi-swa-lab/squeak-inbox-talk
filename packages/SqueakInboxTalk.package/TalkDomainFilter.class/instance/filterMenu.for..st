*SqueakInboxTalk-UI-menus
filterMenu: menu for: aModel

	menu defaultTarget: self.
	
	aModel
		menu: menu
		add: [(self items ifEmpty: ['{1}...'] ifNotEmpty: ['{1}... ({2})']) format: {self menuLabel. self items size}]
		getState: #isActive
		setState: #chooseNewItems.
	
	^ menu