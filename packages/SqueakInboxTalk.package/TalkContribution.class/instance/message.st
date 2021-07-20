accessing
message

	self flag: #discuss. "Rename to #initialMessage?"
	^ self messages detectMin: #date