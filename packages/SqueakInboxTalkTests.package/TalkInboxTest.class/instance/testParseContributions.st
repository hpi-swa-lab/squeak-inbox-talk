tests - contribution parsing
testParseContributions

	self flag: #todo.
	"Reconsider whether we need both patching and JsonObjects for faking objects."
	(Dictionary new
		at: (JsonObject new
				at: #author put: 'John Doe';
				yourself)
			put: {};
		at: (JsonObject new
				at: #author put: 'commits@source.squeak.org';
				at: #subject put: 'The Trunk: Package-author.mcz';
				yourself)
			put: {
				TalkRepositoryContribution
					inbox: nil
					project: TalkProject trunk
					versionName: 'Package-author' asMCVersionName};
		yourself) keysAndValuesDo: [:message :contributions | | inbox |
		inbox := self classUnderTest new projects: {
			TalkProject trunk}.
		self assert: contributions equals: (inbox parseContributionsFrom: message)]