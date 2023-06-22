private
chatGPT

	^ ChatGPTObject ifNil: [ChatGPTObject :=
		(Smalltalk classNamed: #ChatGPT) new
			model: 'gpt-3.5-turbo';
			yourself]