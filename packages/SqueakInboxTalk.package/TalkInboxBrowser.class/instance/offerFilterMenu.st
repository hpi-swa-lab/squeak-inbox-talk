actions
offerFilterMenu

	self offerMenu: [:menu |
		menu title: 'Filters'.
		menu addStayUpItem.
		self filterMenu: menu]