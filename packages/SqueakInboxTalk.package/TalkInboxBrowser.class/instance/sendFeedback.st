actions
sendFeedback

	(Project uiManager
		chooseFromLabeledValues: (OrderedDictionary new
			at: 'Create issue on GitHub (recommended)' put: [self class sendFeedbackGitHub];
			at: ('Send email to {1}' format: {self inbox name})
				put: [self sendFeedbackTo: self inbox mailAddress];
			at: 'Send email to author'
				put: [self sendFeedbackTo: self class authorMailAddress];
			yourself)
		title: 'I appreciate your feedback very much! How should we transmit your thoughts?') value