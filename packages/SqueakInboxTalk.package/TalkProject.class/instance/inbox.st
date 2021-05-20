accessing
inbox

	(#('FFI' 'Trunk') includes: self name) ifTrue: [^ TalkInbox squeakDev].
	^ self halt