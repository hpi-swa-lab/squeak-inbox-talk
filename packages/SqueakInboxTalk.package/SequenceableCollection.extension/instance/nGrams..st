*SqueakInboxTalk-Filters-comparing
nGrams: n

	^ (self species new: n - 1), self, (self species new: n - 1) basicNGrams: n - 1