self-updating
metacello

	^ Metacello new
		baseline: self packageInfo name;
		repository: self selfUpdateGitHubPath;
		yourself