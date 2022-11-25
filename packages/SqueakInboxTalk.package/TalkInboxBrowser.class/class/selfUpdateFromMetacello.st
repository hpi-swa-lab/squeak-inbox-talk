self-updating
selfUpdateFromMetacello

	Metacello new
		baseline: self packageInfo name;
		repository: self selfUpdateGitHubPath;
		get;
		load