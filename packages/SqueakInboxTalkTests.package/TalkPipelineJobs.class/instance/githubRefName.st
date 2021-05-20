accessing
githubRefName

	^ (self environment classNamed: #SmalltalkCI) ifNotNil: [:sci | sci getEnv: (#GithubRef findFeatures joinSeparatedBy: $_) asUppercase]