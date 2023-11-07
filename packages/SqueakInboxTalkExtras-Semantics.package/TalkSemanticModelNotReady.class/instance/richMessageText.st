printing
richMessageText

	^ '{1}\\{2} to try again.' withCRs asText format:
		{(self featureName ifNil: ['You need to {2}.'] ifNotNil: ['To enable {1}, you need to {2}.']) asText format:
			{self featureName.
			SemanticText
				formatRequirements: self requirements
				retry: [self cancel]}.
		'Click here' asText
			addAttribute: (PluggableTextAttribute evalBlock: [self cancel]);
			yourself}