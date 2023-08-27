search - private
findConversationsUsing: aBlock

	| placeholder |
	placeholder := nil.
	^ aBlock value: [:message |
		message isPlaceholder
			ifFalse: [message conversation]
			ifTrue:
				[(placeholder ifNil: [placeholder := TalkSemanticMessagesPlaceholder new])
					addMessage: message;
					yourself]]