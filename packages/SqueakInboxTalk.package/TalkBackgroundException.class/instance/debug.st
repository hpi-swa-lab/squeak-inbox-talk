resolving
debug

	resolution := [self exception resumeUnchecked: self exception]. "just like Debugger proceed"
	^ ToolSet
		debugProcess: self process
		context: self exception signalerContext
		label: self exception description
		contents: self messageText
		fullView: true