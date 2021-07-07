*SqueakInboxTalk-UI-menus
filterMenu: menu for: aModel

	menu defaultTarget: self.
	
	aModel menu: menu add: 'conversations that...' getState: #isActive setState: #editPredicate.
	menu balloonTextForLastItem: 'Enter your custom filter expression here. This is Smalltalk!'.
	
	menu add: 'reset custom filter' action: #reset.
	
	^ menu