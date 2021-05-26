self-updating
selfUpdateGitRepositoryPattern

	^ self selfUpdateGitRepository
		copyReplaceAll: self githubRepositoryParams first
		with: '*'