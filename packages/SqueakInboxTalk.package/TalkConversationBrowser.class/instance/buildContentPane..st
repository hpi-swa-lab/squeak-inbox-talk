toolbuilder
buildContentPane: aBuilder

	^ aBuilder pluggablePanelSpec new
		wantsResizeHandles: true;
		children: (OrderedCollection new
			add: ((self buildButtonBar: aBuilder)
				frame: (LayoutFrame new
					rightFraction: 1;
					bottomOffset: self buttonHeight;
					yourself);
				yourself);
			add: ((self buildMessageList: aBuilder)
				frame: (LayoutFrame new
					topOffset: self buttonHeight;
					rightFraction: 1 / 3;
					bottomFraction: 1;
					yourself);
				yourself);
			add: ((self buildMessagePane: aBuilder)
				frame: (LayoutFrame new
					topOffset: self buttonHeight;
					leftFraction: 1 / 3;
					rightFraction: 1;
					bottomFraction: 1;
					yourself);
				yourself);
			yourself);
		yourself