instance creation
newFilterSet

	^ TalkFilterSet new
		filters: {TalkProjectFilter new. TalkPackageFilter new};
		resetLabel: 'reset domain filters';
		yourself