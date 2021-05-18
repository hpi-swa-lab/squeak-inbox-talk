accessing
inbox

	(#('FFI' 'Trunk') includes: self name) ifTrue: [^ SITInbox squeakDev].
	^ self halt