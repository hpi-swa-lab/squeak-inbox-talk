private
buildInbox: input

	| inbox |
	inbox := self inboxClass on: (input at: #mailingList).
	
	inbox mailingList now: (input at: #now).
	
	input
		at: #projects
		ifPresent: [:projectSpecs | | project |
			project := TalkProject new.
			project name: 'Trunk'.
			project inboxRepository: nil label: 'The Inbox'.
			inbox projects: {project}.
			projectSpecs keysAndValuesDo: [:key :versionInfos | | repository |
				repository := MCDictionaryRepository new.
				repository description: 'mock:repo/', key.
				self patch: repository at: #talkLocation withValue: repository description.
				versionInfos do: [:versionInfo | repository storeVersion: (self patch: versionInfo at: #info withValue: versionInfo)].
				project perform: key asSimpleSetter with: repository]]
		ifAbsent: [inbox projects: {}].
	
	input at: #downloadRange ifPresent: [:duration |
		inbox downloadRange: duration.
		inbox refreshMessages].
	
	input at: #nabbleNodeId ifPresent: [:id | inbox nabbleNodeId: id].
	
	^ inbox