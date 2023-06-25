*SqueakInboxTalk-UI-browsing
browseActions

	^ OrderedDictionary new
		at: 'View changes' put: [self browseChanges];
		at: 'Inspect version' put: [self browseVersion];
		at: 'Inspect contribution' put: [self inspect];
		yourself