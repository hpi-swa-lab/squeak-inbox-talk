copying
withStart: start stop: stop

	^ self deriveCopy
		interval: (start to: stop);
		yourself