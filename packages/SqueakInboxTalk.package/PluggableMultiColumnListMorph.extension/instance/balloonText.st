*SqueakInboxTalk-UI-accessing-Morphic-ct.1774-override
balloonText
	
	| columnIndex modelIndex selector |
	selector := self getHelpSelector ifNil: [^ super balloonText].
	(self model respondsTo: selector) ifFalse: [^ nil].
	
	modelIndex := self modelIndexFor: self hoverRow.
	modelIndex > 0 ifFalse: [^ nil].
	columnIndex := self hoverColumn.
	columnIndex > 0 ifFalse: [^ nil].
	^ self model perform: selector withEnoughArguments: {modelIndex. columnIndex}