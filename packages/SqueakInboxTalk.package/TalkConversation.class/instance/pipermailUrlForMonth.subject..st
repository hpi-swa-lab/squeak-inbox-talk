accessing
pipermailUrlForMonth: aMonth subject: aString

	^ 'http://lists.squeakfoundation.org/pipermail/{1}/{2}/thread.html#:~:text={3}' format: {self inbox name. '{1}-{2}' format: {aMonth year. aMonth monthName}. aString encodeForHTTP}