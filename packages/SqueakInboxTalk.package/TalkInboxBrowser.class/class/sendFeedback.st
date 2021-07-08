feedback
sendFeedback

	(Project uiManager
		chooseFromLabeledValues: (OrderedDictionary new
			at: 'Create issue on GitHub (recommended)' put: [self sendFeedbackGitHub];
			at: ('Send email to {1}' format: {self defaultInbox name}) put: [self sendFeedbackTo: self defaultInbox mailAddress];
			at: 'Send email to author' put: [self sendFeedbackTo: self authorMailAddress];
			yourself)
		title: 'I appreciate your feedback very much! How should we transmit your thoughts?') value