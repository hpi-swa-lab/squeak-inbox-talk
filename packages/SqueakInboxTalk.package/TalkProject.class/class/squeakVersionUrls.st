private
squeakVersionUrls

	| urls |
	urls := OrderedDictionary new.
	urls
		at: '3.9' put: 'http://source.squeak.org/39a';
		at: '3.10' put: 'http://source.squeak.org/310'.
	#(4 #(1 2 3 4 5 6) 5 #(0 1 2 3)) pairsDo: [:main :subs |
		subs do: [:sub |
			urls
				at: ('{1}.{2}' format: {main. sub})
				put: ('http://source.squeak.org/squeak{1}{2}' format: {main. sub})]].
	^ urls