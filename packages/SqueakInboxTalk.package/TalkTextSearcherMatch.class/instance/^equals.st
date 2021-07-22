comparing
= anotherMatch

	^ anotherMatch class = self class and: [{self equalityKey} = {anotherMatch equalityKey}]