*SqueakInboxTalk-UI-tools
explainTimezone

	| their our |
	their := self date printString asText.
	our := self date asLocal printString asText.
	their = our ifFalse:
		[their
			addAllAttributes: (((self userInterfaceTheme get: #removeTextAttributes for: #TextDiffBuilder)
				select: [:attr | attr isKindOf: TextColor])
					ifEmpty: [{TextColor blue}])
			from: their size - 5 to: their size.
		our
			addAllAttributes: (((self userInterfaceTheme get: #insertTextAttributes for: #TextDiffBuilder)
				select: [:attr | attr isKindOf: TextColor])
					ifEmpty: [{TextColor red}])
			from: our size - 5 to: our size].
	Project uiManager
		inform: ('<b>In their timezone ({1})</b>: {2}<br><b>In our timezone ({3}):</b> {4}' asTextFromHtml format:
			{((TimeZone talkAllForOffset: self date offset) collect: #abbreviation) joinSeparatedBy: '/'.
			their.
			TimeZone local abbreviation.
			our})
		title: 'Unraveling Timezones'.