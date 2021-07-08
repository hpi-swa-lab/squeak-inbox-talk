*SqueakInboxTalk-UI-menus
filterMenu: menu for: aModel

	menu defaultTarget: self.
	
	self allInvolvements keysAndValuesDo: [:label :involvement |
		aModel
			menu: menu
			add: label
			getState: [self hasInvolvement: involvement]
			setState: [:boolean | self setInvolvement: involvement to: boolean]].
	
	menu add: 'reset involvement filters' action: #reset.
	
	^ menu