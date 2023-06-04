toolbuilder
buildButtonBar: aBuilder

	^ aBuilder pluggablePanelSpec new
		model: self;
		layout: #horizontal;
		children: (OrderedCollection new
			add: (aBuilder pluggableActionButtonSpec new
				model: self;
				label: 'Reply';
				action: #reply;
				enabled: #hasMessageSelected;
				yourself);
			add: (aBuilder pluggableActionButtonSpec new
				model: self;
				label: #browseAttachmentsLabel;
				action: #browseAttachments;
				enabled: #hasMessageSelected;
				color: #browseAttachmentsColor;
				yourself);
			add: aBuilder pluggableSpacerSpec new;
			add: (aBuilder pluggableActionButtonSpec new
				model: self;
				label: #messageFormatLabel;
				action: #offerMessageFormatMenu;
				style: #menuButton;
				color: #messageFormatColor;
				help: #messageFormatHelp;
				yourself);
			yourself);
		yourself