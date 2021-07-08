toolbuilder
filterMenu: originalMenu

	| menu |
	menu := originalMenu.
	menu defaultTarget: self.
	
	self menuFilter filterMenu: menu for: self.
	
	^ menu