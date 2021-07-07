private
subjectFor: aConversation

	^ String streamContents: [:stream | | contributions count |
		stream nextPutAll: aConversation subject.
		
		contributions := aConversation contributions.
		count := contributions size > 1
			ifTrue: [contributions size]
			ifFalse: [aConversation messages size].
		count > 1 ifTrue: [
			stream
				space;
				nextPut: $(;
				print: count;
				nextPut: $)]]