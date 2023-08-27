resolving
waitForResolution
	"Remember and suspend the active process until is resumed through a resolution."

	process := Processor activeProcess.
	[process suspend]
		ensure: [process := nil].
	self resolve.