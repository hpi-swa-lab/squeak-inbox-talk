toolbuilder
buildButtonBar: aBuilder

	^ aBuilder pluggablePanelSpec new
		model: self;
		layout: #horizontal;
		children: {
			aBuilder pluggableButtonSpec new
				model: self;
				label: 'Fetch more';
				action: #fetchMoreConversations;
				yourself.
			aBuilder pluggableCheckBoxSpec new
				model: self;
				label: #labelShowingNonContributions;
				state: #showingNonContributions;
				action: #toggleShowingNonContributions;
				yourself.
			aBuilder pluggableButtonSpec new
				model: self;
				label: 'Open';
				action: #openConversation;
				enabled: #hasConversationSelected;
				yourself.
			aBuilder pluggableButtonSpec new
				model: self;
				label: 'Browse contribution';
				action: #browseContribution;
				enabled: #hasContributionsSelected;
				yourself};
		yourself