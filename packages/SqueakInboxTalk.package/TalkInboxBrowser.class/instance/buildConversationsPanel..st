toolbuilder
buildConversationsPanel: aBuilder

	^ aBuilder pluggablePanelSpec new
		children: (OrderedCollection new
			add: ((self buildFilterBar: aBuilder)
				frame: (LayoutFrame new
					rightFraction: 1;
					bottomOffset: self buttonHeight;
					yourself);
				yourself);
			add: ((self buildConversationsList: aBuilder)
				frame: (LayoutFrame new
					rightFraction: 1;
					bottomFraction: 1;
					topOffset: self buttonHeight;
					yourself);
				yourself);
			yourself);
		yourself