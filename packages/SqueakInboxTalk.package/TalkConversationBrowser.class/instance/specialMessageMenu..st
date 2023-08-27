toolbuilder
specialMessageMenu: menu

	| selector |
	(self respondsTo: (selector := self selectedMessage second "textSelector")) ifFalse: [^ menu].
	
	menu
		add: 'browse' action: [ToolSet browse: self class selector: selector];
		add: 'debug' action: [
			(Process forBlock: [self perform: selector] runUntil: [:ctxt | ctxt selector = selector])
				debug].
	^ menu