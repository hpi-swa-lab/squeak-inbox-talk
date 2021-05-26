self-updating
selfUpdateGitRepository

	^ 'https://github.com/{1}/{2}.git' format: {self selfUpdateRepositoryParams first. self selfUpdateRepositoryParams second}