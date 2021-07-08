*SqueakInboxTalk-UI-browsing
browseChanges

	| versionInfo ancestor historyBrowser |
	versionInfo := self versionInfo.
	historyBrowser := MCVersionHistoryBrowser new
		package: self version package;
		ancestry: versionInfo;
		yourself.
	ancestor := versionInfo ancestors size
		caseOf: {
			[0] -> [^ self inform: 'This version does not have an ancestry'].
			[1] -> [versionInfo ancestors anyOne]}
		otherwise: [ | index |
			index := Project uiManager chooseFromLabeledValues: (versionInfo ancestors collect: [:ancestry | ancestry name -> ancestry] as: OrderedDictionary) title: 'View changes from...'.
			(#(0 nil) includes: index) ifTrue: [^ self].
			index].
	historyBrowser
		selection: 1;
		viewChanges: ancestor