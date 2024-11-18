announcements
selfUpdateAnnouncementFor: aDateAndTime

	| changes changesSummary |
	changesSummary := 'This might include new features, bug fixes, or performance improvements.'.
	changes :=
		[| response |
		response := WebClient httpGet: ('https://api.github.com/repos/{1}/{2}/commits?sha={3}&since={4}' format:
			{self githubRepositoryParams first.
			self githubRepositoryParams second.
			self selfUpdateBranch.
			aDateAndTime asString}).
		response isSuccess ifFalse: [self error: response content].
		response content parseAsJson collect: [:ea | ea commit message]]
			ifError: [:msg | 'Error retrieving changes: {1}' format: {msg}].
	(changes isArray and: [TalkInbox enableSemanticSearch]) ifTrue:
		[| changesHash |
		changesHash := changes hash.
		(thisContext homeMethod propertyValueAt: #changesHash ifAbsent: []) = changesHash
			ifTrue: [changesSummary := thisContext homeMethod propertyValueAt: #changesSummary]
			ifFalse:
				[[changesSummary := (Smalltalk classNamed: #SemanticConversation) new
					addSystemMessage: ('Summarize the following changes to Squeak Inbox Talk (which is a mailing list client for squeak-dev) in a single very short sentence. The changes are provided as technical commit messages. The sentence should have the form "This..." and be very short.
If you very unsure about the nature of the changes, answer "{1}" instead.
		Audience: Users of the tool.' format: {changesSummary});
					addUserMessage: changes asJsonString;
					in: [:conversation |
						(Smalltalk classNamed: #SemanticText) registeredConversationModels
							detect: [:model | model name = (Smalltalk classNamed: #OpenAIConversationModel) cheapestName]
							ifFound: [:model | conversation model: model]];
					getAssistantReply.
				thisContext homeMethod propertyValueAt: #changesSummary put: changesSummary.
				thisContext homeMethod propertyValueAt: #changesHash put: changesHash]
					ifError: [:msg | changesSummary := '{1} (Error retrieving summary: {2}.)' format: {changesSummary. msg}]]].
	
	^ TalkInboxBrowserAnnouncement
		date: aDateAndTime
		subject: ('Updates for {1} are available' format: {self appName})
		content: ('New updates for {appName} are available. {changesSummary} It is recommended to install {appName} updates together with Squeak updates.

You can <a href="{codeInstallUpdates}">install the updates now</a> or <a href="{changesUrl}">inspect the changes on GitHub first</a>.

New changes:
{changes}'
			format:
				(Dictionary new
					at: #appName put: self appName;
					at: #codeInstallUpdates put: 'code:// TalkInboxBrowser selfUpdate. nil';
					at: #changesUrl put:
						('https://github.com/{1}/{2}/commits/{3}' format: {
							self githubRepositoryParams first.
							self githubRepositoryParams second.
							self selfUpdateBranch});
					at: #changesSummary put: changesSummary;
					at: #changes put: (changes isArray ifTrue: [changes ifEmpty: ['(not found)'] ifNotEmpty: [(changes collect: [:ea | '* ' , (ea lines at: 1 ifAbsent: [''])]) joinSeparatedBy: String cr]] ifFalse: [changes]);
					yourself))
				talkAsTextFromHtmlWithCRs