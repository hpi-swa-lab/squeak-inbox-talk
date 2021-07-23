accessing
talkTestMethodWrapperCount

	^ (method == #new ifTrue: [0] ifFalse: [method talkTestMethodWrapperCount]) + 1