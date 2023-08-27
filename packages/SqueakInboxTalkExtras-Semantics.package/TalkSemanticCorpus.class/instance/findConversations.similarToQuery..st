search
findConversations: number similarToQuery: aString

	^ self findConversationsUsing: [:collectBlock |
		self
			findObjects: number
			similarToQuery: aString
			collect: collectBlock]