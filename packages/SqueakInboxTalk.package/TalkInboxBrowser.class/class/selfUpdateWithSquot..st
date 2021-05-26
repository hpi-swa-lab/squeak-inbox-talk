self-updating
selfUpdateWithSquot: aWorkingCopy

	| repository newVersion |
	"do not mess with the passed working copy for the moment"
	SelfUpdateWorkingCopy ifNil: [
		SelfUpdateWorkingCopy := SquotWorkingCopy new.
		SelfUpdateWorkingCopy store: SquotImageStore new.
		SelfUpdateWorkingCopy repository: (SquitRepository onDirectory: FileSystem memory / self appName).
		SelfUpdateWorkingCopy repository cloneFrom: self selfUpdateGitRepository].
	repository := SelfUpdateWorkingCopy repository.
	repository importFromUpstream: 'origin'.
	newVersion := (repository historianNamed: 'origin/', self selfUpdateBranch) version.
	SelfUpdateWorkingCopy mergeVersionWithLoadedObjects: newVersion ifCanceled: [^ self].
	(repository historianNamed: self selfUpdateBranch) version: newVersion
	"-- or, for non-developers of Squot: --"
	"UpdateWorkingCopy loadVersion: UpdateWorkingCopy baseVersion interactive: false."