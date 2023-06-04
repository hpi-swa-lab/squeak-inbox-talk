accessing - toolbuilder
accept: aString

	self isActive ifFalse: [^ self changed: #flash].
	self changed: #selectResult with: self currentEventShiftPressed not