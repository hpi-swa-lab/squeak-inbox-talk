caching
clearCache

	Cache ifNil: [^ self].
	Cache keysAndValuesRemove: [:key :dataView | dataView isKindOf: self]