accessing - toolbuilder
iconForContributionState: aSymbol

	^ aSymbol caseOf: {
		[nil] -> [ToolIcons blank].
		[#pending] -> [ToolIcons testOrange].
		[#merged] -> [ToolIcons testGreen].
		[#treated] -> [ToolIcons testRed].
		[#trunk] -> [ToolIcons testGray]}