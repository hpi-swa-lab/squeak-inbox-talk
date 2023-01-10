accessing - toolbuilder
refreshMessagesColor

	| age warningAge dangerAge defaultColor warningColor dangerColor |
	age := inbox lastRefreshed ifNotNil: [:date | DateAndTime now - date].
	warningAge := self class inboxAgeForWarning.
	warningAge isZero ifTrue: [warningAge := nil].
	dangerAge := self class inboxAgeForDanger.
	dangerAge isZero ifTrue: [dangerAge := nil].
	
	defaultColor := (self userInterfaceTheme theme get: #color for: #PluggableButtonMorph)
		ifNil: [Color gray: 0.91].
	warningColor := warningAge ifNotNil:
		[(self userInterfaceTheme theme get: #failureColor for: #TestRunner)
			ifNil: [Color yellow]].
	dangerColor := dangerAge ifNotNil:
		[(self userInterfaceTheme theme get: #errorColor for: #TestRunner)
			ifNil: [Color red]].
	^ age
		ifNil: [(dangerColor ifNil: [warningColor]) ifNil: [defaultColor]]
		ifNotNil:
			[(warningAge notNil and: [age <= warningAge])
				ifTrue: [defaultColor]
				ifFalse:
					[dangerAge
						ifNil:
							[warningColor ifNil: [defaultColor]]
						ifNotNil:
							[warningAge
								ifNil:
									[age >= dangerAge
										ifTrue: [dangerColor]
										ifFalse: [defaultColor]]
								ifNotNil:
									[dangerColor
										mixed: age - warningAge / (dangerAge - warningAge)
										with: warningColor]]]]