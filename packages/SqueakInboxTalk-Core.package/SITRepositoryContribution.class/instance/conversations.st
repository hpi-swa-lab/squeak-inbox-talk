accessing
conversations

	^ self inbox conversations select: [:conversation | conversation contributions includes: self]