toolbuilder
buildMessagePane: aBuilder

	^ aBuilder pluggablePanelSpec new
		children: {
			aBuilder pluggableTextSpec new
				model: self;
				frame: (LayoutFrame new
					rightFraction: 1;
					bottomOffset: self headerHeight;
					yourself);
				getText: #headerText;
				selection: #headerSelection;
				yourself.
			aBuilder pluggableTextSpec new
				model: self;
				frame: (LayoutFrame new
					topOffset: self headerHeight;
					rightFraction: 1;
					bottomFraction: 1;
					yourself);
				getText: #currentText;
				selection: #textSelection;
				yourself};
		yourself