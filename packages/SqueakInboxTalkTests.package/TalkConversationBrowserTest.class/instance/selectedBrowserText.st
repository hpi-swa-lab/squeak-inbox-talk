support
selectedBrowserText

	^ browser currentText
		copyFrom: browser textSelection start
		to: browser textSelection stop