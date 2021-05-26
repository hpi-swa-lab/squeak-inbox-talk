self-updating
selfUpdate
	"Copied and adjusted from Squot (by Jakob Reschke)."
	"TalkInboxBrowser selfUpdate"

	((self environment classNamed: #SquotWorkingCopy)
		ifNotNil: #registered
		ifNil: #())
		detect: [:each | | gitRepository |
			(each repository respondsTo: #git) and: [
				gitRepository := each repository git.
				each repository remoteNames anySatisfy: [:remote | self selfUpdateGitRepositoryPattern match: (gitRepository remoteUrl: remote)]]]
		ifFound: [:ownWorkingCopy | "This is likely to be a Squot developer, so interactively load current version"
		self selfUpdateWithSquot: ownWorkingCopy]
		ifNone: [self selfUpdateFromMetacello]