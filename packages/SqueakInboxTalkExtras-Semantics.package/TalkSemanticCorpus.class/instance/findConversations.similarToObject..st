search
findConversations: number similarToObject: anObject

	^ self findConversationsUsing: [:collectBlock |
		self
			findObjects: number
			similarToObject: anObject
			collect: collectBlock]