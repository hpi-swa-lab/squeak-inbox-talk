tests - searching
testSearchAndNavigate

	| navigationSpecs |
	browser selectMessage: nil.
	browser searchModel
		matchesRegex: true;
		matchesWholeWord: true;
		searchTerm: 'mock \w+ \d'.
	
	self deny: browser searchModel hasSearchError.
	self assert: browser selectedMessage isNil.
	
	"forward"
	navigationSpecs := (browser messages withIndexCollect: [:message :index | {message. index}]) gather: [:messageWithIndex | #('subject' 'author' 'text') collect: [:word | messageWithIndex copyWith: word]].
	self
		testNavigate: [browser searchModel accept: browser searchModel searchTerm]
		through: navigationSpecs.
	"reset selected match"
	browser searchModel
		matchesRegex: false;
		matchesRegex: true.
	"backward"
	self patch: browser searchModel at: #currentEventShiftPressed withValue: true during: [
		self
			testNavigate: [browser searchModel accept: browser searchModel searchTerm]
			through: navigationSpecs reversed]