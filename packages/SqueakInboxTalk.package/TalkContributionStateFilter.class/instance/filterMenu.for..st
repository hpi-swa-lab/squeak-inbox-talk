*SqueakInboxTalk-UI-menus
filterMenu: menu for: aModel

	menu defaultTarget: self.
	
	self allStates do: [:state |
		aModel
			menu: menu
			add: ('contributions with state {1}' format: {state})
			getState: [self hasState: state]
			setState: [:boolean | self setState: state to: boolean].
		menu balloonTextForLastItem: (self helpForState: state)].
	
	menu add: 'reset state filters' action: #reset.
	
	^ menu