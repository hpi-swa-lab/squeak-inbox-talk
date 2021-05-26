self-updating
selfUpdateGitRepositoryPattern

	^ self selfUpdateGitRepository
		copyReplaceAll: self selfUpdateRepositoryParams first
		with: '*'