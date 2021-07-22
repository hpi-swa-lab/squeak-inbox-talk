private
basicSelectTextInterval: textInterval headerTextInterval: headerTextInterval

	selectedTextInterval := textInterval.
	selectedHeaderTextInterval := headerTextInterval.
	self changedAll: #(#selectedTextInterval #selectedHeaderTextInterval)