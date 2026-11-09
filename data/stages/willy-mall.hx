var warp:CustomShader = null;

function create() {
	if (!Options.gameplayShaders) {
		disableScript();
		return;
	}

	warp = new CustomShader('warp');
	warp.distortion = 0;
	camGame.addShader(warp);
}

function setDistortion(value:Dynamic) {
	if (warp == null) return;

	var amount = Std.parseFloat(Std.string(value));
	if (!Math.isNaN(amount))
		warp.distortion = amount;
}