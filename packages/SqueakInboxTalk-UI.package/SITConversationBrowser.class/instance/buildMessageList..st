toolbuilder
buildMessageList: aBuilder

	^ aBuilder pluggableMultiColumnListSpec new
		model: self;
		list: #messageColumns;
		getIndex: #selectedMessageIndex;
		setIndex: #selectedMessageIndex:;
		yourself