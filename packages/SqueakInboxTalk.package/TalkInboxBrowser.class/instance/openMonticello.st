actions
openMonticello

	| browser workingCopyList |
	browser := MCWorkingCopyBrowser new.
	browser window.
	workingCopyList := browser findListMorph: #workingCopyList.
	workingCopyList listFilterAppend: $*.
	ToolBuilder open: browser window.