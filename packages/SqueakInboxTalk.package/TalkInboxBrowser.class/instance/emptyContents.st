accessing - contents
emptyContents

	self totalFilter isActive ifTrue: [
		^ (self hasBackgroundWorkerFor: #conversations)
			ifTrue: [ | hitCount |
				hitCount := self conversations size - 1 clampLow: 0.
				('Searching... {1} {2} so far' format: {hitCount. 'hit' asPluralBasedOn: hitCount}) asText
					addAttribute: TextEmphasis italic;
					yourself]
			ifFalse: [
				'Displaying <b>{1} out of {2}</b> conversations matching your {3}.' withCRs talkAsTextFromHtml format: {
					self conversations size.
					self allConversations size.
					(OrderedCollection streamContents: [:stream |
						searchModel isActive ifTrue: [stream nextPut: 'search query'].
						self menuFilter activeFilters ifNotEmpty: [stream nextPut: 'filters']]) asCommaStringAnd.
					'Reset filters?' asText addAttribute: (PluggableTextAttribute evalBlock: [self resetAllFilters])}]].
	
	^ '<b>{1}</b>

In the last {14}, the {2} community has produced <b>{10} messages</b> and <b>{11} contributions</b> that make up <b>{12} conversations</b> in total.
Press the <b>{20} button</b> to download the latest messages. You can also fetch older messages by setting the download range from the {21}.

<b>This is an early version under ongoing development!</b> Press the {30} button to {31} or {32}. Your support will be highly appreciated!' withCRs talkAsTextFromHtml format: {
		'Welcome to {1}!' asText
			addAttribute: (TextKern kern: 0.5);
			format: {self appName}.
		self inbox name.
		nil.
		nil.
		nil.
		nil.
		nil.
		nil.
		nil.
		self inbox messages size.
		self inbox contributions size.
		self inbox conversations size.
		self conversations size.
		'{1} days' format: {self inbox downloadRange days}.
		nil.
		nil.
		nil.
		nil.
		nil.
		'Refresh' asText addAttribute: (PluggableTextAttribute evalBlock: [self refreshMessages]).
		'window menu {1}' asText
			addAttribute: (PluggableTextAttribute evalBlock: [self containingWindow offerWindowMenu]);
			format: {(self containingWindow ifNotNil: #class ifNil: [SystemWindow]) menuBoxImage talkAsText}.
		'filters' asText addAttribute: (PluggableTextAttribute evalBlock: [self offerFilterMenu]).
		'Reset filters?' asText addAttribute: (PluggableTextAttribute evalBlock: [self resetAllFilters]).
		nil.
		nil.
		nil.
		nil.
		nil.
		nil.
		self appVersionLabel asText addAttribute: (PluggableTextAttribute evalBlock: [self offerAppMenu]).
		'install the latest updates' asText addAttribute: (PluggableTextAttribute evalBlock: [self doSelfUpdate]).
		'leave some feedback' asText addAttribute: (PluggableTextAttribute evalBlock: [self sendFeedback])}