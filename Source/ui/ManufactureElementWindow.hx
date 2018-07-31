package ui;
import entity.MaterialElement;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import constants.MaterialConstants;

/**
 * ...
 * @author blaze
 */
class ManufactureElementWindow extends FlxSpriteGroup
{
	public var elements:Map < Int, Array<Array<Int>> > ; //mid => [分类（0背包，1快捷键），位置，剩余数量]
	public var isEnough:Bool;
	
	public function new(X:Float = 0, Y:Float = 0) 
	{
		super(X, Y);

		//visible = false;
	}
	
	public function load(materialId:Int = 0, window:ManufactureWindow)
	{
		var manufactureImage = null;
		var manufactureName = null;
		var manufactureNumber = null;
		
		elements = new Map < Int, Array<Array<Int>> > ();
		
		if (MaterialConstants.manufactureToMaterials[materialId] != null)
		{
			var i = 0;
			for (array in MaterialConstants.manufactureToMaterials[materialId])
			{
				manufactureImage = new MaterialElement(0, i);
				manufactureImage.loadElement(array[0]);
				add(manufactureImage);
				manufactureName = new FlxText(30, i, 100, MaterialConstants.materials[array[0]][MaterialConstants.materialIndexName], 16, false);
				add(manufactureName);
				
				var number = 0;
				var needAllNumber = array[1] * Std.parseInt(window.selectNumber.numberInput.text);
				var needNumber = needAllNumber;
				var leftNumber = 0;
				
				elements[array[0]] = [];
				//加载背包里边材料个数
				for (key in window.state.playerData.packageData.keys())
				{
					if (window.state.playerData.packageData[key][0] == array[0])
					{
						number += window.state.playerData.packageData[key][1];
						
						if (needNumber > 0)
						{
							if (window.state.playerData.packageData[key][1] >= needNumber)
							{
								leftNumber = window.state.playerData.packageData[key][1] - needNumber;
								needNumber = 0;
							}
							else
							{
								needNumber = needNumber - window.state.playerData.packageData[key][1];
								leftNumber = 0;
							}
							
							elements[array[0]].push([0, key, leftNumber]);
						}
					}
				}
				
				//加载背包里边材料个数
				for (key in window.state.playerData.shortCutData.keys())
				{
					if (window.state.playerData.shortCutData[key][0] == array[0])
					{
						number += window.state.playerData.shortCutData[key][1];
						
						if (needNumber > 0)
						{
							if (window.state.playerData.shortCutData[key][1] >= needNumber)
							{
								leftNumber = window.state.playerData.shortCutData[key][1] - needNumber;
								needNumber = 0;
							}
							else
							{
								needNumber = needNumber - window.state.playerData.shortCutData[key][1];
								leftNumber = 0;
							}
							
							elements[array[0]].push([1, key, leftNumber]);
						}
					}
				}
				
				if (number >= needAllNumber)
				{
					isEnough = true;
				}
				else
				{
					isEnough = false;
				}
				
				//添加所需材料个数
				manufactureNumber = new FlxText(100, i, 20, number + "/" + array[1]);
				add(manufactureNumber);
				
				i = i + 20;
			}
		}
	}
	
}