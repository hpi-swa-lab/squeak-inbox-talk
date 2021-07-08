*SqueakInboxTalk-UI-menus
filterMenu: menu for: aModel

	menu defaultTarget: self.
	
	aModel
		menu: menu
			add: 'conversations with contributions'
			getState: #withContributions
			setState: #withContributions:;
		menu: menu
			add: 'conversations without contributions'
			getState: #withoutContributions
			setState: #withoutContributions:.
	
	^ menu