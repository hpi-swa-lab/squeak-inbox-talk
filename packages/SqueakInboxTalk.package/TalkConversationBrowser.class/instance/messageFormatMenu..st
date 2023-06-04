toolbuilder
messageFormatMenu: menu

	menu defaultTarget: self.
	self allMessageFormats do: [:format |
		format = #- ifTrue: [menu addLine] ifFalse: [
			self
				menu: menu
				add: (self labelForMessageFormat: format)
				getState: [self messageFormat = format]
				setState: [:boolean | self messageFormat: format]]].
	^ menu