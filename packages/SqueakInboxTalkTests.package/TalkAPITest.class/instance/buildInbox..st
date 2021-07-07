private
buildInbox: input

	| inbox |
	inbox := self inboxClass on: (input at: #mailingList).
	
	inbox mailingList now: (input at: #now).
	
	input at: #projects ifPresent: [:projectSpecs | | project |
		project := TalkProject new.
		project name: 'Trunk'.
		self patch: TalkProject at: #trunk withValue: project.
		self patch: project at: #inbox withValue: inbox.
		projectSpecs keysAndValuesDo: [:key :versionInfos | | repository |
			repository := MCDictionaryRepository new.
			self patch: repository at: #talkLocation withValue: 'mock:repo/', key.
			versionInfos do: [:versionInfo | repository storeVersion: (self patch: versionInfo at: #info withValue: versionInfo)].
			project perform: key asSimpleSetter with: repository]].
	
	input at: #downloadRange ifPresent: [:duration |
		inbox downloadRange: duration.
		inbox refreshMessages].
	
	^ inbox