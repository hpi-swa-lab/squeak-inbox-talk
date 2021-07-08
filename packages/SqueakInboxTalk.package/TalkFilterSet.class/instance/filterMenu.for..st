*SqueakInboxTalk-UI-menus
filterMenu: menu for: aModel

	| builders |
	builders := self filters
		collect: [:filter |[filter filterMenu: menu for: aModel]].
	
	self resetLabel ifNotNil: [
		builders := builders copyWith: [
		menu defaultTarget: self;
		 add: self resetLabel action: #reset]].

	builders
		do: #value
		separatedBy: [self separateFilters ifTrue: [menu addLine]].
	
	^ menu