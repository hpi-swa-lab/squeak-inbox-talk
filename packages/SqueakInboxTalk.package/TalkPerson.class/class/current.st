accessing
current

	^ Current ifNil: [ | person |person := self new.
		person initializeInteractively ifNotNil: [Current := person].
		^ person]