toolbuilder
buildFilterBar: aBuilder

	^ aBuilder pluggablePanelSpec new
		model: self;
		layout: #horizontal;
		children: (OrderedCollection new
			add: (self buildSearchBar: aBuilder);
			yourself);
		yourself