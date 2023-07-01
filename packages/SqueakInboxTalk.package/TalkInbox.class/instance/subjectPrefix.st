accessing
subjectPrefix

	^ subjectPrefix ifNil: ['[{1}] ' format: {self name}]