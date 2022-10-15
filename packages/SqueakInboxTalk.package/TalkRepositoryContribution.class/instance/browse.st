*SqueakInboxTalk-UI-browsing
browse

	(Project current uiManager chooseOptionFromLabeledValues: (OrderedDictionary new
		at: 'View changes' put: [self browseChanges];
		at: 'Inspect version' put: [self browseVersion];
		at: 'Inspect contribution' put: [self inspect];
		yourself)) value