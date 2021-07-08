searching - private
basicMatchesInConversation: aConversation

	^ Generator on: [:gen | aConversation visitBySearcher: self context: gen]