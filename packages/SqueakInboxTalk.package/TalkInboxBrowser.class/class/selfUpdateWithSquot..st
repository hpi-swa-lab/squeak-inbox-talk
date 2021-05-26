self-updating
selfUpdateWithSquot: aWorkingCopy

	| repository newVersion |
	"do not mess with the passed working copy for the moment"
	SelfUpdateWorkingCopy ifNil: [
		SelfUpdateWorkingCopy := (self environment classNamed: #SquotWorkingCopy) new.
		SelfUpdateWorkingCopy store: (self environment classNamed: #SquotImageStore) new.
		SelfUpdateWorkingCopy repository: ((self environment classNamed: #SquitRepository) onDirectory: (self environment classNamed: #FileSystem) memory / self appName).
		SelfUpdateWorkingCopy repository cloneFrom: self selfUpdateGitRepository].
	repository := SelfUpdateWorkingCopy repository.
	repository importFromUpstream: 'origin'.
	newVersion := (repository historianNamed: 'origin/', self selfUpdateBranch) version.
	SelfUpdateWorkingCopy
		mergeVersionWithLoadedObjects: newVersion
		ifCanceled: [^ self].
	(repository historianNamed: self selfUpdateBranch) version: newVersion
	"-- or, for non-developers of Squot: --"
	"SelfUpdateWorkingCopy loadVersion: SelfUpdateWorkingCopy baseVersion interactive: false."
