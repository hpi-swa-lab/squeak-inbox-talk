accessing - message
text

	self selector ifNil: [^ self content].
	
	^ self content asText , String cr , String cr ,
		('[Hide this announcement]' asText
			addAttribute:
				(PluggableTextAttribute evalBlock: [self hide]);
			yourself)