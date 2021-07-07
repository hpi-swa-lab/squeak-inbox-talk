toolbuilder
buildToggle: aBuilder

	^ aBuilder pluggableButtonSpec new
		model: self;
		horizontalResizing: #rigid;
		yourself