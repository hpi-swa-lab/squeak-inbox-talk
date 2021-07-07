private
stringifyProperty: property

	property isString ifTrue: [^ property].
	property isBlock ifTrue: [^ self stringifyBlock: property].
	^ property asString