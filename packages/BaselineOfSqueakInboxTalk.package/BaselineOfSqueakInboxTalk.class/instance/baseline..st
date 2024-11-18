baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		"dependencies"
		spec baseline: 'SemanticText' with: [
			spec repository: 'github://hpi-swa-lab/Squeak-SemanticText:main/packages'].
		spec baseline: 'SqueakHistory' with: [
			spec
				repository: 'github://hpi-swa/squeak-history:master/packages';
				loads: 'SqueakHistory'].
		
		"packages"
		spec package: 'SqueakInboxTalk' with: [
			spec
				requires: 'SqueakHistory';
				postLoadDoIt: #postLoad].
		spec package: 'SqueakInboxTalkExtras-Semantics' with: [
			spec
				requires: #('SqueakInboxTalk' 'SemanticText');
				postLoadDoIt: #postLoadGeneric].
		"test packages"
		spec package: 'SqueakInboxTalkTests' with: [spec requires: #(#app)].
		
		"groups"
		spec
			group: #app with: 'SqueakInboxTalk';
			group: #default with: #(#app #tests);
			group: #tests with: 'SqueakInboxTalkTests';
			group: #withAllExtras with: #(app 'SqueakInboxTalkExtras-Semantics')]