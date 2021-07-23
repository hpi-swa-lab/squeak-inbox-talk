asserting
testNavigate: selectBlock through: specs

	specs, specs talkSpecsDo: [:message :index :word | | selectedText |
		selectBlock value.
		self deny: browser searchModel hasSearchError.
		self assert: message equals: browser selectedMessage.
		
		selectedText := word = 'text'
			ifFalse: [
				browser headerText
					copyFrom: browser headerSelection start
					to: browser headerSelection stop]
			ifTrue: [
				browser currentText
					copyFrom: browser textSelection start
					to: browser textSelection stop].
		self
			assert: 'mock ', word, ' ', index equals: selectedText asString asLowercase;
			assert: selectedText talkIsAllEmphasized]