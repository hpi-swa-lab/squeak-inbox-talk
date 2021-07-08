accessing
allPackageNames

	^ ((self projects collect: #repositoryGroup) gather: #allPackageNames) as: Set