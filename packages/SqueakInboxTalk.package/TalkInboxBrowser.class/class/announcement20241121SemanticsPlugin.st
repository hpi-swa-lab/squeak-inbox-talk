announcements
announcement20241121SemanticsPlugin
	<talkAnnouncement>

	^ TalkInboxBrowserAnnouncement
		selector: #announcement20241121SemanticsPlugin
		date: '2024-11-18' asDate asDateAndTime
		subject: ('Try out new AI tools for {1}' format: {self appName})
		content: ('Big news! {appName} now offers an optional {plugin} that helps you search, navigate, and survey the mailing list. The {plugin} uses <a href="{semanticTextUrl}">{semanticText}</a>, a new framework for generative AI in Squeak.

You can read more about the new features here:
<a href="{annUrl}">{annSubject}</a>

To use the plugin, enable the {preference} setting in the preference browser.'
			format:
				(Dictionary new
					at: #appName put: self appName;
					at: #plugin put: 'Semantics Plugin';
					at: #semanticText put: 'SemanticText';
					at: #semanticTextUrl put: 'https://github.com/hpi-swa-lab/Squeak-SemanticText';
					at: #annSubject put: '[squeak-dev] [ANN] SemanticText: ChatGPT, embedding search, and retrieval-augmented generation for Squeak' escapeEntities;
					at: #annUrl put: 'code:// (TalkInbox squeakDev messageForId: ''<ffab8136-dea2-41d1-993c-61251f1333bc@MX2018-DAG1.hpi.uni-potsdam.de>'') browse'; flag: #todo "update";
					at: #preference put:
						('Semantic search in Squeak Inbox Talk' asText
							addAttribute: (PluggableTextAttribute evalBlock: [PreferenceBrowser open searchPattern: 'enableSemanticSearch']);
							yourself);
					yourself))
				talkAsTextFromHtmlWithCRs