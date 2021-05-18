toolbuilder
buildConversationPreview: aBuilder

	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #conversationPreview;
		yourself