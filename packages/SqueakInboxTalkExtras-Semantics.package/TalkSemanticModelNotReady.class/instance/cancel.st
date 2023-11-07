handling
cancel

	| process |
	process := Processor activeProcess.
	Project current spawnNewProcessIfThisIsUI: process.
	process terminate.