self-updating
selfUpdateGitHubPath

	^ ('github://{1}/{2}:\{1\}/{3}' format: {
		self selfUpdateRepositoryParams first.
		self selfUpdateRepositoryParams second.
		self selfUpdateRepositoryParams third}) format: {self selfUpdateBranch}