accessing
specialMessages
	"Other packages can contribute additional textual views (which are displayed as items above regular messages) by adding an extension method with the following pragma."

	^ (((Pragma allNamed: #specialMessage:header:priority:if: from: self class to: TalkConversationBrowser)
		select: [:pragma | self perform: (pragma argumentAt: 4 "testSelector")])
			sorted: [:pragma | pragma argumentAt: 3 "priority"] ascending)
				collect: [:pragma |
					{"key" pragma argumentAt: 1.
					"textSelector" pragma selector.
					"headerSelector" pragma argumentAt: 2}]