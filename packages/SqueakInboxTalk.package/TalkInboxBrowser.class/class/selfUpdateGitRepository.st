self-updating
selfUpdateGitRepository

	^ 'https://github.com/{1}/{2}.git' format: {self githubRepositoryParams first. self githubRepositoryParams second}