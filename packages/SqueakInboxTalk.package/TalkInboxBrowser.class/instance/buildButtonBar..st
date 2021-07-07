toolbuilder
buildButtonBar: aBuilder

	^ aBuilder pluggablePanelSpec new
		model: self;
		layout: #horizontal;
		children: (OrderedCollection new
			add: (aBuilder pluggableActionButtonSpec new
				model: self;
				label: 'Refresh';
				action: #refreshMessages;
				help: 'Download and prepare the latest messages from the mail archive';
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
				label: self appVersionLabel;
				action: #offerAppMenu;
				color: #appVersionColor;
				style: #menuButton;
				help: 'Hello World!';
				yourself);
			yourself);
		yourself