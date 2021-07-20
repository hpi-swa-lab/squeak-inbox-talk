accessing - toolbuilder
iconForInvolvementState: aSymbol

	^ aSymbol caseOf: {
		[nil] -> [ToolIcons blank].
		[#mentioned] -> ['@' asTextMorph imageForm].
		[#newReply] -> [MenuIcons smallUndoIcon].
		[#lastWord] -> [MenuIcons smallRedoIcon]}