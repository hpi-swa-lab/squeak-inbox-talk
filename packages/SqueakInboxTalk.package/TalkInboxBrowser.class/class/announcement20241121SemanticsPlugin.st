announcements
announcement20241121SemanticsPlugin
	<talkAnnouncement>

	^ TalkInboxBrowserAnnouncement
		selector: #announcement20241121SemanticsPlugin
		date: '2024-11-18' asDate asDateAndTime
		subject: ('Try out new AI tools for {1}' format: {self appName})
		content: ('Big news! {1} now offers an optional {2} that helps you search, navigate, and survey the mailing list. The {2} uses <a href="{4}">{3}</a>, a new framework for generative AI in Squeak.

You can read more about the new features here:
<a href="{6}">{5}</a>

To use the plugin, enable the {7} setting in the preference browser.'
			format:
				{self appName.
				'Semantics Plugin'.
				'SemanticText'.
				'https://github.com/hpi-swa-lab/Squeak-SemanticText'.
				'[squeak-dev] [ANN] SemanticText: ChatGPT, embedding search, and retrieval-augmented generation for Squeak' escapeEntities.
				'code:// (TalkInbox squeakDev messageForId: ''<ffab8136-dea2-41d1-993c-61251f1333bc@MX2018-DAG1.hpi.uni-potsdam.de>'') browse. nil' flag: #todo "update".
				'Semantic search in Squeak Inbox Talk' asText
					addAttribute: (PluggableTextAttribute evalBlock: [PreferenceBrowser open searchPattern: 'enableSemanticSearch']);
					yourself})
				talkAsTextFromHtmlWithCRs