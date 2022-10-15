toolbuilder
buildButtonBar: aBuilder

	^ aBuilder pluggablePanelSpec new
		model: self;
		layout: #horizontal;
		children: (OrderedCollection new
			add: (aBuilder pluggableButtonSpec new
				model: self;
				label: 'Contribute';
				action: #offerContributeMenu;
				style: #menuButton;
				yourself);
			add: (aBuilder pluggableActionButtonSpec new
				model: self;
				label: 'Refresh';
				action: #refreshMessages;
				help: #refreshMessagesHelp;
				yourself);
			add: (aBuilder pluggableButtonSpec new
				model: self;
				label: #filterLabel;
				action: #offerFilterMenu;
				style: #menuButton;
				yourself);
			add: aBuilder pluggableSpacerSpec new;
			add: (aBuilder pluggableActionButtonSpec new
				model: self;
				label: 'Open';
				action: #openConversation;
				enabled: #hasConversationSelected;
				help: 'Browse the selected conversation';
				yourself);
			add: (aBuilder pluggableActionButtonSpec new
				model: self;
				label: 'Browse contribution...';
				action: #browseContributions;
				enabled: #hasContributionsSelected;
				yourself);
			add: aBuilder pluggableSpacerSpec new;
			add: (aBuilder pluggableActionButtonSpec new
				model: self;
				label: self appButtonLabel;
				action: #offerAppMenu;
				style: #menuButton;
				help: 'Carpe Squeak!';
				yourself);
			yourself);
		yourself