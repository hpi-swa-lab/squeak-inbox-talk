toolbuilder
buildReplyButton: aBuilder

	^ aBuilder pluggableActionButtonSpec new
		model: self;
		label: 'Reply';
		action: #reply;
		enabled: #hasMessageSelected;
		yourself