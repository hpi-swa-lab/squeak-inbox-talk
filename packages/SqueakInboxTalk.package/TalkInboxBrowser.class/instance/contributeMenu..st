toolbuilder
contributeMenu: menu

	menu defaultTarget: self.
	
	menu add: 'Open Monticello' action: #openMonticello.
	menu add: 'New conversation...' action: #newConversation.
	
	^ menu