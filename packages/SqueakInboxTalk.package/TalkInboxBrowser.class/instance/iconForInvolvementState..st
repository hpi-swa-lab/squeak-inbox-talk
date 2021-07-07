accessing - toolbuilder
iconForInvolvementState: aSymbol

	^ (aSymbol caseOf: {
		[nil] -> [ToolIcons blank].
		[#mentioned] -> ['@' asTextMorph imageForm scaledToHeight: 12].
		[#newReply] -> [MenuIcons smallUndoIcon scaledToHeight: 12].
		[#lastWord] -> [MenuIcons smallRedoIcon scaledToHeight: 12]}) scaleIconToDisplay