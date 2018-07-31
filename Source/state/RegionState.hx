package state;
	
public class RegionState extends BaseState {
	// Imagem do mapa de biomas
	[Embed(source = "../../data/biomas_map.png")] private var ImgBiomasMap:Class;
	
	// Variável da região selecionada
	private static var _region:String;
	// Variável do botão da amazônia
	private var _button_region_amazonia:ButtonRegionAmazonia;
	// Variável do botão do cerrado
	private var _button_region_cerrado:ButtonRegionCerrado;
	// Variável do botão da mata atlântica
	private var _button_region_mata_atlantica:ButtonRegionMataAtlantica;
	private var _backgroundCerrado:BackgroundCerrado;
	
	override public function create():Void {		
		super.create();
		
		// Adiciona o background no palco
		_backgroundCerrado = new BackgroundCerrado(20, 20);
		_backgroundCerrado.play("animate");
		_lyr_stage.add(_backgroundCerrado);
		
		// Mapa dos biomas
		_lyr_sprites.add(new FlxSprite(ImgBiomasMap, 158, 38));
		
		// Botão bioma amazônia
		_button_region_amazonia = new ButtonRegionAmazonia(158, 38);
		// Adiciona na camada de sprites
		_lyr_sprites.add(_button_region_amazonia);
		
		// Botão bioma cerrado
		_button_region_cerrado = new ButtonRegionCerrado(288, 111);
		// Adiciona na camada de sprites
		_lyr_sprites.add(_button_region_cerrado);
		
		// Botão bioma mata atlântica
		_button_region_mata_atlantica = new ButtonRegionMataAtlantica(329, 143);
		// Adiciona na camada de sprites
		_lyr_sprites.add(_button_region_mata_atlantica);
		
		// Labels dos botões
		_lyr_sprites.add(new FlxText(_button_region_amazonia.x + 55, _button_region_amazonia.y + (_button_region_amazonia.height / 2), _button_region_amazonia.width, _button_region_amazonia.height, "Bioma Amazônia", 0xffffff, null, 16));
		_lyr_sprites.add(new FlxText(_button_region_cerrado.x + 50, _button_region_cerrado.y + (_button_region_cerrado.height / 2) + 20, _button_region_cerrado.width, _button_region_cerrado.height, "Bioma Cerrado", 0xffffff, null, 16));
		_lyr_sprites.add(new FlxText(_button_region_mata_atlantica.x + 20, _button_region_mata_atlantica.y + (_button_region_mata_atlantica.height / 2) + 60, _button_region_mata_atlantica.width + 20, _button_region_mata_atlantica.height, "Bioma Mata Atlântica", 0xffffff, null, 16));
		
		// Texto explicativo
		_lyr_sprites.add(new FlxText(0, 30, FlxG.width, 80, "Selecione o bioma da sua fazenda", 0xffE46713, null, 26, "center"));
		
		addVersionBeta();
	}
	
	// Método chamado constantemente
	override public function update():Void {
		_backgroundCerrado.update();
		
		// Se estiver em cima o mouse e houver click seleciona amazônia
		if (_button_region_amazonia.checkOnMouseOver(FlxG.mouse)) {
			if (FlxG.justPressed(FlxG.MOUSE)) {
				onClickBtnBiomaAmazonia();
			}
		}
		
		// Se estiver em cima o mouse e houver click seleciona cerrado
		if (_button_region_cerrado.checkOnMouseOver(FlxG.mouse)) {
			if (FlxG.justPressed(FlxG.MOUSE)) {
				onClickBtnBiomaCerrado();
			}				
		}
		
		// Se estiver em cima o mouse e houver click seleciona mata atlântica
		if (_button_region_mata_atlantica.checkOnMouseOver(FlxG.mouse)) {
			if (FlxG.justPressed(FlxG.MOUSE)) {
				onClickBtnMataAtlantica();
			}
		}
	}
	
	// Método que retorna a região selecionada
	public static function getRegion():String {
		return _region;
	}
	
	// Método chamado quando for clicado no botão do bioma da amazônia
	private function onClickBtnBiomaAmazonia():void {
		_region = "amazonia";
		FlxG.switchState(PhaseOneState);
	}
	
	// Método chamado quando for clicado no botão do bioma do cerrado
	private function onClickBtnBiomaCerrado():void {
		_region = "cerrado";
		FlxG.switchState(PhaseOneState);
	}
	
	// Método chamado quando for clicado no botão do bioma da mata atlântica
	private function onClickBtnMataAtlantica():void {
		_region = "mata_atlantica";
		FlxG.switchState(PhaseOneState);
	}
}
