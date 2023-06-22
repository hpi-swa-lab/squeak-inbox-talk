actions
browseAttachments

	| message attachmentNames uniqueLabels selectedIndex attachment |
	message := self selectedActualMessage.
	attachmentNames := (message ifNil: [^ self changed: #flash]) attachmentNames.
	
	attachmentNames ifEmpty: [^ self inform: 'This message has no attachments.'].
	
	uniqueLabels := attachmentNames in: [:names |
		| counts nonUniqueNames |
		nonUniqueNames := names select: [:name |
			(attachmentNames count: [:otherName | name = otherName]) > 1].
		counts := Bag new.
		names collect: [:name |
			counts add: name.
			(nonUniqueNames includes: name) ifFalse: [name] ifTrue: [
				'{1} ({2})' format: {name. counts occurrencesOf: name}]]].
	
	selectedIndex := Project uiManager chooseFrom: uniqueLabels title: 'Attachments'.
	selectedIndex = 0 ifTrue: [^ self].
	attachment := message attachmentAt: selectedIndex.
	^ attachment view