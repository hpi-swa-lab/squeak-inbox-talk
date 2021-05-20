updating
dependentAspectsOn: aspect

	^ aspect
		caseOf: {
			[#conversation] -> [#(#labelString #messages)].
			[#labelString] -> [#(#windowTitle)].
			[#messages] -> [#(#messageColumns)].
			[#selectedMessage] -> [#(#text #selectedMessageIndex)]}
		otherwise: [#()]