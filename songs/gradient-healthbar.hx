//Taken from https://discord.com/channels/860561967383445535/1548189756314226819

var healthShader = new FunkinShader('#pragma header
uniform vec3 colorA;
uniform vec3 colorB;
uniform float percent;
uniform float softness;
void main()
{
	#pragma body
	float t = smoothstep(percent - softness, percent + softness, openfl_TextureCoordv.x);
	gl_FragColor.rgb = mix(colorA, colorB, t) * gl_FragColor.a;
}');

function postCreate()
{
    remove(healthBar);
    new_healthBar = new FlxSprite(healthBar.x, healthBar.y).makeSolid(healthBar.width, healthBar.height, FlxColor.WHITE);
    new_healthBar.camera = healthBar.getDefaultCamera();
    insert(members.indexOf(healthBarBG) + 1, new_healthBar);

    healthShader.colorA = colorToArray(dad.iconColor);
	healthShader.colorB = colorToArray(bf.iconColor);
	healthShader.softness = 0.06;
	new_healthBar.shader = healthShader;
}
function colorToArray(c:Int):Array<Float>
{
	return [
		((c >> 16) & 0xFF) / 255,
		((c >> 8) & 0xFF) / 255,
		(c & 0xFF) / 255
	];
}

function postUpdate()
{
    healthShader.percent = 1 - (healthBar.percent / 100);
}