package;


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.text.Font;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.utils.ByteArray;
import haxe.Unserializer;
import openfl.Assets;

#if (flash || js)
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLLoader;
#end

#if ios
import openfl.utils.SystemPath;
#end


@:access(flash.media.Sound)
class DefaultAssetLibrary extends AssetLibrary {
	
	
	public static var className (default, null) = new Map <String, Dynamic> ();
	public static var path (default, null) = new Map <String, String> ();
	public static var type (default, null) = new Map <String, AssetType> ();
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("flixel/img/debugger/buttons/console.png", __ASSET__flixel_img_debugger_buttons_console_png);
		type.set ("flixel/img/debugger/buttons/console.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/drawDebug.png", __ASSET__flixel_img_debugger_buttons_drawdebug_png);
		type.set ("flixel/img/debugger/buttons/drawDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/logDebug.png", __ASSET__flixel_img_debugger_buttons_logdebug_png);
		type.set ("flixel/img/debugger/buttons/logDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/open.png", __ASSET__flixel_img_debugger_buttons_open_png);
		type.set ("flixel/img/debugger/buttons/open.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/pause.png", __ASSET__flixel_img_debugger_buttons_pause_png);
		type.set ("flixel/img/debugger/buttons/pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/play.png", __ASSET__flixel_img_debugger_buttons_play_png);
		type.set ("flixel/img/debugger/buttons/play.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/record_off.png", __ASSET__flixel_img_debugger_buttons_record_off_png);
		type.set ("flixel/img/debugger/buttons/record_off.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/record_on.png", __ASSET__flixel_img_debugger_buttons_record_on_png);
		type.set ("flixel/img/debugger/buttons/record_on.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/restart.png", __ASSET__flixel_img_debugger_buttons_restart_png);
		type.set ("flixel/img/debugger/buttons/restart.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/statsDebug.png", __ASSET__flixel_img_debugger_buttons_statsdebug_png);
		type.set ("flixel/img/debugger/buttons/statsDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/step.png", __ASSET__flixel_img_debugger_buttons_step_png);
		type.set ("flixel/img/debugger/buttons/step.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/stop.png", __ASSET__flixel_img_debugger_buttons_stop_png);
		type.set ("flixel/img/debugger/buttons/stop.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/watchDebug.png", __ASSET__flixel_img_debugger_buttons_watchdebug_png);
		type.set ("flixel/img/debugger/buttons/watchDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/flixel.png", __ASSET__flixel_img_debugger_flixel_png);
		type.set ("flixel/img/debugger/flixel.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/windowHandle.png", __ASSET__flixel_img_debugger_windowhandle_png);
		type.set ("flixel/img/debugger/windowHandle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/logo/default.png", __ASSET__flixel_img_logo_default_png);
		type.set ("flixel/img/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/logo/HaxeFlixel.svg", __ASSET__flixel_img_logo_haxeflixel_svg);
		type.set ("flixel/img/logo/HaxeFlixel.svg", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("flixel/img/logo/logo.png", __ASSET__flixel_img_logo_logo_png);
		type.set ("flixel/img/logo/logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/preloader/corners.png", __ASSET__flixel_img_preloader_corners_png);
		type.set ("flixel/img/preloader/corners.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/preloader/light.png", __ASSET__flixel_img_preloader_light_png);
		type.set ("flixel/img/preloader/light.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/tile/autotiles.png", __ASSET__flixel_img_tile_autotiles_png);
		type.set ("flixel/img/tile/autotiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/tile/autotiles_alt.png", __ASSET__flixel_img_tile_autotiles_alt_png);
		type.set ("flixel/img/tile/autotiles_alt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/analog/base.png", __ASSET__flixel_img_ui_analog_base_png);
		type.set ("flixel/img/ui/analog/base.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/analog/thumb.png", __ASSET__flixel_img_ui_analog_thumb_png);
		type.set ("flixel/img/ui/analog/thumb.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/button.png", __ASSET__flixel_img_ui_button_png);
		type.set ("flixel/img/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/cursor.png", __ASSET__flixel_img_ui_cursor_png);
		type.set ("flixel/img/ui/cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/fontData11pt.png", __ASSET__flixel_img_ui_fontdata11pt_png);
		type.set ("flixel/img/ui/fontData11pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/a.png", __ASSET__flixel_img_ui_virtualpad_a_png);
		type.set ("flixel/img/ui/virtualpad/a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/b.png", __ASSET__flixel_img_ui_virtualpad_b_png);
		type.set ("flixel/img/ui/virtualpad/b.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/c.png", __ASSET__flixel_img_ui_virtualpad_c_png);
		type.set ("flixel/img/ui/virtualpad/c.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/down.png", __ASSET__flixel_img_ui_virtualpad_down_png);
		type.set ("flixel/img/ui/virtualpad/down.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/left.png", __ASSET__flixel_img_ui_virtualpad_left_png);
		type.set ("flixel/img/ui/virtualpad/left.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/right.png", __ASSET__flixel_img_ui_virtualpad_right_png);
		type.set ("flixel/img/ui/virtualpad/right.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/up.png", __ASSET__flixel_img_ui_virtualpad_up_png);
		type.set ("flixel/img/ui/virtualpad/up.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/x.png", __ASSET__flixel_img_ui_virtualpad_x_png);
		type.set ("flixel/img/ui/virtualpad/x.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/y.png", __ASSET__flixel_img_ui_virtualpad_y_png);
		type.set ("flixel/img/ui/virtualpad/y.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/snd/beep.wav", __ASSET__flixel_snd_beep_wav);
		type.set ("flixel/snd/beep.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("flixel/snd/flixel.wav", __ASSET__flixel_snd_flixel_wav);
		type.set ("flixel/snd/flixel.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("flixel/img/napeDebug.png", __ASSET__flixel_img_napedebug_png);
		type.set ("flixel/img/napeDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/box.png", __ASSET__flixel_flixel_ui_img_box_png);
		type.set ("flixel/flixel-ui/img/box.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/button.png", __ASSET__flixel_flixel_ui_img_button_png);
		type.set ("flixel/flixel-ui/img/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/button_thin.png", __ASSET__flixel_flixel_ui_img_button_thin_png);
		type.set ("flixel/flixel-ui/img/button_thin.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/button_toggle.png", __ASSET__flixel_flixel_ui_img_button_toggle_png);
		type.set ("flixel/flixel-ui/img/button_toggle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/check_box.png", __ASSET__flixel_flixel_ui_img_check_box_png);
		type.set ("flixel/flixel-ui/img/check_box.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/check_mark.png", __ASSET__flixel_flixel_ui_img_check_mark_png);
		type.set ("flixel/flixel-ui/img/check_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/chrome.png", __ASSET__flixel_flixel_ui_img_chrome_png);
		type.set ("flixel/flixel-ui/img/chrome.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/chrome_flat.png", __ASSET__flixel_flixel_ui_img_chrome_flat_png);
		type.set ("flixel/flixel-ui/img/chrome_flat.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/chrome_inset.png", __ASSET__flixel_flixel_ui_img_chrome_inset_png);
		type.set ("flixel/flixel-ui/img/chrome_inset.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/dropdown_mark.png", __ASSET__flixel_flixel_ui_img_dropdown_mark_png);
		type.set ("flixel/flixel-ui/img/dropdown_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/hilight.png", __ASSET__flixel_flixel_ui_img_hilight_png);
		type.set ("flixel/flixel-ui/img/hilight.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/invis.png", __ASSET__flixel_flixel_ui_img_invis_png);
		type.set ("flixel/flixel-ui/img/invis.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/radio.png", __ASSET__flixel_flixel_ui_img_radio_png);
		type.set ("flixel/flixel-ui/img/radio.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/radio_dot.png", __ASSET__flixel_flixel_ui_img_radio_dot_png);
		type.set ("flixel/flixel-ui/img/radio_dot.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/tab.png", __ASSET__flixel_flixel_ui_img_tab_png);
		type.set ("flixel/flixel-ui/img/tab.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/tab_back.png", __ASSET__flixel_flixel_ui_img_tab_back_png);
		type.set ("flixel/flixel-ui/img/tab_back.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/xml/defaults.xml", __ASSET__flixel_flixel_ui_xml_defaults_xml);
		type.set ("flixel/flixel-ui/xml/defaults.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("flixel/flixel-ui/xml/default_popup.xml", __ASSET__flixel_flixel_ui_xml_default_popup_xml);
		type.set ("flixel/flixel-ui/xml/default_popup.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/glow-light.png", __ASSET__assets_data_glow_light_png);
		type.set ("assets/data/glow-light.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/fonts/vera.ttf", __ASSET__assets_fonts_vera_ttf);
		type.set ("assets/fonts/vera.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
		className.set ("assets/fonts/verab.ttf", __ASSET__assets_fonts_verab_ttf);
		type.set ("assets/fonts/verab.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
		className.set ("assets/fonts/verai.ttf", __ASSET__assets_fonts_verai_ttf);
		type.set ("assets/fonts/verai.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
		className.set ("assets/fonts/veraz.ttf", __ASSET__assets_fonts_veraz_ttf);
		type.set ("assets/fonts/veraz.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
		className.set ("assets/gfx/other/icon_party.png", __ASSET__assets_gfx_other_icon_party_png);
		type.set ("assets/gfx/other/icon_party.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/other/portrait_mane.png", __ASSET__assets_gfx_other_portrait_mane_png);
		type.set ("assets/gfx/other/portrait_mane.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/blue.png", __ASSET__assets_gfx_ui_buttons_blue_png);
		type.set ("assets/gfx/ui/buttons/blue.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/blue_back.png", __ASSET__assets_gfx_ui_buttons_blue_back_png);
		type.set ("assets/gfx/ui/buttons/blue_back.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/blue_back_over.png", __ASSET__assets_gfx_ui_buttons_blue_back_over_png);
		type.set ("assets/gfx/ui/buttons/blue_back_over.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/blue_over.png", __ASSET__assets_gfx_ui_buttons_blue_over_png);
		type.set ("assets/gfx/ui/buttons/blue_over.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/button_blue.png", __ASSET__assets_gfx_ui_buttons_button_blue_png);
		type.set ("assets/gfx/ui/buttons/button_blue.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/button_blue_toggle.png", __ASSET__assets_gfx_ui_buttons_button_blue_toggle_png);
		type.set ("assets/gfx/ui/buttons/button_blue_toggle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/button_confirmation_black.png", __ASSET__assets_gfx_ui_buttons_button_confirmation_black_png);
		type.set ("assets/gfx/ui/buttons/button_confirmation_black.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/button_confirmation_over.png", __ASSET__assets_gfx_ui_buttons_button_confirmation_over_png);
		type.set ("assets/gfx/ui/buttons/button_confirmation_over.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/button_confirmation_red_over.png", __ASSET__assets_gfx_ui_buttons_button_confirmation_red_over_png);
		type.set ("assets/gfx/ui/buttons/button_confirmation_red_over.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/button_confirmation_red_up.png", __ASSET__assets_gfx_ui_buttons_button_confirmation_red_up_png);
		type.set ("assets/gfx/ui/buttons/button_confirmation_red_up.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/button_confirmation_up.png", __ASSET__assets_gfx_ui_buttons_button_confirmation_up_png);
		type.set ("assets/gfx/ui/buttons/button_confirmation_up.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/button_gold.png", __ASSET__assets_gfx_ui_buttons_button_gold_png);
		type.set ("assets/gfx/ui/buttons/button_gold.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/button_gold_up.png", __ASSET__assets_gfx_ui_buttons_button_gold_up_png);
		type.set ("assets/gfx/ui/buttons/button_gold_up.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/button_grey.png", __ASSET__assets_gfx_ui_buttons_button_grey_png);
		type.set ("assets/gfx/ui/buttons/button_grey.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/button_red.png", __ASSET__assets_gfx_ui_buttons_button_red_png);
		type.set ("assets/gfx/ui/buttons/button_red.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/gold.png", __ASSET__assets_gfx_ui_buttons_gold_png);
		type.set ("assets/gfx/ui/buttons/gold.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/gold_over.png", __ASSET__assets_gfx_ui_buttons_gold_over_png);
		type.set ("assets/gfx/ui/buttons/gold_over.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/grey.png", __ASSET__assets_gfx_ui_buttons_grey_png);
		type.set ("assets/gfx/ui/buttons/grey.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/grey_over.png", __ASSET__assets_gfx_ui_buttons_grey_over_png);
		type.set ("assets/gfx/ui/buttons/grey_over.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/red.png", __ASSET__assets_gfx_ui_buttons_red_png);
		type.set ("assets/gfx/ui/buttons/red.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/red_over.png", __ASSET__assets_gfx_ui_buttons_red_over_png);
		type.set ("assets/gfx/ui/buttons/red_over.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/tab_grey.png", __ASSET__assets_gfx_ui_buttons_tab_grey_png);
		type.set ("assets/gfx/ui/buttons/tab_grey.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/tab_grey_back.png", __ASSET__assets_gfx_ui_buttons_tab_grey_back_png);
		type.set ("assets/gfx/ui/buttons/tab_grey_back.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/tab_grey_back_over.png", __ASSET__assets_gfx_ui_buttons_tab_grey_back_over_png);
		type.set ("assets/gfx/ui/buttons/tab_grey_back_over.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/buttons/tab_grey_over.png", __ASSET__assets_gfx_ui_buttons_tab_grey_over_png);
		type.set ("assets/gfx/ui/buttons/tab_grey_over.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/chrome/dark_grey.png", __ASSET__assets_gfx_ui_chrome_dark_grey_png);
		type.set ("assets/gfx/ui/chrome/dark_grey.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/chrome/dark_grey_flat_top.png", __ASSET__assets_gfx_ui_chrome_dark_grey_flat_top_png);
		type.set ("assets/gfx/ui/chrome/dark_grey_flat_top.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/chrome/dark_grey_inset.png", __ASSET__assets_gfx_ui_chrome_dark_grey_inset_png);
		type.set ("assets/gfx/ui/chrome/dark_grey_inset.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/chrome/dark_grey_texture.png", __ASSET__assets_gfx_ui_chrome_dark_grey_texture_png);
		type.set ("assets/gfx/ui/chrome/dark_grey_texture.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/misc/check_big.png", __ASSET__assets_gfx_ui_misc_check_big_png);
		type.set ("assets/gfx/ui/misc/check_big.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/misc/check_box_big.png", __ASSET__assets_gfx_ui_misc_check_box_big_png);
		type.set ("assets/gfx/ui/misc/check_box_big.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/misc/check_box_small.png", __ASSET__assets_gfx_ui_misc_check_box_small_png);
		type.set ("assets/gfx/ui/misc/check_box_small.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/misc/check_small.png", __ASSET__assets_gfx_ui_misc_check_small_png);
		type.set ("assets/gfx/ui/misc/check_small.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/misc/flag_blank.png", __ASSET__assets_gfx_ui_misc_flag_blank_png);
		type.set ("assets/gfx/ui/misc/flag_blank.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/misc/health_bar.png", __ASSET__assets_gfx_ui_misc_health_bar_png);
		type.set ("assets/gfx/ui/misc/health_bar.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/misc/mana_bar.png", __ASSET__assets_gfx_ui_misc_mana_bar_png);
		type.set ("assets/gfx/ui/misc/mana_bar.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/misc/radio.png", __ASSET__assets_gfx_ui_misc_radio_png);
		type.set ("assets/gfx/ui/misc/radio.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/misc/radio_dot.png", __ASSET__assets_gfx_ui_misc_radio_dot_png);
		type.set ("assets/gfx/ui/misc/radio_dot.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/saveslot.png", __ASSET__assets_gfx_ui_saveslot_png);
		type.set ("assets/gfx/ui/saveslot.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/saveslot_shadow.png", __ASSET__assets_gfx_ui_saveslot_shadow_png);
		type.set ("assets/gfx/ui/saveslot_shadow.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/save_menu_overlay.png", __ASSET__assets_gfx_ui_save_menu_overlay_png);
		type.set ("assets/gfx/ui/save_menu_overlay.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/gfx/ui/title_back.png", __ASSET__assets_gfx_ui_title_back_png);
		type.set ("assets/gfx/ui/title_back.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/HaxeFlixel.svg", __ASSET__assets_haxeflixel_svg);
		type.set ("assets/HaxeFlixel.svg", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/locales/en-US/fonts.xml", __ASSET__assets_locales_en_us_fonts_xml);
		type.set ("assets/locales/en-US/fonts.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/locales/en-US/ui.csv", __ASSET__assets_locales_en_us_ui_csv);
		type.set ("assets/locales/en-US/ui.csv", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/locales/index.xml", __ASSET__assets_locales_index_xml);
		type.set ("assets/locales/index.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/locales/nb-NO/fonts.xml", __ASSET__assets_locales_nb_no_fonts_xml);
		type.set ("assets/locales/nb-NO/fonts.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/locales/nb-NO/ui.csv", __ASSET__assets_locales_nb_no_ui_csv);
		type.set ("assets/locales/nb-NO/ui.csv", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/locales/_flags/cs-CZ.png", __ASSET__assets_locales__flags_cs_cz_png);
		type.set ("assets/locales/_flags/cs-CZ.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/locales/_flags/de-DE.png", __ASSET__assets_locales__flags_de_de_png);
		type.set ("assets/locales/_flags/de-DE.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/locales/_flags/en-CA.png", __ASSET__assets_locales__flags_en_ca_png);
		type.set ("assets/locales/_flags/en-CA.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/locales/_flags/en-GB.png", __ASSET__assets_locales__flags_en_gb_png);
		type.set ("assets/locales/_flags/en-GB.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/locales/_flags/en-US.png", __ASSET__assets_locales__flags_en_us_png);
		type.set ("assets/locales/_flags/en-US.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/locales/_flags/es-ES.png", __ASSET__assets_locales__flags_es_es_png);
		type.set ("assets/locales/_flags/es-ES.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/locales/_flags/fr-FR.png", __ASSET__assets_locales__flags_fr_fr_png);
		type.set ("assets/locales/_flags/fr-FR.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/locales/_flags/it-IT.png", __ASSET__assets_locales__flags_it_it_png);
		type.set ("assets/locales/_flags/it-IT.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/locales/_flags/ja-JP.png", __ASSET__assets_locales__flags_ja_jp_png);
		type.set ("assets/locales/_flags/ja-JP.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/locales/_flags/ko-KR.png", __ASSET__assets_locales__flags_ko_kr_png);
		type.set ("assets/locales/_flags/ko-KR.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/locales/_flags/nb-NO.png", __ASSET__assets_locales__flags_nb_no_png);
		type.set ("assets/locales/_flags/nb-NO.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/locales/_flags/pl-PL.png", __ASSET__assets_locales__flags_pl_pl_png);
		type.set ("assets/locales/_flags/pl-PL.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/locales/_flags/yo-DA.png", __ASSET__assets_locales__flags_yo_da_png);
		type.set ("assets/locales/_flags/yo-DA.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/menu/border.png", __ASSET__assets_menu_border_png);
		type.set ("assets/menu/border.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/menu/cursor.png", __ASSET__assets_menu_cursor_png);
		type.set ("assets/menu/cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/menu/logos.png", __ASSET__assets_menu_logos_png);
		type.set ("assets/menu/logos.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/menu/version.png", __ASSET__assets_menu_version_png);
		type.set ("assets/menu/version.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/arms/p_arm_idle.png", __ASSET__assets_sprite_boy_arms_p_arm_idle_png);
		type.set ("assets/sprite/boy/arms/p_arm_idle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/arms/p_arm_idle_a.png", __ASSET__assets_sprite_boy_arms_p_arm_idle_a_png);
		type.set ("assets/sprite/boy/arms/p_arm_idle_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/arms/p_arm_slide_0.png", __ASSET__assets_sprite_boy_arms_p_arm_slide_0_png);
		type.set ("assets/sprite/boy/arms/p_arm_slide_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/arms/p_arm_throw_0.png", __ASSET__assets_sprite_boy_arms_p_arm_throw_0_png);
		type.set ("assets/sprite/boy/arms/p_arm_throw_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/arms/p_arm_walk.png", __ASSET__assets_sprite_boy_arms_p_arm_walk_png);
		type.set ("assets/sprite/boy/arms/p_arm_walk.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/arms/p_forarm_idle_0.png", __ASSET__assets_sprite_boy_arms_p_forarm_idle_0_png);
		type.set ("assets/sprite/boy/arms/p_forarm_idle_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/arms/p_forarm_idle_a.png", __ASSET__assets_sprite_boy_arms_p_forarm_idle_a_png);
		type.set ("assets/sprite/boy/arms/p_forarm_idle_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/arms/p_forarm_jump_0.png", __ASSET__assets_sprite_boy_arms_p_forarm_jump_0_png);
		type.set ("assets/sprite/boy/arms/p_forarm_jump_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/arms/p_forarm_side_0.png", __ASSET__assets_sprite_boy_arms_p_forarm_side_0_png);
		type.set ("assets/sprite/boy/arms/p_forarm_side_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/arms/p_forarm_under_0.png", __ASSET__assets_sprite_boy_arms_p_forarm_under_0_png);
		type.set ("assets/sprite/boy/arms/p_forarm_under_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/arms/p_forarm_walk_a.png", __ASSET__assets_sprite_boy_arms_p_forarm_walk_a_png);
		type.set ("assets/sprite/boy/arms/p_forarm_walk_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/arms/throw_blur_0.png", __ASSET__assets_sprite_boy_arms_throw_blur_0_png);
		type.set ("assets/sprite/boy/arms/throw_blur_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/feet/p_foot_hit_a.png", __ASSET__assets_sprite_boy_feet_p_foot_hit_a_png);
		type.set ("assets/sprite/boy/feet/p_foot_hit_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/feet/p_foot_hot_0.png", __ASSET__assets_sprite_boy_feet_p_foot_hot_0_png);
		type.set ("assets/sprite/boy/feet/p_foot_hot_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/feet/p_foot_idle_0.png", __ASSET__assets_sprite_boy_feet_p_foot_idle_0_png);
		type.set ("assets/sprite/boy/feet/p_foot_idle_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/feet/p_foot_jump_0.png", __ASSET__assets_sprite_boy_feet_p_foot_jump_0_png);
		type.set ("assets/sprite/boy/feet/p_foot_jump_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/feet/p_foot_walk_0.png", __ASSET__assets_sprite_boy_feet_p_foot_walk_0_png);
		type.set ("assets/sprite/boy/feet/p_foot_walk_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/feet/p_foot_walk_a.png", __ASSET__assets_sprite_boy_feet_p_foot_walk_a_png);
		type.set ("assets/sprite/boy/feet/p_foot_walk_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/first.scml", __ASSET__assets_sprite_boy_first_scml);
		type.set ("assets/sprite/boy/first.scml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_1.png", __ASSET__assets_sprite_boy_hands_p_hand_1_png);
		type.set ("assets/sprite/boy/hands/p_hand_1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_2.png", __ASSET__assets_sprite_boy_hands_p_hand_2_png);
		type.set ("assets/sprite/boy/hands/p_hand_2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_a.png", __ASSET__assets_sprite_boy_hands_p_hand_a_png);
		type.set ("assets/sprite/boy/hands/p_hand_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_a_edge.png", __ASSET__assets_sprite_boy_hands_p_hand_a_edge_png);
		type.set ("assets/sprite/boy/hands/p_hand_a_edge.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_b.png", __ASSET__assets_sprite_boy_hands_p_hand_b_png);
		type.set ("assets/sprite/boy/hands/p_hand_b.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_c.png", __ASSET__assets_sprite_boy_hands_p_hand_c_png);
		type.set ("assets/sprite/boy/hands/p_hand_c.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_edge_0.png", __ASSET__assets_sprite_boy_hands_p_hand_edge_0_png);
		type.set ("assets/sprite/boy/hands/p_hand_edge_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_float_0.png", __ASSET__assets_sprite_boy_hands_p_hand_float_0_png);
		type.set ("assets/sprite/boy/hands/p_hand_float_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_hang_0.png", __ASSET__assets_sprite_boy_hands_p_hand_hang_0_png);
		type.set ("assets/sprite/boy/hands/p_hand_hang_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_hang_1.png", __ASSET__assets_sprite_boy_hands_p_hand_hang_1_png);
		type.set ("assets/sprite/boy/hands/p_hand_hang_1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_hang_a.png", __ASSET__assets_sprite_boy_hands_p_hand_hang_a_png);
		type.set ("assets/sprite/boy/hands/p_hand_hang_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_hit_0.png", __ASSET__assets_sprite_boy_hands_p_hand_hit_0_png);
		type.set ("assets/sprite/boy/hands/p_hand_hit_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_hit_a.png", __ASSET__assets_sprite_boy_hands_p_hand_hit_a_png);
		type.set ("assets/sprite/boy/hands/p_hand_hit_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_idle_0.png", __ASSET__assets_sprite_boy_hands_p_hand_idle_0_png);
		type.set ("assets/sprite/boy/hands/p_hand_idle_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_jump_0.png", __ASSET__assets_sprite_boy_hands_p_hand_jump_0_png);
		type.set ("assets/sprite/boy/hands/p_hand_jump_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_jump_a.png", __ASSET__assets_sprite_boy_hands_p_hand_jump_a_png);
		type.set ("assets/sprite/boy/hands/p_hand_jump_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_prepunch_0.png", __ASSET__assets_sprite_boy_hands_p_hand_prepunch_0_png);
		type.set ("assets/sprite/boy/hands/p_hand_prepunch_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_prepunch_x.png", __ASSET__assets_sprite_boy_hands_p_hand_prepunch_x_png);
		type.set ("assets/sprite/boy/hands/p_hand_prepunch_x.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_punch_0.png", __ASSET__assets_sprite_boy_hands_p_hand_punch_0_png);
		type.set ("assets/sprite/boy/hands/p_hand_punch_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_push_0.png", __ASSET__assets_sprite_boy_hands_p_hand_push_0_png);
		type.set ("assets/sprite/boy/hands/p_hand_push_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_push_a.png", __ASSET__assets_sprite_boy_hands_p_hand_push_a_png);
		type.set ("assets/sprite/boy/hands/p_hand_push_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_slide_0.png", __ASSET__assets_sprite_boy_hands_p_hand_slide_0_png);
		type.set ("assets/sprite/boy/hands/p_hand_slide_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_hand_throw_0.png", __ASSET__assets_sprite_boy_hands_p_hand_throw_0_png);
		type.set ("assets/sprite/boy/hands/p_hand_throw_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/hands/p_punch_blur.png", __ASSET__assets_sprite_boy_hands_p_punch_blur_png);
		type.set ("assets/sprite/boy/hands/p_punch_blur.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/head/p_head_blink_0.png", __ASSET__assets_sprite_boy_head_p_head_blink_0_png);
		type.set ("assets/sprite/boy/head/p_head_blink_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/head/p_head_blink_1.png", __ASSET__assets_sprite_boy_head_p_head_blink_1_png);
		type.set ("assets/sprite/boy/head/p_head_blink_1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/head/p_head_concern.png", __ASSET__assets_sprite_boy_head_p_head_concern_png);
		type.set ("assets/sprite/boy/head/p_head_concern.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/head/p_head_concern_blink_0.png", __ASSET__assets_sprite_boy_head_p_head_concern_blink_0_png);
		type.set ("assets/sprite/boy/head/p_head_concern_blink_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/head/p_head_concern_blink_1.png", __ASSET__assets_sprite_boy_head_p_head_concern_blink_1_png);
		type.set ("assets/sprite/boy/head/p_head_concern_blink_1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/head/p_head_die.png", __ASSET__assets_sprite_boy_head_p_head_die_png);
		type.set ("assets/sprite/boy/head/p_head_die.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/head/p_head_hurt.png", __ASSET__assets_sprite_boy_head_p_head_hurt_png);
		type.set ("assets/sprite/boy/head/p_head_hurt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/head/p_head_idle.png", __ASSET__assets_sprite_boy_head_p_head_idle_png);
		type.set ("assets/sprite/boy/head/p_head_idle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/head/p_head_idle_blink_0.png", __ASSET__assets_sprite_boy_head_p_head_idle_blink_0_png);
		type.set ("assets/sprite/boy/head/p_head_idle_blink_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/head/p_head_idle_blink_1.png", __ASSET__assets_sprite_boy_head_p_head_idle_blink_1_png);
		type.set ("assets/sprite/boy/head/p_head_idle_blink_1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/head/p_head_push.png", __ASSET__assets_sprite_boy_head_p_head_push_png);
		type.set ("assets/sprite/boy/head/p_head_push.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/head/p_head_turn_0.png", __ASSET__assets_sprite_boy_head_p_head_turn_0_png);
		type.set ("assets/sprite/boy/head/p_head_turn_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/head/p_head_walk.png", __ASSET__assets_sprite_boy_head_p_head_walk_png);
		type.set ("assets/sprite/boy/head/p_head_walk.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/legs/p_leg_a.png", __ASSET__assets_sprite_boy_legs_p_leg_a_png);
		type.set ("assets/sprite/boy/legs/p_leg_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/legs/p_leg_idle_0.png", __ASSET__assets_sprite_boy_legs_p_leg_idle_0_png);
		type.set ("assets/sprite/boy/legs/p_leg_idle_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/legs/p_leg_walk_0.png", __ASSET__assets_sprite_boy_legs_p_leg_walk_0_png);
		type.set ("assets/sprite/boy/legs/p_leg_walk_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/legs/p_pelvis_die.png", __ASSET__assets_sprite_boy_legs_p_pelvis_die_png);
		type.set ("assets/sprite/boy/legs/p_pelvis_die.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/legs/p_pelvis_idle.png", __ASSET__assets_sprite_boy_legs_p_pelvis_idle_png);
		type.set ("assets/sprite/boy/legs/p_pelvis_idle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/legs/p_pelvis_walk.png", __ASSET__assets_sprite_boy_legs_p_pelvis_walk_png);
		type.set ("assets/sprite/boy/legs/p_pelvis_walk.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/legs/p_thigh_a.png", __ASSET__assets_sprite_boy_legs_p_thigh_a_png);
		type.set ("assets/sprite/boy/legs/p_thigh_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/legs/p_thigh_idle_0.png", __ASSET__assets_sprite_boy_legs_p_thigh_idle_0_png);
		type.set ("assets/sprite/boy/legs/p_thigh_idle_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/legs/p_thigh_walk_0.png", __ASSET__assets_sprite_boy_legs_p_thigh_walk_0_png);
		type.set ("assets/sprite/boy/legs/p_thigh_walk_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/torso/p_torso_front.png", __ASSET__assets_sprite_boy_torso_p_torso_front_png);
		type.set ("assets/sprite/boy/torso/p_torso_front.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/torso/p_torso_idle.png", __ASSET__assets_sprite_boy_torso_p_torso_idle_png);
		type.set ("assets/sprite/boy/torso/p_torso_idle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/torso/p_torso_jump.png", __ASSET__assets_sprite_boy_torso_p_torso_jump_png);
		type.set ("assets/sprite/boy/torso/p_torso_jump.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/torso/p_torso_punch_0.png", __ASSET__assets_sprite_boy_torso_p_torso_punch_0_png);
		type.set ("assets/sprite/boy/torso/p_torso_punch_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/boy/torso/p_torso_walk.png", __ASSET__assets_sprite_boy_torso_p_torso_walk_png);
		type.set ("assets/sprite/boy/torso/p_torso_walk.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/brawler/brawler.scml", __ASSET__assets_sprite_brawler_brawler_scml);
		type.set ("assets/sprite/brawler/brawler.scml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/sprite/brawler/Brawler_flats_backhand.png", __ASSET__assets_sprite_brawler_brawler_flats_backhand_png);
		type.set ("assets/sprite/brawler/Brawler_flats_backhand.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/brawler/Brawler_flats_bigfoot.png", __ASSET__assets_sprite_brawler_brawler_flats_bigfoot_png);
		type.set ("assets/sprite/brawler/Brawler_flats_bigfoot.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/brawler/Brawler_flats_body.png", __ASSET__assets_sprite_brawler_brawler_flats_body_png);
		type.set ("assets/sprite/brawler/Brawler_flats_body.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/brawler/Brawler_flats_fronthand.png", __ASSET__assets_sprite_brawler_brawler_flats_fronthand_png);
		type.set ("assets/sprite/brawler/Brawler_flats_fronthand.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/brawler/Brawler_flats_headclose.png", __ASSET__assets_sprite_brawler_brawler_flats_headclose_png);
		type.set ("assets/sprite/brawler/Brawler_flats_headclose.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/brawler/Brawler_flats_headopen.png", __ASSET__assets_sprite_brawler_brawler_flats_headopen_png);
		type.set ("assets/sprite/brawler/Brawler_flats_headopen.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/brawler/Brawler_flats_smallfoot.png", __ASSET__assets_sprite_brawler_brawler_flats_smallfoot_png);
		type.set ("assets/sprite/brawler/Brawler_flats_smallfoot.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/bullet.png", __ASSET__assets_sprite_bullet_png);
		type.set ("assets/sprite/bullet.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/creature/gorilla.png", __ASSET__assets_sprite_creature_gorilla_png);
		type.set ("assets/sprite/creature/gorilla.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/elevator.png", __ASSET__assets_sprite_elevator_png);
		type.set ("assets/sprite/elevator.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/material.png", __ASSET__assets_sprite_material_png);
		type.set ("assets/sprite/material.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/materialicon.png", __ASSET__assets_sprite_materialicon_png);
		type.set ("assets/sprite/materialicon.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/npc/gorilla.png", __ASSET__assets_sprite_npc_gorilla_png);
		type.set ("assets/sprite/npc/gorilla.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/npc/master.png", __ASSET__assets_sprite_npc_master_png);
		type.set ("assets/sprite/npc/master.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/player/body.png", __ASSET__assets_sprite_player_body_png);
		type.set ("assets/sprite/player/body.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/player/header.png", __ASSET__assets_sprite_player_header_png);
		type.set ("assets/sprite/player/header.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/player/lowerarm.png", __ASSET__assets_sprite_player_lowerarm_png);
		type.set ("assets/sprite/player/lowerarm.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/player/lowerleg.png", __ASSET__assets_sprite_player_lowerleg_png);
		type.set ("assets/sprite/player/lowerleg.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/player/upperarm.png", __ASSET__assets_sprite_player_upperarm_png);
		type.set ("assets/sprite/player/upperarm.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/player/upperleg.png", __ASSET__assets_sprite_player_upperleg_png);
		type.set ("assets/sprite/player/upperleg.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/player/weapon.png", __ASSET__assets_sprite_player_weapon_png);
		type.set ("assets/sprite/player/weapon.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/test/armdown_l.png", __ASSET__assets_sprite_test_armdown_l_png);
		type.set ("assets/sprite/test/armdown_l.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/test/armdown_r.png", __ASSET__assets_sprite_test_armdown_r_png);
		type.set ("assets/sprite/test/armdown_r.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/test/armup_l.png", __ASSET__assets_sprite_test_armup_l_png);
		type.set ("assets/sprite/test/armup_l.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/test/armup_r.png", __ASSET__assets_sprite_test_armup_r_png);
		type.set ("assets/sprite/test/armup_r.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/test/body.png", __ASSET__assets_sprite_test_body_png);
		type.set ("assets/sprite/test/body.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/test/body_1.png", __ASSET__assets_sprite_test_body_1_png);
		type.set ("assets/sprite/test/body_1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/test/first.scml", __ASSET__assets_sprite_test_first_scml);
		type.set ("assets/sprite/test/first.scml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/sprite/test/foot_l.png", __ASSET__assets_sprite_test_foot_l_png);
		type.set ("assets/sprite/test/foot_l.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/test/foot_r.png", __ASSET__assets_sprite_test_foot_r_png);
		type.set ("assets/sprite/test/foot_r.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/test/gun.png", __ASSET__assets_sprite_test_gun_png);
		type.set ("assets/sprite/test/gun.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/test/head.png", __ASSET__assets_sprite_test_head_png);
		type.set ("assets/sprite/test/head.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/test/hoe.png", __ASSET__assets_sprite_test_hoe_png);
		type.set ("assets/sprite/test/hoe.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/test/legdown_l.png", __ASSET__assets_sprite_test_legdown_l_png);
		type.set ("assets/sprite/test/legdown_l.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/test/legdown_r.png", __ASSET__assets_sprite_test_legdown_r_png);
		type.set ("assets/sprite/test/legdown_r.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/test/legup_l.png", __ASSET__assets_sprite_test_legup_l_png);
		type.set ("assets/sprite/test/legup_l.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/test/legup_r.png", __ASSET__assets_sprite_test_legup_r_png);
		type.set ("assets/sprite/test/legup_r.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/test/sword.png", __ASSET__assets_sprite_test_sword_png);
		type.set ("assets/sprite/test/sword.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/test/tool.png", __ASSET__assets_sprite_test_tool_png);
		type.set ("assets/sprite/test/tool.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/thrust_ship.png", __ASSET__assets_sprite_thrust_ship_png);
		type.set ("assets/sprite/thrust_ship.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sprite/tree.png", __ASSET__assets_sprite_tree_png);
		type.set ("assets/sprite/tree.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/tiled/backdrop.png", __ASSET__assets_tiled_backdrop_png);
		type.set ("assets/tiled/backdrop.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/tiled/backdropMini.png", __ASSET__assets_tiled_backdropmini_png);
		type.set ("assets/tiled/backdropMini.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/tiled/coin.png", __ASSET__assets_tiled_coin_png);
		type.set ("assets/tiled/coin.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/tiled/level.png", __ASSET__assets_tiled_level_png);
		type.set ("assets/tiled/level.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/tiled/level.tmx", __ASSET__assets_tiled_level_tmx);
		type.set ("assets/tiled/level.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/tiled/mapCSV_Group1_background.csv", __ASSET__assets_tiled_mapcsv_group1_background_csv);
		type.set ("assets/tiled/mapCSV_Group1_background.csv", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/tiled/mapCSV_Group1_Map1.csv", __ASSET__assets_tiled_mapcsv_group1_map1_csv);
		type.set ("assets/tiled/mapCSV_Group1_Map1.csv", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/tiled/mapCSV_Group1_tiled.csv", __ASSET__assets_tiled_mapcsv_group1_tiled_csv);
		type.set ("assets/tiled/mapCSV_Group1_tiled.csv", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/tiled/miniPlanet.png", __ASSET__assets_tiled_miniplanet_png);
		type.set ("assets/tiled/miniPlanet.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/tiled/planet.dam", __ASSET__assets_tiled_planet_dam);
		type.set ("assets/tiled/planet.dam", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/tiled/planet.dam.bak", __ASSET__assets_tiled_planet_dam_bak);
		type.set ("assets/tiled/planet.dam.bak", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/tiled/planet.png", __ASSET__assets_tiled_planet_png);
		type.set ("assets/tiled/planet.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/tiled/point.dam", __ASSET__assets_tiled_point_dam);
		type.set ("assets/tiled/point.dam", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/tiled/point.dam.bak", __ASSET__assets_tiled_point_dam_bak);
		type.set ("assets/tiled/point.dam.bak", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/tiled/point.png", __ASSET__assets_tiled_point_png);
		type.set ("assets/tiled/point.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/tiled/pointMini.png", __ASSET__assets_tiled_pointmini_png);
		type.set ("assets/tiled/pointMini.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/tiled/tiles.png", __ASSET__assets_tiled_tiles_png);
		type.set ("assets/tiled/tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/tiled/waterTest.txt", __ASSET__assets_tiled_watertest_txt);
		type.set ("assets/tiled/waterTest.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/ui/dialog_box.png", __ASSET__assets_ui_dialog_box_png);
		type.set ("assets/ui/dialog_box.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/ui/inventory.png", __ASSET__assets_ui_inventory_png);
		type.set ("assets/ui/inventory.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/ui/sign.png", __ASSET__assets_ui_sign_png);
		type.set ("assets/ui/sign.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/xml/play.xml", __ASSET__assets_xml_play_xml);
		type.set ("assets/xml/play.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/xml/popup_demo.xml", __ASSET__assets_xml_popup_demo_xml);
		type.set ("assets/xml/popup_demo.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/xml/popup_simple.xml", __ASSET__assets_xml_popup_simple_xml);
		type.set ("assets/xml/popup_simple.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/xml/state_battle.xml", __ASSET__assets_xml_state_battle_xml);
		type.set ("assets/xml/state_battle.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/xml/state_default.xml", __ASSET__assets_xml_state_default_xml);
		type.set ("assets/xml/state_default.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/xml/state_menu.xml", __ASSET__assets_xml_state_menu_xml);
		type.set ("assets/xml/state_menu.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/xml/state_save.xml", __ASSET__assets_xml_state_save_xml);
		type.set ("assets/xml/state_save.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/xml/state_title.xml", __ASSET__assets_xml_state_title_xml);
		type.set ("assets/xml/state_title.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/xml/_ui_globals.xml", __ASSET__assets_xml__ui_globals_xml);
		type.set ("assets/xml/_ui_globals.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		
		
		#elseif html5
		
		addExternal("flixel/img/debugger/buttons/console.png", "image", "flixel/img/debugger/buttons/console.png");
		addExternal("flixel/img/debugger/buttons/drawDebug.png", "image", "flixel/img/debugger/buttons/drawDebug.png");
		addExternal("flixel/img/debugger/buttons/logDebug.png", "image", "flixel/img/debugger/buttons/logDebug.png");
		addExternal("flixel/img/debugger/buttons/open.png", "image", "flixel/img/debugger/buttons/open.png");
		addExternal("flixel/img/debugger/buttons/pause.png", "image", "flixel/img/debugger/buttons/pause.png");
		addExternal("flixel/img/debugger/buttons/play.png", "image", "flixel/img/debugger/buttons/play.png");
		addExternal("flixel/img/debugger/buttons/record_off.png", "image", "flixel/img/debugger/buttons/record_off.png");
		addExternal("flixel/img/debugger/buttons/record_on.png", "image", "flixel/img/debugger/buttons/record_on.png");
		addExternal("flixel/img/debugger/buttons/restart.png", "image", "flixel/img/debugger/buttons/restart.png");
		addExternal("flixel/img/debugger/buttons/statsDebug.png", "image", "flixel/img/debugger/buttons/statsDebug.png");
		addExternal("flixel/img/debugger/buttons/step.png", "image", "flixel/img/debugger/buttons/step.png");
		addExternal("flixel/img/debugger/buttons/stop.png", "image", "flixel/img/debugger/buttons/stop.png");
		addExternal("flixel/img/debugger/buttons/watchDebug.png", "image", "flixel/img/debugger/buttons/watchDebug.png");
		addExternal("flixel/img/debugger/flixel.png", "image", "flixel/img/debugger/flixel.png");
		addExternal("flixel/img/debugger/windowHandle.png", "image", "flixel/img/debugger/windowHandle.png");
		addExternal("flixel/img/logo/default.png", "image", "flixel/img/logo/default.png");
		addExternal("flixel/img/logo/HaxeFlixel.svg", "text", "flixel/img/logo/HaxeFlixel.svg");
		addExternal("flixel/img/logo/logo.png", "image", "flixel/img/logo/logo.png");
		addExternal("flixel/img/preloader/corners.png", "image", "flixel/img/preloader/corners.png");
		addExternal("flixel/img/preloader/light.png", "image", "flixel/img/preloader/light.png");
		addExternal("flixel/img/tile/autotiles.png", "image", "flixel/img/tile/autotiles.png");
		addExternal("flixel/img/tile/autotiles_alt.png", "image", "flixel/img/tile/autotiles_alt.png");
		addExternal("flixel/img/ui/analog/base.png", "image", "flixel/img/ui/analog/base.png");
		addExternal("flixel/img/ui/analog/thumb.png", "image", "flixel/img/ui/analog/thumb.png");
		addExternal("flixel/img/ui/button.png", "image", "flixel/img/ui/button.png");
		addExternal("flixel/img/ui/cursor.png", "image", "flixel/img/ui/cursor.png");
		addExternal("flixel/img/ui/fontData11pt.png", "image", "flixel/img/ui/fontData11pt.png");
		addExternal("flixel/img/ui/virtualpad/a.png", "image", "flixel/img/ui/virtualpad/a.png");
		addExternal("flixel/img/ui/virtualpad/b.png", "image", "flixel/img/ui/virtualpad/b.png");
		addExternal("flixel/img/ui/virtualpad/c.png", "image", "flixel/img/ui/virtualpad/c.png");
		addExternal("flixel/img/ui/virtualpad/down.png", "image", "flixel/img/ui/virtualpad/down.png");
		addExternal("flixel/img/ui/virtualpad/left.png", "image", "flixel/img/ui/virtualpad/left.png");
		addExternal("flixel/img/ui/virtualpad/right.png", "image", "flixel/img/ui/virtualpad/right.png");
		addExternal("flixel/img/ui/virtualpad/up.png", "image", "flixel/img/ui/virtualpad/up.png");
		addExternal("flixel/img/ui/virtualpad/x.png", "image", "flixel/img/ui/virtualpad/x.png");
		addExternal("flixel/img/ui/virtualpad/y.png", "image", "flixel/img/ui/virtualpad/y.png");
		addExternal("flixel/snd/beep.wav", "sound", "flixel/snd/beep.wav");
		addExternal("flixel/snd/flixel.wav", "sound", "flixel/snd/flixel.wav");
		addExternal("flixel/img/napeDebug.png", "image", "flixel/img/napeDebug.png");
		addExternal("flixel/flixel-ui/img/box.png", "image", "flixel/flixel-ui/img/box.png");
		addExternal("flixel/flixel-ui/img/button.png", "image", "flixel/flixel-ui/img/button.png");
		addExternal("flixel/flixel-ui/img/button_thin.png", "image", "flixel/flixel-ui/img/button_thin.png");
		addExternal("flixel/flixel-ui/img/button_toggle.png", "image", "flixel/flixel-ui/img/button_toggle.png");
		addExternal("flixel/flixel-ui/img/check_box.png", "image", "flixel/flixel-ui/img/check_box.png");
		addExternal("flixel/flixel-ui/img/check_mark.png", "image", "flixel/flixel-ui/img/check_mark.png");
		addExternal("flixel/flixel-ui/img/chrome.png", "image", "flixel/flixel-ui/img/chrome.png");
		addExternal("flixel/flixel-ui/img/chrome_flat.png", "image", "flixel/flixel-ui/img/chrome_flat.png");
		addExternal("flixel/flixel-ui/img/chrome_inset.png", "image", "flixel/flixel-ui/img/chrome_inset.png");
		addExternal("flixel/flixel-ui/img/dropdown_mark.png", "image", "flixel/flixel-ui/img/dropdown_mark.png");
		addExternal("flixel/flixel-ui/img/hilight.png", "image", "flixel/flixel-ui/img/hilight.png");
		addExternal("flixel/flixel-ui/img/invis.png", "image", "flixel/flixel-ui/img/invis.png");
		addExternal("flixel/flixel-ui/img/radio.png", "image", "flixel/flixel-ui/img/radio.png");
		addExternal("flixel/flixel-ui/img/radio_dot.png", "image", "flixel/flixel-ui/img/radio_dot.png");
		addExternal("flixel/flixel-ui/img/tab.png", "image", "flixel/flixel-ui/img/tab.png");
		addExternal("flixel/flixel-ui/img/tab_back.png", "image", "flixel/flixel-ui/img/tab_back.png");
		addExternal("flixel/flixel-ui/xml/defaults.xml", "text", "flixel/flixel-ui/xml/defaults.xml");
		addExternal("flixel/flixel-ui/xml/default_popup.xml", "text", "flixel/flixel-ui/xml/default_popup.xml");
		addExternal("assets/data/glow-light.png", "image", "assets/data/glow-light.png");
		addEmbed("assets/fonts/vera.ttf", "font", __ASSET__assets_fonts_vera_ttf);
		addEmbed("assets/fonts/verab.ttf", "font", __ASSET__assets_fonts_verab_ttf);
		addEmbed("assets/fonts/verai.ttf", "font", __ASSET__assets_fonts_verai_ttf);
		addEmbed("assets/fonts/veraz.ttf", "font", __ASSET__assets_fonts_veraz_ttf);
		addExternal("assets/gfx/other/icon_party.png", "image", "assets/gfx/other/icon_party.png");
		addExternal("assets/gfx/other/portrait_mane.png", "image", "assets/gfx/other/portrait_mane.png");
		addExternal("assets/gfx/ui/buttons/blue.png", "image", "assets/gfx/ui/buttons/blue.png");
		addExternal("assets/gfx/ui/buttons/blue_back.png", "image", "assets/gfx/ui/buttons/blue_back.png");
		addExternal("assets/gfx/ui/buttons/blue_back_over.png", "image", "assets/gfx/ui/buttons/blue_back_over.png");
		addExternal("assets/gfx/ui/buttons/blue_over.png", "image", "assets/gfx/ui/buttons/blue_over.png");
		addExternal("assets/gfx/ui/buttons/button_blue.png", "image", "assets/gfx/ui/buttons/button_blue.png");
		addExternal("assets/gfx/ui/buttons/button_blue_toggle.png", "image", "assets/gfx/ui/buttons/button_blue_toggle.png");
		addExternal("assets/gfx/ui/buttons/button_confirmation_black.png", "image", "assets/gfx/ui/buttons/button_confirmation_black.png");
		addExternal("assets/gfx/ui/buttons/button_confirmation_over.png", "image", "assets/gfx/ui/buttons/button_confirmation_over.png");
		addExternal("assets/gfx/ui/buttons/button_confirmation_red_over.png", "image", "assets/gfx/ui/buttons/button_confirmation_red_over.png");
		addExternal("assets/gfx/ui/buttons/button_confirmation_red_up.png", "image", "assets/gfx/ui/buttons/button_confirmation_red_up.png");
		addExternal("assets/gfx/ui/buttons/button_confirmation_up.png", "image", "assets/gfx/ui/buttons/button_confirmation_up.png");
		addExternal("assets/gfx/ui/buttons/button_gold.png", "image", "assets/gfx/ui/buttons/button_gold.png");
		addExternal("assets/gfx/ui/buttons/button_gold_up.png", "image", "assets/gfx/ui/buttons/button_gold_up.png");
		addExternal("assets/gfx/ui/buttons/button_grey.png", "image", "assets/gfx/ui/buttons/button_grey.png");
		addExternal("assets/gfx/ui/buttons/button_red.png", "image", "assets/gfx/ui/buttons/button_red.png");
		addExternal("assets/gfx/ui/buttons/gold.png", "image", "assets/gfx/ui/buttons/gold.png");
		addExternal("assets/gfx/ui/buttons/gold_over.png", "image", "assets/gfx/ui/buttons/gold_over.png");
		addExternal("assets/gfx/ui/buttons/grey.png", "image", "assets/gfx/ui/buttons/grey.png");
		addExternal("assets/gfx/ui/buttons/grey_over.png", "image", "assets/gfx/ui/buttons/grey_over.png");
		addExternal("assets/gfx/ui/buttons/red.png", "image", "assets/gfx/ui/buttons/red.png");
		addExternal("assets/gfx/ui/buttons/red_over.png", "image", "assets/gfx/ui/buttons/red_over.png");
		addExternal("assets/gfx/ui/buttons/tab_grey.png", "image", "assets/gfx/ui/buttons/tab_grey.png");
		addExternal("assets/gfx/ui/buttons/tab_grey_back.png", "image", "assets/gfx/ui/buttons/tab_grey_back.png");
		addExternal("assets/gfx/ui/buttons/tab_grey_back_over.png", "image", "assets/gfx/ui/buttons/tab_grey_back_over.png");
		addExternal("assets/gfx/ui/buttons/tab_grey_over.png", "image", "assets/gfx/ui/buttons/tab_grey_over.png");
		addExternal("assets/gfx/ui/chrome/dark_grey.png", "image", "assets/gfx/ui/chrome/dark_grey.png");
		addExternal("assets/gfx/ui/chrome/dark_grey_flat_top.png", "image", "assets/gfx/ui/chrome/dark_grey_flat_top.png");
		addExternal("assets/gfx/ui/chrome/dark_grey_inset.png", "image", "assets/gfx/ui/chrome/dark_grey_inset.png");
		addExternal("assets/gfx/ui/chrome/dark_grey_texture.png", "image", "assets/gfx/ui/chrome/dark_grey_texture.png");
		addExternal("assets/gfx/ui/misc/check_big.png", "image", "assets/gfx/ui/misc/check_big.png");
		addExternal("assets/gfx/ui/misc/check_box_big.png", "image", "assets/gfx/ui/misc/check_box_big.png");
		addExternal("assets/gfx/ui/misc/check_box_small.png", "image", "assets/gfx/ui/misc/check_box_small.png");
		addExternal("assets/gfx/ui/misc/check_small.png", "image", "assets/gfx/ui/misc/check_small.png");
		addExternal("assets/gfx/ui/misc/flag_blank.png", "image", "assets/gfx/ui/misc/flag_blank.png");
		addExternal("assets/gfx/ui/misc/health_bar.png", "image", "assets/gfx/ui/misc/health_bar.png");
		addExternal("assets/gfx/ui/misc/mana_bar.png", "image", "assets/gfx/ui/misc/mana_bar.png");
		addExternal("assets/gfx/ui/misc/radio.png", "image", "assets/gfx/ui/misc/radio.png");
		addExternal("assets/gfx/ui/misc/radio_dot.png", "image", "assets/gfx/ui/misc/radio_dot.png");
		addExternal("assets/gfx/ui/saveslot.png", "image", "assets/gfx/ui/saveslot.png");
		addExternal("assets/gfx/ui/saveslot_shadow.png", "image", "assets/gfx/ui/saveslot_shadow.png");
		addExternal("assets/gfx/ui/save_menu_overlay.png", "image", "assets/gfx/ui/save_menu_overlay.png");
		addExternal("assets/gfx/ui/title_back.png", "image", "assets/gfx/ui/title_back.png");
		addExternal("assets/HaxeFlixel.svg", "text", "assets/HaxeFlixel.svg");
		addExternal("assets/locales/en-US/fonts.xml", "text", "assets/locales/en-US/fonts.xml");
		addExternal("assets/locales/en-US/ui.csv", "text", "assets/locales/en-US/ui.csv");
		addExternal("assets/locales/index.xml", "text", "assets/locales/index.xml");
		addExternal("assets/locales/nb-NO/fonts.xml", "text", "assets/locales/nb-NO/fonts.xml");
		addExternal("assets/locales/nb-NO/ui.csv", "text", "assets/locales/nb-NO/ui.csv");
		addExternal("assets/locales/_flags/cs-CZ.png", "image", "assets/locales/_flags/cs-CZ.png");
		addExternal("assets/locales/_flags/de-DE.png", "image", "assets/locales/_flags/de-DE.png");
		addExternal("assets/locales/_flags/en-CA.png", "image", "assets/locales/_flags/en-CA.png");
		addExternal("assets/locales/_flags/en-GB.png", "image", "assets/locales/_flags/en-GB.png");
		addExternal("assets/locales/_flags/en-US.png", "image", "assets/locales/_flags/en-US.png");
		addExternal("assets/locales/_flags/es-ES.png", "image", "assets/locales/_flags/es-ES.png");
		addExternal("assets/locales/_flags/fr-FR.png", "image", "assets/locales/_flags/fr-FR.png");
		addExternal("assets/locales/_flags/it-IT.png", "image", "assets/locales/_flags/it-IT.png");
		addExternal("assets/locales/_flags/ja-JP.png", "image", "assets/locales/_flags/ja-JP.png");
		addExternal("assets/locales/_flags/ko-KR.png", "image", "assets/locales/_flags/ko-KR.png");
		addExternal("assets/locales/_flags/nb-NO.png", "image", "assets/locales/_flags/nb-NO.png");
		addExternal("assets/locales/_flags/pl-PL.png", "image", "assets/locales/_flags/pl-PL.png");
		addExternal("assets/locales/_flags/yo-DA.png", "image", "assets/locales/_flags/yo-DA.png");
		addExternal("assets/menu/border.png", "image", "assets/menu/border.png");
		addExternal("assets/menu/cursor.png", "image", "assets/menu/cursor.png");
		addExternal("assets/menu/logos.png", "image", "assets/menu/logos.png");
		addExternal("assets/menu/version.png", "image", "assets/menu/version.png");
		addExternal("assets/sprite/boy/arms/p_arm_idle.png", "image", "assets/sprite/boy/arms/p_arm_idle.png");
		addExternal("assets/sprite/boy/arms/p_arm_idle_a.png", "image", "assets/sprite/boy/arms/p_arm_idle_a.png");
		addExternal("assets/sprite/boy/arms/p_arm_slide_0.png", "image", "assets/sprite/boy/arms/p_arm_slide_0.png");
		addExternal("assets/sprite/boy/arms/p_arm_throw_0.png", "image", "assets/sprite/boy/arms/p_arm_throw_0.png");
		addExternal("assets/sprite/boy/arms/p_arm_walk.png", "image", "assets/sprite/boy/arms/p_arm_walk.png");
		addExternal("assets/sprite/boy/arms/p_forarm_idle_0.png", "image", "assets/sprite/boy/arms/p_forarm_idle_0.png");
		addExternal("assets/sprite/boy/arms/p_forarm_idle_a.png", "image", "assets/sprite/boy/arms/p_forarm_idle_a.png");
		addExternal("assets/sprite/boy/arms/p_forarm_jump_0.png", "image", "assets/sprite/boy/arms/p_forarm_jump_0.png");
		addExternal("assets/sprite/boy/arms/p_forarm_side_0.png", "image", "assets/sprite/boy/arms/p_forarm_side_0.png");
		addExternal("assets/sprite/boy/arms/p_forarm_under_0.png", "image", "assets/sprite/boy/arms/p_forarm_under_0.png");
		addExternal("assets/sprite/boy/arms/p_forarm_walk_a.png", "image", "assets/sprite/boy/arms/p_forarm_walk_a.png");
		addExternal("assets/sprite/boy/arms/throw_blur_0.png", "image", "assets/sprite/boy/arms/throw_blur_0.png");
		addExternal("assets/sprite/boy/feet/p_foot_hit_a.png", "image", "assets/sprite/boy/feet/p_foot_hit_a.png");
		addExternal("assets/sprite/boy/feet/p_foot_hot_0.png", "image", "assets/sprite/boy/feet/p_foot_hot_0.png");
		addExternal("assets/sprite/boy/feet/p_foot_idle_0.png", "image", "assets/sprite/boy/feet/p_foot_idle_0.png");
		addExternal("assets/sprite/boy/feet/p_foot_jump_0.png", "image", "assets/sprite/boy/feet/p_foot_jump_0.png");
		addExternal("assets/sprite/boy/feet/p_foot_walk_0.png", "image", "assets/sprite/boy/feet/p_foot_walk_0.png");
		addExternal("assets/sprite/boy/feet/p_foot_walk_a.png", "image", "assets/sprite/boy/feet/p_foot_walk_a.png");
		addExternal("assets/sprite/boy/first.scml", "text", "assets/sprite/boy/first.scml");
		addExternal("assets/sprite/boy/hands/p_hand_1.png", "image", "assets/sprite/boy/hands/p_hand_1.png");
		addExternal("assets/sprite/boy/hands/p_hand_2.png", "image", "assets/sprite/boy/hands/p_hand_2.png");
		addExternal("assets/sprite/boy/hands/p_hand_a.png", "image", "assets/sprite/boy/hands/p_hand_a.png");
		addExternal("assets/sprite/boy/hands/p_hand_a_edge.png", "image", "assets/sprite/boy/hands/p_hand_a_edge.png");
		addExternal("assets/sprite/boy/hands/p_hand_b.png", "image", "assets/sprite/boy/hands/p_hand_b.png");
		addExternal("assets/sprite/boy/hands/p_hand_c.png", "image", "assets/sprite/boy/hands/p_hand_c.png");
		addExternal("assets/sprite/boy/hands/p_hand_edge_0.png", "image", "assets/sprite/boy/hands/p_hand_edge_0.png");
		addExternal("assets/sprite/boy/hands/p_hand_float_0.png", "image", "assets/sprite/boy/hands/p_hand_float_0.png");
		addExternal("assets/sprite/boy/hands/p_hand_hang_0.png", "image", "assets/sprite/boy/hands/p_hand_hang_0.png");
		addExternal("assets/sprite/boy/hands/p_hand_hang_1.png", "image", "assets/sprite/boy/hands/p_hand_hang_1.png");
		addExternal("assets/sprite/boy/hands/p_hand_hang_a.png", "image", "assets/sprite/boy/hands/p_hand_hang_a.png");
		addExternal("assets/sprite/boy/hands/p_hand_hit_0.png", "image", "assets/sprite/boy/hands/p_hand_hit_0.png");
		addExternal("assets/sprite/boy/hands/p_hand_hit_a.png", "image", "assets/sprite/boy/hands/p_hand_hit_a.png");
		addExternal("assets/sprite/boy/hands/p_hand_idle_0.png", "image", "assets/sprite/boy/hands/p_hand_idle_0.png");
		addExternal("assets/sprite/boy/hands/p_hand_jump_0.png", "image", "assets/sprite/boy/hands/p_hand_jump_0.png");
		addExternal("assets/sprite/boy/hands/p_hand_jump_a.png", "image", "assets/sprite/boy/hands/p_hand_jump_a.png");
		addExternal("assets/sprite/boy/hands/p_hand_prepunch_0.png", "image", "assets/sprite/boy/hands/p_hand_prepunch_0.png");
		addExternal("assets/sprite/boy/hands/p_hand_prepunch_x.png", "image", "assets/sprite/boy/hands/p_hand_prepunch_x.png");
		addExternal("assets/sprite/boy/hands/p_hand_punch_0.png", "image", "assets/sprite/boy/hands/p_hand_punch_0.png");
		addExternal("assets/sprite/boy/hands/p_hand_push_0.png", "image", "assets/sprite/boy/hands/p_hand_push_0.png");
		addExternal("assets/sprite/boy/hands/p_hand_push_a.png", "image", "assets/sprite/boy/hands/p_hand_push_a.png");
		addExternal("assets/sprite/boy/hands/p_hand_slide_0.png", "image", "assets/sprite/boy/hands/p_hand_slide_0.png");
		addExternal("assets/sprite/boy/hands/p_hand_throw_0.png", "image", "assets/sprite/boy/hands/p_hand_throw_0.png");
		addExternal("assets/sprite/boy/hands/p_punch_blur.png", "image", "assets/sprite/boy/hands/p_punch_blur.png");
		addExternal("assets/sprite/boy/head/p_head_blink_0.png", "image", "assets/sprite/boy/head/p_head_blink_0.png");
		addExternal("assets/sprite/boy/head/p_head_blink_1.png", "image", "assets/sprite/boy/head/p_head_blink_1.png");
		addExternal("assets/sprite/boy/head/p_head_concern.png", "image", "assets/sprite/boy/head/p_head_concern.png");
		addExternal("assets/sprite/boy/head/p_head_concern_blink_0.png", "image", "assets/sprite/boy/head/p_head_concern_blink_0.png");
		addExternal("assets/sprite/boy/head/p_head_concern_blink_1.png", "image", "assets/sprite/boy/head/p_head_concern_blink_1.png");
		addExternal("assets/sprite/boy/head/p_head_die.png", "image", "assets/sprite/boy/head/p_head_die.png");
		addExternal("assets/sprite/boy/head/p_head_hurt.png", "image", "assets/sprite/boy/head/p_head_hurt.png");
		addExternal("assets/sprite/boy/head/p_head_idle.png", "image", "assets/sprite/boy/head/p_head_idle.png");
		addExternal("assets/sprite/boy/head/p_head_idle_blink_0.png", "image", "assets/sprite/boy/head/p_head_idle_blink_0.png");
		addExternal("assets/sprite/boy/head/p_head_idle_blink_1.png", "image", "assets/sprite/boy/head/p_head_idle_blink_1.png");
		addExternal("assets/sprite/boy/head/p_head_push.png", "image", "assets/sprite/boy/head/p_head_push.png");
		addExternal("assets/sprite/boy/head/p_head_turn_0.png", "image", "assets/sprite/boy/head/p_head_turn_0.png");
		addExternal("assets/sprite/boy/head/p_head_walk.png", "image", "assets/sprite/boy/head/p_head_walk.png");
		addExternal("assets/sprite/boy/legs/p_leg_a.png", "image", "assets/sprite/boy/legs/p_leg_a.png");
		addExternal("assets/sprite/boy/legs/p_leg_idle_0.png", "image", "assets/sprite/boy/legs/p_leg_idle_0.png");
		addExternal("assets/sprite/boy/legs/p_leg_walk_0.png", "image", "assets/sprite/boy/legs/p_leg_walk_0.png");
		addExternal("assets/sprite/boy/legs/p_pelvis_die.png", "image", "assets/sprite/boy/legs/p_pelvis_die.png");
		addExternal("assets/sprite/boy/legs/p_pelvis_idle.png", "image", "assets/sprite/boy/legs/p_pelvis_idle.png");
		addExternal("assets/sprite/boy/legs/p_pelvis_walk.png", "image", "assets/sprite/boy/legs/p_pelvis_walk.png");
		addExternal("assets/sprite/boy/legs/p_thigh_a.png", "image", "assets/sprite/boy/legs/p_thigh_a.png");
		addExternal("assets/sprite/boy/legs/p_thigh_idle_0.png", "image", "assets/sprite/boy/legs/p_thigh_idle_0.png");
		addExternal("assets/sprite/boy/legs/p_thigh_walk_0.png", "image", "assets/sprite/boy/legs/p_thigh_walk_0.png");
		addExternal("assets/sprite/boy/torso/p_torso_front.png", "image", "assets/sprite/boy/torso/p_torso_front.png");
		addExternal("assets/sprite/boy/torso/p_torso_idle.png", "image", "assets/sprite/boy/torso/p_torso_idle.png");
		addExternal("assets/sprite/boy/torso/p_torso_jump.png", "image", "assets/sprite/boy/torso/p_torso_jump.png");
		addExternal("assets/sprite/boy/torso/p_torso_punch_0.png", "image", "assets/sprite/boy/torso/p_torso_punch_0.png");
		addExternal("assets/sprite/boy/torso/p_torso_walk.png", "image", "assets/sprite/boy/torso/p_torso_walk.png");
		addExternal("assets/sprite/brawler/brawler.scml", "text", "assets/sprite/brawler/brawler.scml");
		addExternal("assets/sprite/brawler/Brawler_flats_backhand.png", "image", "assets/sprite/brawler/Brawler_flats_backhand.png");
		addExternal("assets/sprite/brawler/Brawler_flats_bigfoot.png", "image", "assets/sprite/brawler/Brawler_flats_bigfoot.png");
		addExternal("assets/sprite/brawler/Brawler_flats_body.png", "image", "assets/sprite/brawler/Brawler_flats_body.png");
		addExternal("assets/sprite/brawler/Brawler_flats_fronthand.png", "image", "assets/sprite/brawler/Brawler_flats_fronthand.png");
		addExternal("assets/sprite/brawler/Brawler_flats_headclose.png", "image", "assets/sprite/brawler/Brawler_flats_headclose.png");
		addExternal("assets/sprite/brawler/Brawler_flats_headopen.png", "image", "assets/sprite/brawler/Brawler_flats_headopen.png");
		addExternal("assets/sprite/brawler/Brawler_flats_smallfoot.png", "image", "assets/sprite/brawler/Brawler_flats_smallfoot.png");
		addExternal("assets/sprite/bullet.png", "image", "assets/sprite/bullet.png");
		addExternal("assets/sprite/creature/gorilla.png", "image", "assets/sprite/creature/gorilla.png");
		addExternal("assets/sprite/elevator.png", "image", "assets/sprite/elevator.png");
		addExternal("assets/sprite/material.png", "image", "assets/sprite/material.png");
		addExternal("assets/sprite/materialicon.png", "image", "assets/sprite/materialicon.png");
		addExternal("assets/sprite/npc/gorilla.png", "image", "assets/sprite/npc/gorilla.png");
		addExternal("assets/sprite/npc/master.png", "image", "assets/sprite/npc/master.png");
		addExternal("assets/sprite/player/body.png", "image", "assets/sprite/player/body.png");
		addExternal("assets/sprite/player/header.png", "image", "assets/sprite/player/header.png");
		addExternal("assets/sprite/player/lowerarm.png", "image", "assets/sprite/player/lowerarm.png");
		addExternal("assets/sprite/player/lowerleg.png", "image", "assets/sprite/player/lowerleg.png");
		addExternal("assets/sprite/player/upperarm.png", "image", "assets/sprite/player/upperarm.png");
		addExternal("assets/sprite/player/upperleg.png", "image", "assets/sprite/player/upperleg.png");
		addExternal("assets/sprite/player/weapon.png", "image", "assets/sprite/player/weapon.png");
		addExternal("assets/sprite/test/armdown_l.png", "image", "assets/sprite/test/armdown_l.png");
		addExternal("assets/sprite/test/armdown_r.png", "image", "assets/sprite/test/armdown_r.png");
		addExternal("assets/sprite/test/armup_l.png", "image", "assets/sprite/test/armup_l.png");
		addExternal("assets/sprite/test/armup_r.png", "image", "assets/sprite/test/armup_r.png");
		addExternal("assets/sprite/test/body.png", "image", "assets/sprite/test/body.png");
		addExternal("assets/sprite/test/body_1.png", "image", "assets/sprite/test/body_1.png");
		addExternal("assets/sprite/test/first.scml", "text", "assets/sprite/test/first.scml");
		addExternal("assets/sprite/test/foot_l.png", "image", "assets/sprite/test/foot_l.png");
		addExternal("assets/sprite/test/foot_r.png", "image", "assets/sprite/test/foot_r.png");
		addExternal("assets/sprite/test/gun.png", "image", "assets/sprite/test/gun.png");
		addExternal("assets/sprite/test/head.png", "image", "assets/sprite/test/head.png");
		addExternal("assets/sprite/test/hoe.png", "image", "assets/sprite/test/hoe.png");
		addExternal("assets/sprite/test/legdown_l.png", "image", "assets/sprite/test/legdown_l.png");
		addExternal("assets/sprite/test/legdown_r.png", "image", "assets/sprite/test/legdown_r.png");
		addExternal("assets/sprite/test/legup_l.png", "image", "assets/sprite/test/legup_l.png");
		addExternal("assets/sprite/test/legup_r.png", "image", "assets/sprite/test/legup_r.png");
		addExternal("assets/sprite/test/sword.png", "image", "assets/sprite/test/sword.png");
		addExternal("assets/sprite/test/tool.png", "image", "assets/sprite/test/tool.png");
		addExternal("assets/sprite/thrust_ship.png", "image", "assets/sprite/thrust_ship.png");
		addExternal("assets/sprite/tree.png", "image", "assets/sprite/tree.png");
		addExternal("assets/tiled/backdrop.png", "image", "assets/tiled/backdrop.png");
		addExternal("assets/tiled/backdropMini.png", "image", "assets/tiled/backdropMini.png");
		addExternal("assets/tiled/coin.png", "image", "assets/tiled/coin.png");
		addExternal("assets/tiled/level.png", "image", "assets/tiled/level.png");
		addExternal("assets/tiled/level.tmx", "text", "assets/tiled/level.tmx");
		addExternal("assets/tiled/mapCSV_Group1_background.csv", "text", "assets/tiled/mapCSV_Group1_background.csv");
		addExternal("assets/tiled/mapCSV_Group1_Map1.csv", "text", "assets/tiled/mapCSV_Group1_Map1.csv");
		addExternal("assets/tiled/mapCSV_Group1_tiled.csv", "text", "assets/tiled/mapCSV_Group1_tiled.csv");
		addExternal("assets/tiled/miniPlanet.png", "image", "assets/tiled/miniPlanet.png");
		addExternal("assets/tiled/planet.dam", "text", "assets/tiled/planet.dam");
		addExternal("assets/tiled/planet.dam.bak", "text", "assets/tiled/planet.dam.bak");
		addExternal("assets/tiled/planet.png", "image", "assets/tiled/planet.png");
		addExternal("assets/tiled/point.dam", "text", "assets/tiled/point.dam");
		addExternal("assets/tiled/point.dam.bak", "text", "assets/tiled/point.dam.bak");
		addExternal("assets/tiled/point.png", "image", "assets/tiled/point.png");
		addExternal("assets/tiled/pointMini.png", "image", "assets/tiled/pointMini.png");
		addExternal("assets/tiled/tiles.png", "image", "assets/tiled/tiles.png");
		addExternal("assets/tiled/waterTest.txt", "text", "assets/tiled/waterTest.txt");
		addExternal("assets/ui/dialog_box.png", "image", "assets/ui/dialog_box.png");
		addExternal("assets/ui/inventory.png", "image", "assets/ui/inventory.png");
		addExternal("assets/ui/sign.png", "image", "assets/ui/sign.png");
		addExternal("assets/xml/play.xml", "text", "assets/xml/play.xml");
		addExternal("assets/xml/popup_demo.xml", "text", "assets/xml/popup_demo.xml");
		addExternal("assets/xml/popup_simple.xml", "text", "assets/xml/popup_simple.xml");
		addExternal("assets/xml/state_battle.xml", "text", "assets/xml/state_battle.xml");
		addExternal("assets/xml/state_default.xml", "text", "assets/xml/state_default.xml");
		addExternal("assets/xml/state_menu.xml", "text", "assets/xml/state_menu.xml");
		addExternal("assets/xml/state_save.xml", "text", "assets/xml/state_save.xml");
		addExternal("assets/xml/state_title.xml", "text", "assets/xml/state_title.xml");
		addExternal("assets/xml/_ui_globals.xml", "text", "assets/xml/_ui_globals.xml");
		
		
		#else
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<AssetData> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							path.set (asset.id, asset.path);
							type.set (asset.id, asset.type);
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest");
				
			}
			
		} catch (e:Dynamic) {
			
			trace ("Warning: Could not load asset manifest");
			
		}
		
		#end
		
	}
	
	
	#if html5
	private function addEmbed(id:String, kind:String, value:Dynamic):Void {
		className.set(id, value);
		type.set(id, Reflect.field(AssetType, kind.toUpperCase()));
	}
	
	
	private function addExternal(id:String, kind:String, value:String):Void {
		path.set(id, value);
		type.set(id, Reflect.field(AssetType, kind.toUpperCase()));
	}
	#end
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = DefaultAssetLibrary.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif openfl_html5
		
		return BitmapData.fromImage (ApplicationMain.images.get (path.get (id)));
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif openfl_html5
		
		return null;
		
		#elseif js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		var sound = new Sound ();
		sound.__buffer = true;
		sound.load (new URLRequest (path.get (id)));
		return sound; 
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		#if js
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}
		
		#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash

@:keep class __ASSET__flixel_img_debugger_buttons_console_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_debugger_buttons_drawdebug_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_debugger_buttons_logdebug_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_debugger_buttons_open_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_debugger_buttons_pause_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_debugger_buttons_play_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_debugger_buttons_record_off_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_debugger_buttons_record_on_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_debugger_buttons_restart_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_debugger_buttons_statsdebug_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_debugger_buttons_step_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_debugger_buttons_stop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_debugger_buttons_watchdebug_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_debugger_flixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_debugger_windowhandle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_logo_haxeflixel_svg extends flash.utils.ByteArray { }
@:keep class __ASSET__flixel_img_logo_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_preloader_corners_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_preloader_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_tile_autotiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_tile_autotiles_alt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_ui_analog_base_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_ui_analog_thumb_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_ui_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_ui_fontdata11pt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_ui_virtualpad_a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_ui_virtualpad_b_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_ui_virtualpad_c_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_ui_virtualpad_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_ui_virtualpad_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_ui_virtualpad_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_ui_virtualpad_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_ui_virtualpad_x_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_img_ui_virtualpad_y_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_snd_beep_wav extends flash.media.Sound { }
@:keep class __ASSET__flixel_snd_flixel_wav extends flash.media.Sound { }
@:keep class __ASSET__flixel_img_napedebug_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_button_thin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_button_toggle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_check_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_check_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_chrome_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_hilight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_invis_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_radio_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_radio_dot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_tab_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_xml_defaults_xml extends flash.utils.ByteArray { }
@:keep class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_data_glow_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_fonts_vera_ttf extends flash.text.Font { }
@:keep class __ASSET__assets_fonts_verab_ttf extends flash.text.Font { }
@:keep class __ASSET__assets_fonts_verai_ttf extends flash.text.Font { }
@:keep class __ASSET__assets_fonts_veraz_ttf extends flash.text.Font { }
@:keep class __ASSET__assets_gfx_other_icon_party_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_other_portrait_mane_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_blue_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_blue_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_blue_back_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_blue_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_button_blue_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_button_blue_toggle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_button_confirmation_black_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_button_confirmation_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_button_confirmation_red_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_button_confirmation_red_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_button_confirmation_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_button_gold_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_button_gold_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_button_grey_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_button_red_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_gold_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_gold_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_grey_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_grey_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_red_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_red_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_tab_grey_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_tab_grey_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_tab_grey_back_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_buttons_tab_grey_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_chrome_dark_grey_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_chrome_dark_grey_flat_top_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_chrome_dark_grey_inset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_chrome_dark_grey_texture_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_misc_check_big_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_misc_check_box_big_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_misc_check_box_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_misc_check_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_misc_flag_blank_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_misc_health_bar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_misc_mana_bar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_misc_radio_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_misc_radio_dot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_saveslot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_saveslot_shadow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_save_menu_overlay_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_gfx_ui_title_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_haxeflixel_svg extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_locales_en_us_fonts_xml extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_locales_en_us_ui_csv extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_locales_index_xml extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_locales_nb_no_fonts_xml extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_locales_nb_no_ui_csv extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_locales__flags_cs_cz_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_locales__flags_de_de_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_locales__flags_en_ca_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_locales__flags_en_gb_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_locales__flags_en_us_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_locales__flags_es_es_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_locales__flags_fr_fr_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_locales__flags_it_it_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_locales__flags_ja_jp_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_locales__flags_ko_kr_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_locales__flags_nb_no_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_locales__flags_pl_pl_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_locales__flags_yo_da_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_menu_border_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_menu_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_menu_logos_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_menu_version_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_arms_p_arm_idle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_arms_p_arm_idle_a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_arms_p_arm_slide_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_arms_p_arm_throw_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_arms_p_arm_walk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_arms_p_forarm_idle_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_arms_p_forarm_idle_a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_arms_p_forarm_jump_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_arms_p_forarm_side_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_arms_p_forarm_under_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_arms_p_forarm_walk_a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_arms_throw_blur_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_feet_p_foot_hit_a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_feet_p_foot_hot_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_feet_p_foot_idle_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_feet_p_foot_jump_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_feet_p_foot_walk_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_feet_p_foot_walk_a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_first_scml extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_a_edge_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_b_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_c_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_edge_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_float_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_hang_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_hang_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_hang_a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_hit_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_hit_a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_idle_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_jump_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_jump_a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_prepunch_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_prepunch_x_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_punch_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_push_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_push_a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_slide_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_hand_throw_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_hands_p_punch_blur_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_head_p_head_blink_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_head_p_head_blink_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_head_p_head_concern_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_head_p_head_concern_blink_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_head_p_head_concern_blink_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_head_p_head_die_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_head_p_head_hurt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_head_p_head_idle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_head_p_head_idle_blink_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_head_p_head_idle_blink_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_head_p_head_push_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_head_p_head_turn_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_head_p_head_walk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_legs_p_leg_a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_legs_p_leg_idle_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_legs_p_leg_walk_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_legs_p_pelvis_die_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_legs_p_pelvis_idle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_legs_p_pelvis_walk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_legs_p_thigh_a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_legs_p_thigh_idle_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_legs_p_thigh_walk_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_torso_p_torso_front_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_torso_p_torso_idle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_torso_p_torso_jump_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_torso_p_torso_punch_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_boy_torso_p_torso_walk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_brawler_brawler_scml extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_sprite_brawler_brawler_flats_backhand_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_brawler_brawler_flats_bigfoot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_brawler_brawler_flats_body_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_brawler_brawler_flats_fronthand_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_brawler_brawler_flats_headclose_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_brawler_brawler_flats_headopen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_brawler_brawler_flats_smallfoot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_bullet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_creature_gorilla_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_elevator_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_material_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_materialicon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_npc_gorilla_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_npc_master_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_player_body_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_player_header_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_player_lowerarm_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_player_lowerleg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_player_upperarm_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_player_upperleg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_player_weapon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_test_armdown_l_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_test_armdown_r_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_test_armup_l_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_test_armup_r_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_test_body_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_test_body_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_test_first_scml extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_sprite_test_foot_l_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_test_foot_r_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_test_gun_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_test_head_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_test_hoe_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_test_legdown_l_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_test_legdown_r_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_test_legup_l_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_test_legup_r_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_test_sword_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_test_tool_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_thrust_ship_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sprite_tree_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_tiled_backdrop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_tiled_backdropmini_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_tiled_coin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_tiled_level_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_tiled_level_tmx extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_tiled_mapcsv_group1_background_csv extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_tiled_mapcsv_group1_map1_csv extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_tiled_mapcsv_group1_tiled_csv extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_tiled_miniplanet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_tiled_planet_dam extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_tiled_planet_dam_bak extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_tiled_planet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_tiled_point_dam extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_tiled_point_dam_bak extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_tiled_point_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_tiled_pointmini_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_tiled_tiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_tiled_watertest_txt extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_ui_dialog_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_ui_inventory_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_ui_sign_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_xml_play_xml extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_xml_popup_demo_xml extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_xml_popup_simple_xml extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_xml_state_battle_xml extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_xml_state_default_xml extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_xml_state_menu_xml extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_xml_state_save_xml extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_xml_state_title_xml extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_xml__ui_globals_xml extends flash.utils.ByteArray { }


#elseif html5



























































@:keep class __ASSET__assets_fonts_vera_ttf extends flash.text.Font { }
@:keep class __ASSET__assets_fonts_verab_ttf extends flash.text.Font { }
@:keep class __ASSET__assets_fonts_verai_ttf extends flash.text.Font { }
@:keep class __ASSET__assets_fonts_veraz_ttf extends flash.text.Font { }



















































































































































































































#end
