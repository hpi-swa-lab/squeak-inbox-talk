baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		"dependencies"
		spec
			package: 'JSON' with: [spec repository: 'https://www.squeaksource.com/PostgresV3'];
			baseline: 'SimulationStudio' with: [
				spec
					repository: 'github://LinqLover/SimulationStudio/packages';
					loads: 'SimulationStudio-Base'];
			baseline: 'SqueakHistory' with: [spec repository: 'github://hpi-swa/squeak-history/packages'].
		"packages"
		
		spec package: 'SqueakInboxTalk' with: [
			spec
				preLoadDoIt: #preLoadCore;
				requires: 'SqueakHistory';
				preLoadDoIt: #preLoadMailingLists].
		"test packages"
		spec package: 'SqueakInboxTalkTests' with: [spec requires: #(#app 'JSON' 'SimulationStudio')].
		
		"groups"
		spec
			group: #app with: 'SqueakInboxTalk';
			group: #default with: #(#app #tests);
			group: #tests with: 'SqueakInboxTalkTests']