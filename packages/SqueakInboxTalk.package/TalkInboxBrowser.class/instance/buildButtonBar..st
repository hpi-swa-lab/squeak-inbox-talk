toolbuilder
buildButtonBar: aBuilder

	^ aBuilder pluggablePanelSpec new
		model: self;
		layout: #horizontal;
		children: {
			aBuilder pluggableActionButtonSpec new
				model: self;
				label: 'Update';
				action: #updateMessages;
				yourself.
			aBuilder pluggableCheckBoxSpec new
				model: self;
				label: #labelShowingNonContributions;
				state: #showingNonContributions;
				action: #toggleShowingNonContributions;
				yourself.
			aBuilder pluggableActionButtonSpec new
				model: self;
				label: 'Open';
				action: #openConversation;
				enabled: #hasConversationSelected;
				yourself.
			aBuilder pluggableActionButtonSpec new
				model: self;
				label: 'Browse contribution';
				action: #browseContribution;
				enabled: #hasContributionsSelected;
				yourself};
		yourself