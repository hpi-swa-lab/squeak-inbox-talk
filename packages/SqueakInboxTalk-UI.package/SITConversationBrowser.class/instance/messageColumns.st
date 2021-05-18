accessing
messageColumns

	^ {"[:message | message date sitPrintString]. "#author} collect: [:columnBlock | self messages collect: columnBlock]