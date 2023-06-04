initialize-release
newMenuFilter

	^ TalkFilterSet new
		filters: {
			TalkContributionFilter new.
			TalkContributionStateFilter new.
			TalkInvolvementFilter new.
			TalkDomainFilter newFilterSet.
			TalkPluggableFilter new};
		resetLabel: 'reset all filters (l)';
		separateFilters: true;
		addDependent: self;
		yourself