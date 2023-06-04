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
				'Displaying <b>{1} out of {2}</b> conversations matching your {3}.' withCRs asTextFromHtml format: {
					self conversations size.
					self allConversations size.
					(OrderedCollection streamContents: [:stream |
						searchModel isActive ifTrue: [stream nextPut: 'search query'].
						self menuFilter activeFilters ifNotEmpty: [stream nextPut: 'filters']]) asCommaStringAnd.
					'Reset filters?' asText addAttribute: (PluggableTextAttribute evalBlock: [self resetAllFilters])}]].
	
	^ '<b>{1}</b>

{2}

Press the {3} button to customize this tool, {4}, or {5}.' talkAsTextFromHtmlWithCRs format: {
		'Welcome to {1}!' asText
			addAttribute: (TextKern kern: 0.5);
			format: {self appName}.
		(self allConversations
			ifEmpty: ['It looks empty here! You could start by pressing the <b>{6} button</b> to download the latest messages. You can also fetch older messages by setting the download range from the {7}.' asTextFromHtml]
			ifNotEmpty: ['In the last {2}, the {1} community has produced <b>{3} messages</b> and <b>{4} contributions</b> that make up <b>{5} conversations</b> in total.
Press the <b>{6} button</b> to download the latest messages. You can also fetch older messages by setting the download range from the {7}.' talkAsTextFromHtmlWithCRs]) format: {
			self inbox name.
			'{1} days' format: {self inbox downloadRange ifNotNil: #days ifNil: ['infinite']}.
			self inbox messages size.
			self inbox contributions size.
			self inbox conversations size.
			'Refresh' asText addAttribute: (PluggableTextAttribute evalBlock: [self refreshMessages]).
			'settings menu' asText
				addAttribute: (PluggableTextAttribute evalBlock: [self offerAppMenu]);
				yourself}.
		self appButtonLabel asText addAttribute: (PluggableTextAttribute evalBlock: [self offerAppMenu]).
		'install the latest updates' asText addAttribute: (PluggableTextAttribute evalBlock: [self doSelfUpdate]).
		'leave some feedback' asText addAttribute: (PluggableTextAttribute evalBlock: [self sendFeedback])}