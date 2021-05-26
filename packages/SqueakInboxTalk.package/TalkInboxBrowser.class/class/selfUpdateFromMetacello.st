self-updating
selfUpdateFromMetacello

	(self environment classNamed: #Metacello) new
		baseline: self package name;
		repository: self selfUpdateGitHubPath;
		get;
		load