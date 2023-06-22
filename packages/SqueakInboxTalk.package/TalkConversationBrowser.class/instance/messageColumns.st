accessing
messageColumns

	^ {#authorTimestamp} collect: [:columnBlock |
		self messages collect: columnBlock]