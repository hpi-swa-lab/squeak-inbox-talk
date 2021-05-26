self-updating
selfUpdateGitRepositoryPattern

	^ self selfUpdateGitRepository
		copyReplaceAll: self selfUpdateRepositoryParams second
		with: '*'