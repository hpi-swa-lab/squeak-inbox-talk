accessing - toolbuilder
iconForContributionState: aSymbol

	^ self class useSimpleIcons
		ifFalse: [
			aSymbol caseOf: {
				[nil] -> [ToolIcons blank].
				[#pending] -> [ToolIcons testOrange].
				[#merged] -> [self class iconCheckmarkGreen].
				[#treated] -> [self class iconDeclineRed].
				[#trunk] -> [self class iconCheckmarkGray]}]
		ifTrue: [
			aSymbol caseOf: {
				[nil] -> [ToolIcons blank].
				[#pending] -> [ToolIcons testOrange].
				[#merged] -> [ToolIcons testGreen].
				[#treated] -> [ToolIcons testRed].
				[#trunk] -> [ToolIcons testGray]}]