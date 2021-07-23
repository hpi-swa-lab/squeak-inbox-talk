private
basicTextSelection: textInterval headerSelection: headerInterval

	textSelection := textInterval.
	headerSelection := headerInterval.
	self changedAll: #(#textSelection #headerSelection)