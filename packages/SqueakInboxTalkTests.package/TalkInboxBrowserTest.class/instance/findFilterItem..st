support
findFilterItem: matchString

	| menu |
	menu := MenuMorph new.
	menu := browser filterMenu: menu.
	^ menu items detect: [:item |
		(item respondsTo: #updateContents) ifTrue: [item updateContents].
		matchString match: item contents asString]