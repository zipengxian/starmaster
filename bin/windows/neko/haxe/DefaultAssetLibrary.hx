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
		type.set ("assets/locales/en-US/ui.csv", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/locales/index.xml", __ASSET__assets_locales_index_xml);
		type.set ("assets/locales/index.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/locales/nb-NO/fonts.xml", __ASSET__assets_locales_nb_no_fonts_xml);
		type.set ("assets/locales/nb-NO/fonts.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/locales/nb-NO/ui.csv", __ASSET__assets_locales_nb_no_ui_csv);
		type.set ("assets/locales/nb-NO/ui.csv", Reflect.field (AssetType, "binary".toUpperCase ()));
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
		type.set ("assets/sprite/boy/first.scml", Reflect.field (AssetType, "binary".toUpperCase ()));
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
		type.set ("assets/sprite/brawler/brawler.scml", Reflect.field (AssetType, "binary".toUpperCase ()));
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
		type.set ("assets/sprite/test/first.scml", Reflect.field (AssetType, "binary".toUpperCase ()));
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
		type.set ("assets/tiled/level.tmx", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/tiled/mapCSV_Group1_background.csv", __ASSET__assets_tiled_mapcsv_group1_background_csv);
		type.set ("assets/tiled/mapCSV_Group1_background.csv", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/tiled/mapCSV_Group1_Map1.csv", __ASSET__assets_tiled_mapcsv_group1_map1_csv);
		type.set ("assets/tiled/mapCSV_Group1_Map1.csv", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/tiled/mapCSV_Group1_tiled.csv", __ASSET__assets_tiled_mapcsv_group1_tiled_csv);
		type.set ("assets/tiled/mapCSV_Group1_tiled.csv", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/tiled/miniPlanet.png", __ASSET__assets_tiled_miniplanet_png);
		type.set ("assets/tiled/miniPlanet.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/tiled/planet.dam", __ASSET__assets_tiled_planet_dam);
		type.set ("assets/tiled/planet.dam", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/tiled/planet.dam.bak", __ASSET__assets_tiled_planet_dam_bak);
		type.set ("assets/tiled/planet.dam.bak", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/tiled/planet.png", __ASSET__assets_tiled_planet_png);
		type.set ("assets/tiled/planet.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/tiled/point.dam", __ASSET__assets_tiled_point_dam);
		type.set ("assets/tiled/point.dam", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/tiled/point.dam.bak", __ASSET__assets_tiled_point_dam_bak);
		type.set ("assets/tiled/point.dam.bak", Reflect.field (AssetType, "binary".toUpperCase ()));
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
		
		path.set ("flixel/img/debugger/buttons/console.png", "flixel/img/debugger/buttons/console.png");
		type.set ("flixel/img/debugger/buttons/console.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/drawDebug.png", "flixel/img/debugger/buttons/drawDebug.png");
		type.set ("flixel/img/debugger/buttons/drawDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/logDebug.png", "flixel/img/debugger/buttons/logDebug.png");
		type.set ("flixel/img/debugger/buttons/logDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/open.png", "flixel/img/debugger/buttons/open.png");
		type.set ("flixel/img/debugger/buttons/open.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/pause.png", "flixel/img/debugger/buttons/pause.png");
		type.set ("flixel/img/debugger/buttons/pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/play.png", "flixel/img/debugger/buttons/play.png");
		type.set ("flixel/img/debugger/buttons/play.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/record_off.png", "flixel/img/debugger/buttons/record_off.png");
		type.set ("flixel/img/debugger/buttons/record_off.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/record_on.png", "flixel/img/debugger/buttons/record_on.png");
		type.set ("flixel/img/debugger/buttons/record_on.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/restart.png", "flixel/img/debugger/buttons/restart.png");
		type.set ("flixel/img/debugger/buttons/restart.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/statsDebug.png", "flixel/img/debugger/buttons/statsDebug.png");
		type.set ("flixel/img/debugger/buttons/statsDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/step.png", "flixel/img/debugger/buttons/step.png");
		type.set ("flixel/img/debugger/buttons/step.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/stop.png", "flixel/img/debugger/buttons/stop.png");
		type.set ("flixel/img/debugger/buttons/stop.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/watchDebug.png", "flixel/img/debugger/buttons/watchDebug.png");
		type.set ("flixel/img/debugger/buttons/watchDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/flixel.png", "flixel/img/debugger/flixel.png");
		type.set ("flixel/img/debugger/flixel.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/windowHandle.png", "flixel/img/debugger/windowHandle.png");
		type.set ("flixel/img/debugger/windowHandle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/logo/default.png", "flixel/img/logo/default.png");
		type.set ("flixel/img/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/logo/HaxeFlixel.svg", "flixel/img/logo/HaxeFlixel.svg");
		type.set ("flixel/img/logo/HaxeFlixel.svg", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("flixel/img/logo/logo.png", "flixel/img/logo/logo.png");
		type.set ("flixel/img/logo/logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/preloader/corners.png", "flixel/img/preloader/corners.png");
		type.set ("flixel/img/preloader/corners.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/preloader/light.png", "flixel/img/preloader/light.png");
		type.set ("flixel/img/preloader/light.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/tile/autotiles.png", "flixel/img/tile/autotiles.png");
		type.set ("flixel/img/tile/autotiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/tile/autotiles_alt.png", "flixel/img/tile/autotiles_alt.png");
		type.set ("flixel/img/tile/autotiles_alt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/analog/base.png", "flixel/img/ui/analog/base.png");
		type.set ("flixel/img/ui/analog/base.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/analog/thumb.png", "flixel/img/ui/analog/thumb.png");
		type.set ("flixel/img/ui/analog/thumb.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/button.png", "flixel/img/ui/button.png");
		type.set ("flixel/img/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/cursor.png", "flixel/img/ui/cursor.png");
		type.set ("flixel/img/ui/cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/fontData11pt.png", "flixel/img/ui/fontData11pt.png");
		type.set ("flixel/img/ui/fontData11pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/a.png", "flixel/img/ui/virtualpad/a.png");
		type.set ("flixel/img/ui/virtualpad/a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/b.png", "flixel/img/ui/virtualpad/b.png");
		type.set ("flixel/img/ui/virtualpad/b.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/c.png", "flixel/img/ui/virtualpad/c.png");
		type.set ("flixel/img/ui/virtualpad/c.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/down.png", "flixel/img/ui/virtualpad/down.png");
		type.set ("flixel/img/ui/virtualpad/down.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/left.png", "flixel/img/ui/virtualpad/left.png");
		type.set ("flixel/img/ui/virtualpad/left.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/right.png", "flixel/img/ui/virtualpad/right.png");
		type.set ("flixel/img/ui/virtualpad/right.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/up.png", "flixel/img/ui/virtualpad/up.png");
		type.set ("flixel/img/ui/virtualpad/up.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/x.png", "flixel/img/ui/virtualpad/x.png");
		type.set ("flixel/img/ui/virtualpad/x.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/y.png", "flixel/img/ui/virtualpad/y.png");
		type.set ("flixel/img/ui/virtualpad/y.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/snd/beep.wav", "flixel/snd/beep.wav");
		type.set ("flixel/snd/beep.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("flixel/snd/flixel.wav", "flixel/snd/flixel.wav");
		type.set ("flixel/snd/flixel.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("flixel/img/napeDebug.png", "flixel/img/napeDebug.png");
		type.set ("flixel/img/napeDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/flixel-ui/img/box.png", "flixel/flixel-ui/img/box.png");
		type.set ("flixel/flixel-ui/img/box.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/flixel-ui/img/button.png", "flixel/flixel-ui/img/button.png");
		type.set ("flixel/flixel-ui/img/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/flixel-ui/img/button_thin.png", "flixel/flixel-ui/img/button_thin.png");
		type.set ("flixel/flixel-ui/img/button_thin.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/flixel-ui/img/button_toggle.png", "flixel/flixel-ui/img/button_toggle.png");
		type.set ("flixel/flixel-ui/img/button_toggle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/flixel-ui/img/check_box.png", "flixel/flixel-ui/img/check_box.png");
		type.set ("flixel/flixel-ui/img/check_box.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/flixel-ui/img/check_mark.png", "flixel/flixel-ui/img/check_mark.png");
		type.set ("flixel/flixel-ui/img/check_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/flixel-ui/img/chrome.png", "flixel/flixel-ui/img/chrome.png");
		type.set ("flixel/flixel-ui/img/chrome.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/flixel-ui/img/chrome_flat.png", "flixel/flixel-ui/img/chrome_flat.png");
		type.set ("flixel/flixel-ui/img/chrome_flat.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/flixel-ui/img/chrome_inset.png", "flixel/flixel-ui/img/chrome_inset.png");
		type.set ("flixel/flixel-ui/img/chrome_inset.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/flixel-ui/img/dropdown_mark.png", "flixel/flixel-ui/img/dropdown_mark.png");
		type.set ("flixel/flixel-ui/img/dropdown_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/flixel-ui/img/hilight.png", "flixel/flixel-ui/img/hilight.png");
		type.set ("flixel/flixel-ui/img/hilight.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/flixel-ui/img/invis.png", "flixel/flixel-ui/img/invis.png");
		type.set ("flixel/flixel-ui/img/invis.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/flixel-ui/img/radio.png", "flixel/flixel-ui/img/radio.png");
		type.set ("flixel/flixel-ui/img/radio.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/flixel-ui/img/radio_dot.png", "flixel/flixel-ui/img/radio_dot.png");
		type.set ("flixel/flixel-ui/img/radio_dot.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/flixel-ui/img/tab.png", "flixel/flixel-ui/img/tab.png");
		type.set ("flixel/flixel-ui/img/tab.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/flixel-ui/img/tab_back.png", "flixel/flixel-ui/img/tab_back.png");
		type.set ("flixel/flixel-ui/img/tab_back.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/flixel-ui/xml/defaults.xml", "flixel/flixel-ui/xml/defaults.xml");
		type.set ("flixel/flixel-ui/xml/defaults.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("flixel/flixel-ui/xml/default_popup.xml", "flixel/flixel-ui/xml/default_popup.xml");
		type.set ("flixel/flixel-ui/xml/default_popup.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/data/glow-light.png", "assets/data/glow-light.png");
		type.set ("assets/data/glow-light.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/fonts/vera.ttf", __ASSET__assets_fonts_vera_ttf);
		type.set ("assets/fonts/vera.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
		className.set ("assets/fonts/verab.ttf", __ASSET__assets_fonts_verab_ttf);
		type.set ("assets/fonts/verab.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
		className.set ("assets/fonts/verai.ttf", __ASSET__assets_fonts_verai_ttf);
		type.set ("assets/fonts/verai.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
		className.set ("assets/fonts/veraz.ttf", __ASSET__assets_fonts_veraz_ttf);
		type.set ("assets/fonts/veraz.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
		path.set ("assets/gfx/other/icon_party.png", "assets/gfx/other/icon_party.png");
		type.set ("assets/gfx/other/icon_party.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/other/portrait_mane.png", "assets/gfx/other/portrait_mane.png");
		type.set ("assets/gfx/other/portrait_mane.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/blue.png", "assets/gfx/ui/buttons/blue.png");
		type.set ("assets/gfx/ui/buttons/blue.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/blue_back.png", "assets/gfx/ui/buttons/blue_back.png");
		type.set ("assets/gfx/ui/buttons/blue_back.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/blue_back_over.png", "assets/gfx/ui/buttons/blue_back_over.png");
		type.set ("assets/gfx/ui/buttons/blue_back_over.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/blue_over.png", "assets/gfx/ui/buttons/blue_over.png");
		type.set ("assets/gfx/ui/buttons/blue_over.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/button_blue.png", "assets/gfx/ui/buttons/button_blue.png");
		type.set ("assets/gfx/ui/buttons/button_blue.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/button_blue_toggle.png", "assets/gfx/ui/buttons/button_blue_toggle.png");
		type.set ("assets/gfx/ui/buttons/button_blue_toggle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/button_confirmation_black.png", "assets/gfx/ui/buttons/button_confirmation_black.png");
		type.set ("assets/gfx/ui/buttons/button_confirmation_black.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/button_confirmation_over.png", "assets/gfx/ui/buttons/button_confirmation_over.png");
		type.set ("assets/gfx/ui/buttons/button_confirmation_over.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/button_confirmation_red_over.png", "assets/gfx/ui/buttons/button_confirmation_red_over.png");
		type.set ("assets/gfx/ui/buttons/button_confirmation_red_over.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/button_confirmation_red_up.png", "assets/gfx/ui/buttons/button_confirmation_red_up.png");
		type.set ("assets/gfx/ui/buttons/button_confirmation_red_up.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/button_confirmation_up.png", "assets/gfx/ui/buttons/button_confirmation_up.png");
		type.set ("assets/gfx/ui/buttons/button_confirmation_up.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/button_gold.png", "assets/gfx/ui/buttons/button_gold.png");
		type.set ("assets/gfx/ui/buttons/button_gold.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/button_gold_up.png", "assets/gfx/ui/buttons/button_gold_up.png");
		type.set ("assets/gfx/ui/buttons/button_gold_up.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/button_grey.png", "assets/gfx/ui/buttons/button_grey.png");
		type.set ("assets/gfx/ui/buttons/button_grey.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/button_red.png", "assets/gfx/ui/buttons/button_red.png");
		type.set ("assets/gfx/ui/buttons/button_red.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/gold.png", "assets/gfx/ui/buttons/gold.png");
		type.set ("assets/gfx/ui/buttons/gold.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/gold_over.png", "assets/gfx/ui/buttons/gold_over.png");
		type.set ("assets/gfx/ui/buttons/gold_over.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/grey.png", "assets/gfx/ui/buttons/grey.png");
		type.set ("assets/gfx/ui/buttons/grey.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/grey_over.png", "assets/gfx/ui/buttons/grey_over.png");
		type.set ("assets/gfx/ui/buttons/grey_over.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/red.png", "assets/gfx/ui/buttons/red.png");
		type.set ("assets/gfx/ui/buttons/red.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/red_over.png", "assets/gfx/ui/buttons/red_over.png");
		type.set ("assets/gfx/ui/buttons/red_over.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/tab_grey.png", "assets/gfx/ui/buttons/tab_grey.png");
		type.set ("assets/gfx/ui/buttons/tab_grey.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/tab_grey_back.png", "assets/gfx/ui/buttons/tab_grey_back.png");
		type.set ("assets/gfx/ui/buttons/tab_grey_back.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/tab_grey_back_over.png", "assets/gfx/ui/buttons/tab_grey_back_over.png");
		type.set ("assets/gfx/ui/buttons/tab_grey_back_over.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/buttons/tab_grey_over.png", "assets/gfx/ui/buttons/tab_grey_over.png");
		type.set ("assets/gfx/ui/buttons/tab_grey_over.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/chrome/dark_grey.png", "assets/gfx/ui/chrome/dark_grey.png");
		type.set ("assets/gfx/ui/chrome/dark_grey.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/chrome/dark_grey_flat_top.png", "assets/gfx/ui/chrome/dark_grey_flat_top.png");
		type.set ("assets/gfx/ui/chrome/dark_grey_flat_top.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/chrome/dark_grey_inset.png", "assets/gfx/ui/chrome/dark_grey_inset.png");
		type.set ("assets/gfx/ui/chrome/dark_grey_inset.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/chrome/dark_grey_texture.png", "assets/gfx/ui/chrome/dark_grey_texture.png");
		type.set ("assets/gfx/ui/chrome/dark_grey_texture.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/misc/check_big.png", "assets/gfx/ui/misc/check_big.png");
		type.set ("assets/gfx/ui/misc/check_big.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/misc/check_box_big.png", "assets/gfx/ui/misc/check_box_big.png");
		type.set ("assets/gfx/ui/misc/check_box_big.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/misc/check_box_small.png", "assets/gfx/ui/misc/check_box_small.png");
		type.set ("assets/gfx/ui/misc/check_box_small.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/misc/check_small.png", "assets/gfx/ui/misc/check_small.png");
		type.set ("assets/gfx/ui/misc/check_small.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/misc/flag_blank.png", "assets/gfx/ui/misc/flag_blank.png");
		type.set ("assets/gfx/ui/misc/flag_blank.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/misc/health_bar.png", "assets/gfx/ui/misc/health_bar.png");
		type.set ("assets/gfx/ui/misc/health_bar.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/misc/mana_bar.png", "assets/gfx/ui/misc/mana_bar.png");
		type.set ("assets/gfx/ui/misc/mana_bar.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/misc/radio.png", "assets/gfx/ui/misc/radio.png");
		type.set ("assets/gfx/ui/misc/radio.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/misc/radio_dot.png", "assets/gfx/ui/misc/radio_dot.png");
		type.set ("assets/gfx/ui/misc/radio_dot.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/saveslot.png", "assets/gfx/ui/saveslot.png");
		type.set ("assets/gfx/ui/saveslot.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/saveslot_shadow.png", "assets/gfx/ui/saveslot_shadow.png");
		type.set ("assets/gfx/ui/saveslot_shadow.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/save_menu_overlay.png", "assets/gfx/ui/save_menu_overlay.png");
		type.set ("assets/gfx/ui/save_menu_overlay.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/gfx/ui/title_back.png", "assets/gfx/ui/title_back.png");
		type.set ("assets/gfx/ui/title_back.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/HaxeFlixel.svg", "assets/HaxeFlixel.svg");
		type.set ("assets/HaxeFlixel.svg", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/locales/en-US/fonts.xml", "assets/locales/en-US/fonts.xml");
		type.set ("assets/locales/en-US/fonts.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/locales/en-US/ui.csv", "assets/locales/en-US/ui.csv");
		type.set ("assets/locales/en-US/ui.csv", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("assets/locales/index.xml", "assets/locales/index.xml");
		type.set ("assets/locales/index.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/locales/nb-NO/fonts.xml", "assets/locales/nb-NO/fonts.xml");
		type.set ("assets/locales/nb-NO/fonts.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/locales/nb-NO/ui.csv", "assets/locales/nb-NO/ui.csv");
		type.set ("assets/locales/nb-NO/ui.csv", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("assets/locales/_flags/cs-CZ.png", "assets/locales/_flags/cs-CZ.png");
		type.set ("assets/locales/_flags/cs-CZ.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/locales/_flags/de-DE.png", "assets/locales/_flags/de-DE.png");
		type.set ("assets/locales/_flags/de-DE.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/locales/_flags/en-CA.png", "assets/locales/_flags/en-CA.png");
		type.set ("assets/locales/_flags/en-CA.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/locales/_flags/en-GB.png", "assets/locales/_flags/en-GB.png");
		type.set ("assets/locales/_flags/en-GB.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/locales/_flags/en-US.png", "assets/locales/_flags/en-US.png");
		type.set ("assets/locales/_flags/en-US.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/locales/_flags/es-ES.png", "assets/locales/_flags/es-ES.png");
		type.set ("assets/locales/_flags/es-ES.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/locales/_flags/fr-FR.png", "assets/locales/_flags/fr-FR.png");
		type.set ("assets/locales/_flags/fr-FR.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/locales/_flags/it-IT.png", "assets/locales/_flags/it-IT.png");
		type.set ("assets/locales/_flags/it-IT.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/locales/_flags/ja-JP.png", "assets/locales/_flags/ja-JP.png");
		type.set ("assets/locales/_flags/ja-JP.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/locales/_flags/ko-KR.png", "assets/locales/_flags/ko-KR.png");
		type.set ("assets/locales/_flags/ko-KR.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/locales/_flags/nb-NO.png", "assets/locales/_flags/nb-NO.png");
		type.set ("assets/locales/_flags/nb-NO.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/locales/_flags/pl-PL.png", "assets/locales/_flags/pl-PL.png");
		type.set ("assets/locales/_flags/pl-PL.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/locales/_flags/yo-DA.png", "assets/locales/_flags/yo-DA.png");
		type.set ("assets/locales/_flags/yo-DA.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/menu/border.png", "assets/menu/border.png");
		type.set ("assets/menu/border.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/menu/cursor.png", "assets/menu/cursor.png");
		type.set ("assets/menu/cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/menu/logos.png", "assets/menu/logos.png");
		type.set ("assets/menu/logos.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/menu/version.png", "assets/menu/version.png");
		type.set ("assets/menu/version.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/arms/p_arm_idle.png", "assets/sprite/boy/arms/p_arm_idle.png");
		type.set ("assets/sprite/boy/arms/p_arm_idle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/arms/p_arm_idle_a.png", "assets/sprite/boy/arms/p_arm_idle_a.png");
		type.set ("assets/sprite/boy/arms/p_arm_idle_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/arms/p_arm_slide_0.png", "assets/sprite/boy/arms/p_arm_slide_0.png");
		type.set ("assets/sprite/boy/arms/p_arm_slide_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/arms/p_arm_throw_0.png", "assets/sprite/boy/arms/p_arm_throw_0.png");
		type.set ("assets/sprite/boy/arms/p_arm_throw_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/arms/p_arm_walk.png", "assets/sprite/boy/arms/p_arm_walk.png");
		type.set ("assets/sprite/boy/arms/p_arm_walk.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/arms/p_forarm_idle_0.png", "assets/sprite/boy/arms/p_forarm_idle_0.png");
		type.set ("assets/sprite/boy/arms/p_forarm_idle_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/arms/p_forarm_idle_a.png", "assets/sprite/boy/arms/p_forarm_idle_a.png");
		type.set ("assets/sprite/boy/arms/p_forarm_idle_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/arms/p_forarm_jump_0.png", "assets/sprite/boy/arms/p_forarm_jump_0.png");
		type.set ("assets/sprite/boy/arms/p_forarm_jump_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/arms/p_forarm_side_0.png", "assets/sprite/boy/arms/p_forarm_side_0.png");
		type.set ("assets/sprite/boy/arms/p_forarm_side_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/arms/p_forarm_under_0.png", "assets/sprite/boy/arms/p_forarm_under_0.png");
		type.set ("assets/sprite/boy/arms/p_forarm_under_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/arms/p_forarm_walk_a.png", "assets/sprite/boy/arms/p_forarm_walk_a.png");
		type.set ("assets/sprite/boy/arms/p_forarm_walk_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/arms/throw_blur_0.png", "assets/sprite/boy/arms/throw_blur_0.png");
		type.set ("assets/sprite/boy/arms/throw_blur_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/feet/p_foot_hit_a.png", "assets/sprite/boy/feet/p_foot_hit_a.png");
		type.set ("assets/sprite/boy/feet/p_foot_hit_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/feet/p_foot_hot_0.png", "assets/sprite/boy/feet/p_foot_hot_0.png");
		type.set ("assets/sprite/boy/feet/p_foot_hot_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/feet/p_foot_idle_0.png", "assets/sprite/boy/feet/p_foot_idle_0.png");
		type.set ("assets/sprite/boy/feet/p_foot_idle_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/feet/p_foot_jump_0.png", "assets/sprite/boy/feet/p_foot_jump_0.png");
		type.set ("assets/sprite/boy/feet/p_foot_jump_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/feet/p_foot_walk_0.png", "assets/sprite/boy/feet/p_foot_walk_0.png");
		type.set ("assets/sprite/boy/feet/p_foot_walk_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/feet/p_foot_walk_a.png", "assets/sprite/boy/feet/p_foot_walk_a.png");
		type.set ("assets/sprite/boy/feet/p_foot_walk_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/first.scml", "assets/sprite/boy/first.scml");
		type.set ("assets/sprite/boy/first.scml", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_1.png", "assets/sprite/boy/hands/p_hand_1.png");
		type.set ("assets/sprite/boy/hands/p_hand_1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_2.png", "assets/sprite/boy/hands/p_hand_2.png");
		type.set ("assets/sprite/boy/hands/p_hand_2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_a.png", "assets/sprite/boy/hands/p_hand_a.png");
		type.set ("assets/sprite/boy/hands/p_hand_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_a_edge.png", "assets/sprite/boy/hands/p_hand_a_edge.png");
		type.set ("assets/sprite/boy/hands/p_hand_a_edge.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_b.png", "assets/sprite/boy/hands/p_hand_b.png");
		type.set ("assets/sprite/boy/hands/p_hand_b.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_c.png", "assets/sprite/boy/hands/p_hand_c.png");
		type.set ("assets/sprite/boy/hands/p_hand_c.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_edge_0.png", "assets/sprite/boy/hands/p_hand_edge_0.png");
		type.set ("assets/sprite/boy/hands/p_hand_edge_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_float_0.png", "assets/sprite/boy/hands/p_hand_float_0.png");
		type.set ("assets/sprite/boy/hands/p_hand_float_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_hang_0.png", "assets/sprite/boy/hands/p_hand_hang_0.png");
		type.set ("assets/sprite/boy/hands/p_hand_hang_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_hang_1.png", "assets/sprite/boy/hands/p_hand_hang_1.png");
		type.set ("assets/sprite/boy/hands/p_hand_hang_1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_hang_a.png", "assets/sprite/boy/hands/p_hand_hang_a.png");
		type.set ("assets/sprite/boy/hands/p_hand_hang_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_hit_0.png", "assets/sprite/boy/hands/p_hand_hit_0.png");
		type.set ("assets/sprite/boy/hands/p_hand_hit_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_hit_a.png", "assets/sprite/boy/hands/p_hand_hit_a.png");
		type.set ("assets/sprite/boy/hands/p_hand_hit_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_idle_0.png", "assets/sprite/boy/hands/p_hand_idle_0.png");
		type.set ("assets/sprite/boy/hands/p_hand_idle_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_jump_0.png", "assets/sprite/boy/hands/p_hand_jump_0.png");
		type.set ("assets/sprite/boy/hands/p_hand_jump_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_jump_a.png", "assets/sprite/boy/hands/p_hand_jump_a.png");
		type.set ("assets/sprite/boy/hands/p_hand_jump_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_prepunch_0.png", "assets/sprite/boy/hands/p_hand_prepunch_0.png");
		type.set ("assets/sprite/boy/hands/p_hand_prepunch_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_prepunch_x.png", "assets/sprite/boy/hands/p_hand_prepunch_x.png");
		type.set ("assets/sprite/boy/hands/p_hand_prepunch_x.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_punch_0.png", "assets/sprite/boy/hands/p_hand_punch_0.png");
		type.set ("assets/sprite/boy/hands/p_hand_punch_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_push_0.png", "assets/sprite/boy/hands/p_hand_push_0.png");
		type.set ("assets/sprite/boy/hands/p_hand_push_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_push_a.png", "assets/sprite/boy/hands/p_hand_push_a.png");
		type.set ("assets/sprite/boy/hands/p_hand_push_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_slide_0.png", "assets/sprite/boy/hands/p_hand_slide_0.png");
		type.set ("assets/sprite/boy/hands/p_hand_slide_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_hand_throw_0.png", "assets/sprite/boy/hands/p_hand_throw_0.png");
		type.set ("assets/sprite/boy/hands/p_hand_throw_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/hands/p_punch_blur.png", "assets/sprite/boy/hands/p_punch_blur.png");
		type.set ("assets/sprite/boy/hands/p_punch_blur.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/head/p_head_blink_0.png", "assets/sprite/boy/head/p_head_blink_0.png");
		type.set ("assets/sprite/boy/head/p_head_blink_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/head/p_head_blink_1.png", "assets/sprite/boy/head/p_head_blink_1.png");
		type.set ("assets/sprite/boy/head/p_head_blink_1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/head/p_head_concern.png", "assets/sprite/boy/head/p_head_concern.png");
		type.set ("assets/sprite/boy/head/p_head_concern.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/head/p_head_concern_blink_0.png", "assets/sprite/boy/head/p_head_concern_blink_0.png");
		type.set ("assets/sprite/boy/head/p_head_concern_blink_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/head/p_head_concern_blink_1.png", "assets/sprite/boy/head/p_head_concern_blink_1.png");
		type.set ("assets/sprite/boy/head/p_head_concern_blink_1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/head/p_head_die.png", "assets/sprite/boy/head/p_head_die.png");
		type.set ("assets/sprite/boy/head/p_head_die.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/head/p_head_hurt.png", "assets/sprite/boy/head/p_head_hurt.png");
		type.set ("assets/sprite/boy/head/p_head_hurt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/head/p_head_idle.png", "assets/sprite/boy/head/p_head_idle.png");
		type.set ("assets/sprite/boy/head/p_head_idle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/head/p_head_idle_blink_0.png", "assets/sprite/boy/head/p_head_idle_blink_0.png");
		type.set ("assets/sprite/boy/head/p_head_idle_blink_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/head/p_head_idle_blink_1.png", "assets/sprite/boy/head/p_head_idle_blink_1.png");
		type.set ("assets/sprite/boy/head/p_head_idle_blink_1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/head/p_head_push.png", "assets/sprite/boy/head/p_head_push.png");
		type.set ("assets/sprite/boy/head/p_head_push.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/head/p_head_turn_0.png", "assets/sprite/boy/head/p_head_turn_0.png");
		type.set ("assets/sprite/boy/head/p_head_turn_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/head/p_head_walk.png", "assets/sprite/boy/head/p_head_walk.png");
		type.set ("assets/sprite/boy/head/p_head_walk.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/legs/p_leg_a.png", "assets/sprite/boy/legs/p_leg_a.png");
		type.set ("assets/sprite/boy/legs/p_leg_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/legs/p_leg_idle_0.png", "assets/sprite/boy/legs/p_leg_idle_0.png");
		type.set ("assets/sprite/boy/legs/p_leg_idle_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/legs/p_leg_walk_0.png", "assets/sprite/boy/legs/p_leg_walk_0.png");
		type.set ("assets/sprite/boy/legs/p_leg_walk_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/legs/p_pelvis_die.png", "assets/sprite/boy/legs/p_pelvis_die.png");
		type.set ("assets/sprite/boy/legs/p_pelvis_die.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/legs/p_pelvis_idle.png", "assets/sprite/boy/legs/p_pelvis_idle.png");
		type.set ("assets/sprite/boy/legs/p_pelvis_idle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/legs/p_pelvis_walk.png", "assets/sprite/boy/legs/p_pelvis_walk.png");
		type.set ("assets/sprite/boy/legs/p_pelvis_walk.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/legs/p_thigh_a.png", "assets/sprite/boy/legs/p_thigh_a.png");
		type.set ("assets/sprite/boy/legs/p_thigh_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/legs/p_thigh_idle_0.png", "assets/sprite/boy/legs/p_thigh_idle_0.png");
		type.set ("assets/sprite/boy/legs/p_thigh_idle_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/legs/p_thigh_walk_0.png", "assets/sprite/boy/legs/p_thigh_walk_0.png");
		type.set ("assets/sprite/boy/legs/p_thigh_walk_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/torso/p_torso_front.png", "assets/sprite/boy/torso/p_torso_front.png");
		type.set ("assets/sprite/boy/torso/p_torso_front.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/torso/p_torso_idle.png", "assets/sprite/boy/torso/p_torso_idle.png");
		type.set ("assets/sprite/boy/torso/p_torso_idle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/torso/p_torso_jump.png", "assets/sprite/boy/torso/p_torso_jump.png");
		type.set ("assets/sprite/boy/torso/p_torso_jump.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/torso/p_torso_punch_0.png", "assets/sprite/boy/torso/p_torso_punch_0.png");
		type.set ("assets/sprite/boy/torso/p_torso_punch_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/boy/torso/p_torso_walk.png", "assets/sprite/boy/torso/p_torso_walk.png");
		type.set ("assets/sprite/boy/torso/p_torso_walk.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/brawler/brawler.scml", "assets/sprite/brawler/brawler.scml");
		type.set ("assets/sprite/brawler/brawler.scml", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("assets/sprite/brawler/Brawler_flats_backhand.png", "assets/sprite/brawler/Brawler_flats_backhand.png");
		type.set ("assets/sprite/brawler/Brawler_flats_backhand.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/brawler/Brawler_flats_bigfoot.png", "assets/sprite/brawler/Brawler_flats_bigfoot.png");
		type.set ("assets/sprite/brawler/Brawler_flats_bigfoot.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/brawler/Brawler_flats_body.png", "assets/sprite/brawler/Brawler_flats_body.png");
		type.set ("assets/sprite/brawler/Brawler_flats_body.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/brawler/Brawler_flats_fronthand.png", "assets/sprite/brawler/Brawler_flats_fronthand.png");
		type.set ("assets/sprite/brawler/Brawler_flats_fronthand.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/brawler/Brawler_flats_headclose.png", "assets/sprite/brawler/Brawler_flats_headclose.png");
		type.set ("assets/sprite/brawler/Brawler_flats_headclose.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/brawler/Brawler_flats_headopen.png", "assets/sprite/brawler/Brawler_flats_headopen.png");
		type.set ("assets/sprite/brawler/Brawler_flats_headopen.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/brawler/Brawler_flats_smallfoot.png", "assets/sprite/brawler/Brawler_flats_smallfoot.png");
		type.set ("assets/sprite/brawler/Brawler_flats_smallfoot.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/bullet.png", "assets/sprite/bullet.png");
		type.set ("assets/sprite/bullet.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/creature/gorilla.png", "assets/sprite/creature/gorilla.png");
		type.set ("assets/sprite/creature/gorilla.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/elevator.png", "assets/sprite/elevator.png");
		type.set ("assets/sprite/elevator.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/material.png", "assets/sprite/material.png");
		type.set ("assets/sprite/material.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/materialicon.png", "assets/sprite/materialicon.png");
		type.set ("assets/sprite/materialicon.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/npc/gorilla.png", "assets/sprite/npc/gorilla.png");
		type.set ("assets/sprite/npc/gorilla.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/npc/master.png", "assets/sprite/npc/master.png");
		type.set ("assets/sprite/npc/master.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/player/body.png", "assets/sprite/player/body.png");
		type.set ("assets/sprite/player/body.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/player/header.png", "assets/sprite/player/header.png");
		type.set ("assets/sprite/player/header.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/player/lowerarm.png", "assets/sprite/player/lowerarm.png");
		type.set ("assets/sprite/player/lowerarm.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/player/lowerleg.png", "assets/sprite/player/lowerleg.png");
		type.set ("assets/sprite/player/lowerleg.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/player/upperarm.png", "assets/sprite/player/upperarm.png");
		type.set ("assets/sprite/player/upperarm.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/player/upperleg.png", "assets/sprite/player/upperleg.png");
		type.set ("assets/sprite/player/upperleg.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/player/weapon.png", "assets/sprite/player/weapon.png");
		type.set ("assets/sprite/player/weapon.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/test/armdown_l.png", "assets/sprite/test/armdown_l.png");
		type.set ("assets/sprite/test/armdown_l.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/test/armdown_r.png", "assets/sprite/test/armdown_r.png");
		type.set ("assets/sprite/test/armdown_r.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/test/armup_l.png", "assets/sprite/test/armup_l.png");
		type.set ("assets/sprite/test/armup_l.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/test/armup_r.png", "assets/sprite/test/armup_r.png");
		type.set ("assets/sprite/test/armup_r.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/test/body.png", "assets/sprite/test/body.png");
		type.set ("assets/sprite/test/body.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/test/body_1.png", "assets/sprite/test/body_1.png");
		type.set ("assets/sprite/test/body_1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/test/first.scml", "assets/sprite/test/first.scml");
		type.set ("assets/sprite/test/first.scml", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("assets/sprite/test/foot_l.png", "assets/sprite/test/foot_l.png");
		type.set ("assets/sprite/test/foot_l.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/test/foot_r.png", "assets/sprite/test/foot_r.png");
		type.set ("assets/sprite/test/foot_r.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/test/gun.png", "assets/sprite/test/gun.png");
		type.set ("assets/sprite/test/gun.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/test/head.png", "assets/sprite/test/head.png");
		type.set ("assets/sprite/test/head.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/test/hoe.png", "assets/sprite/test/hoe.png");
		type.set ("assets/sprite/test/hoe.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/test/legdown_l.png", "assets/sprite/test/legdown_l.png");
		type.set ("assets/sprite/test/legdown_l.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/test/legdown_r.png", "assets/sprite/test/legdown_r.png");
		type.set ("assets/sprite/test/legdown_r.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/test/legup_l.png", "assets/sprite/test/legup_l.png");
		type.set ("assets/sprite/test/legup_l.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/test/legup_r.png", "assets/sprite/test/legup_r.png");
		type.set ("assets/sprite/test/legup_r.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/test/sword.png", "assets/sprite/test/sword.png");
		type.set ("assets/sprite/test/sword.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/test/tool.png", "assets/sprite/test/tool.png");
		type.set ("assets/sprite/test/tool.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/thrust_ship.png", "assets/sprite/thrust_ship.png");
		type.set ("assets/sprite/thrust_ship.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/sprite/tree.png", "assets/sprite/tree.png");
		type.set ("assets/sprite/tree.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/tiled/backdrop.png", "assets/tiled/backdrop.png");
		type.set ("assets/tiled/backdrop.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/tiled/backdropMini.png", "assets/tiled/backdropMini.png");
		type.set ("assets/tiled/backdropMini.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/tiled/coin.png", "assets/tiled/coin.png");
		type.set ("assets/tiled/coin.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/tiled/level.png", "assets/tiled/level.png");
		type.set ("assets/tiled/level.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/tiled/level.tmx", "assets/tiled/level.tmx");
		type.set ("assets/tiled/level.tmx", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("assets/tiled/mapCSV_Group1_background.csv", "assets/tiled/mapCSV_Group1_background.csv");
		type.set ("assets/tiled/mapCSV_Group1_background.csv", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("assets/tiled/mapCSV_Group1_Map1.csv", "assets/tiled/mapCSV_Group1_Map1.csv");
		type.set ("assets/tiled/mapCSV_Group1_Map1.csv", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("assets/tiled/mapCSV_Group1_tiled.csv", "assets/tiled/mapCSV_Group1_tiled.csv");
		type.set ("assets/tiled/mapCSV_Group1_tiled.csv", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("assets/tiled/miniPlanet.png", "assets/tiled/miniPlanet.png");
		type.set ("assets/tiled/miniPlanet.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/tiled/planet.dam", "assets/tiled/planet.dam");
		type.set ("assets/tiled/planet.dam", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("assets/tiled/planet.dam.bak", "assets/tiled/planet.dam.bak");
		type.set ("assets/tiled/planet.dam.bak", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("assets/tiled/planet.png", "assets/tiled/planet.png");
		type.set ("assets/tiled/planet.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/tiled/point.dam", "assets/tiled/point.dam");
		type.set ("assets/tiled/point.dam", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("assets/tiled/point.dam.bak", "assets/tiled/point.dam.bak");
		type.set ("assets/tiled/point.dam.bak", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("assets/tiled/point.png", "assets/tiled/point.png");
		type.set ("assets/tiled/point.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/tiled/pointMini.png", "assets/tiled/pointMini.png");
		type.set ("assets/tiled/pointMini.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/tiled/tiles.png", "assets/tiled/tiles.png");
		type.set ("assets/tiled/tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/tiled/waterTest.txt", "assets/tiled/waterTest.txt");
		type.set ("assets/tiled/waterTest.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/ui/dialog_box.png", "assets/ui/dialog_box.png");
		type.set ("assets/ui/dialog_box.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/ui/inventory.png", "assets/ui/inventory.png");
		type.set ("assets/ui/inventory.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/ui/sign.png", "assets/ui/sign.png");
		type.set ("assets/ui/sign.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/xml/play.xml", "assets/xml/play.xml");
		type.set ("assets/xml/play.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/xml/popup_demo.xml", "assets/xml/popup_demo.xml");
		type.set ("assets/xml/popup_demo.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/xml/popup_simple.xml", "assets/xml/popup_simple.xml");
		type.set ("assets/xml/popup_simple.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/xml/state_battle.xml", "assets/xml/state_battle.xml");
		type.set ("assets/xml/state_battle.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/xml/state_default.xml", "assets/xml/state_default.xml");
		type.set ("assets/xml/state_default.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/xml/state_menu.xml", "assets/xml/state_menu.xml");
		type.set ("assets/xml/state_menu.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/xml/state_save.xml", "assets/xml/state_save.xml");
		type.set ("assets/xml/state_save.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/xml/state_title.xml", "assets/xml/state_title.xml");
		type.set ("assets/xml/state_title.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/xml/_ui_globals.xml", "assets/xml/_ui_globals.xml");
		type.set ("assets/xml/_ui_globals.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		
		
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
		
		//return null;		
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
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
	
	
}


#if pixi
#elseif flash

class __ASSET__flixel_img_debugger_buttons_console_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_drawdebug_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_logdebug_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_open_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_pause_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_play_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_record_off_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_record_on_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_restart_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_statsdebug_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_step_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_stop_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_watchdebug_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_flixel_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_windowhandle_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_logo_haxeflixel_svg extends null { }
class __ASSET__flixel_img_logo_logo_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_preloader_corners_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_preloader_light_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_tile_autotiles_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_tile_autotiles_alt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_analog_base_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_analog_thumb_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_fontdata11pt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_a_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_b_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_c_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_down_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_left_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_right_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_up_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_x_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_y_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_snd_beep_wav extends null { }
class __ASSET__flixel_snd_flixel_wav extends null { }
class __ASSET__flixel_img_napedebug_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_flixel_ui_img_box_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_flixel_ui_img_button_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_flixel_ui_img_button_thin_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_flixel_ui_img_button_toggle_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_flixel_ui_img_check_box_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_flixel_ui_img_check_mark_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_flixel_ui_img_chrome_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_flixel_ui_img_hilight_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_flixel_ui_img_invis_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_flixel_ui_img_radio_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_flixel_ui_img_radio_dot_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_flixel_ui_img_tab_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_flixel_ui_img_tab_back_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_flixel_ui_xml_defaults_xml extends null { }
class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends null { }
class __ASSET__assets_data_glow_light_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_fonts_vera_ttf extends null { }
class __ASSET__assets_fonts_verab_ttf extends null { }
class __ASSET__assets_fonts_verai_ttf extends null { }
class __ASSET__assets_fonts_veraz_ttf extends null { }
class __ASSET__assets_gfx_other_icon_party_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_other_portrait_mane_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_blue_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_blue_back_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_blue_back_over_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_blue_over_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_button_blue_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_button_blue_toggle_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_button_confirmation_black_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_button_confirmation_over_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_button_confirmation_red_over_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_button_confirmation_red_up_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_button_confirmation_up_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_button_gold_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_button_gold_up_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_button_grey_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_button_red_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_gold_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_gold_over_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_grey_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_grey_over_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_red_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_red_over_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_tab_grey_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_tab_grey_back_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_tab_grey_back_over_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_buttons_tab_grey_over_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_chrome_dark_grey_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_chrome_dark_grey_flat_top_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_chrome_dark_grey_inset_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_chrome_dark_grey_texture_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_misc_check_big_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_misc_check_box_big_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_misc_check_box_small_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_misc_check_small_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_misc_flag_blank_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_misc_health_bar_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_misc_mana_bar_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_misc_radio_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_misc_radio_dot_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_saveslot_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_saveslot_shadow_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_save_menu_overlay_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_gfx_ui_title_back_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_haxeflixel_svg extends null { }
class __ASSET__assets_locales_en_us_fonts_xml extends null { }
class __ASSET__assets_locales_en_us_ui_csv extends null { }
class __ASSET__assets_locales_index_xml extends null { }
class __ASSET__assets_locales_nb_no_fonts_xml extends null { }
class __ASSET__assets_locales_nb_no_ui_csv extends null { }
class __ASSET__assets_locales__flags_cs_cz_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_locales__flags_de_de_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_locales__flags_en_ca_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_locales__flags_en_gb_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_locales__flags_en_us_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_locales__flags_es_es_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_locales__flags_fr_fr_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_locales__flags_it_it_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_locales__flags_ja_jp_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_locales__flags_ko_kr_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_locales__flags_nb_no_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_locales__flags_pl_pl_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_locales__flags_yo_da_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_menu_border_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_menu_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_menu_logos_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_menu_version_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_arms_p_arm_idle_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_arms_p_arm_idle_a_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_arms_p_arm_slide_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_arms_p_arm_throw_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_arms_p_arm_walk_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_arms_p_forarm_idle_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_arms_p_forarm_idle_a_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_arms_p_forarm_jump_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_arms_p_forarm_side_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_arms_p_forarm_under_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_arms_p_forarm_walk_a_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_arms_throw_blur_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_feet_p_foot_hit_a_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_feet_p_foot_hot_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_feet_p_foot_idle_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_feet_p_foot_jump_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_feet_p_foot_walk_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_feet_p_foot_walk_a_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_first_scml extends null { }
class __ASSET__assets_sprite_boy_hands_p_hand_1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_2_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_a_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_a_edge_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_b_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_c_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_edge_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_float_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_hang_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_hang_1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_hang_a_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_hit_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_hit_a_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_idle_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_jump_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_jump_a_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_prepunch_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_prepunch_x_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_punch_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_push_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_push_a_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_slide_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_hand_throw_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_hands_p_punch_blur_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_head_p_head_blink_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_head_p_head_blink_1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_head_p_head_concern_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_head_p_head_concern_blink_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_head_p_head_concern_blink_1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_head_p_head_die_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_head_p_head_hurt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_head_p_head_idle_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_head_p_head_idle_blink_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_head_p_head_idle_blink_1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_head_p_head_push_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_head_p_head_turn_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_head_p_head_walk_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_legs_p_leg_a_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_legs_p_leg_idle_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_legs_p_leg_walk_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_legs_p_pelvis_die_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_legs_p_pelvis_idle_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_legs_p_pelvis_walk_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_legs_p_thigh_a_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_legs_p_thigh_idle_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_legs_p_thigh_walk_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_torso_p_torso_front_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_torso_p_torso_idle_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_torso_p_torso_jump_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_torso_p_torso_punch_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_boy_torso_p_torso_walk_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_brawler_brawler_scml extends null { }
class __ASSET__assets_sprite_brawler_brawler_flats_backhand_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_brawler_brawler_flats_bigfoot_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_brawler_brawler_flats_body_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_brawler_brawler_flats_fronthand_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_brawler_brawler_flats_headclose_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_brawler_brawler_flats_headopen_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_brawler_brawler_flats_smallfoot_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_bullet_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_creature_gorilla_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_elevator_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_material_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_materialicon_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_npc_gorilla_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_npc_master_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_player_body_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_player_header_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_player_lowerarm_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_player_lowerleg_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_player_upperarm_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_player_upperleg_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_player_weapon_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_test_armdown_l_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_test_armdown_r_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_test_armup_l_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_test_armup_r_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_test_body_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_test_body_1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_test_first_scml extends null { }
class __ASSET__assets_sprite_test_foot_l_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_test_foot_r_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_test_gun_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_test_head_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_test_hoe_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_test_legdown_l_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_test_legdown_r_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_test_legup_l_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_test_legup_r_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_test_sword_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_test_tool_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_thrust_ship_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_sprite_tree_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_tiled_backdrop_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_tiled_backdropmini_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_tiled_coin_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_tiled_level_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_tiled_level_tmx extends null { }
class __ASSET__assets_tiled_mapcsv_group1_background_csv extends null { }
class __ASSET__assets_tiled_mapcsv_group1_map1_csv extends null { }
class __ASSET__assets_tiled_mapcsv_group1_tiled_csv extends null { }
class __ASSET__assets_tiled_miniplanet_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_tiled_planet_dam extends null { }
class __ASSET__assets_tiled_planet_dam_bak extends null { }
class __ASSET__assets_tiled_planet_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_tiled_point_dam extends null { }
class __ASSET__assets_tiled_point_dam_bak extends null { }
class __ASSET__assets_tiled_point_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_tiled_pointmini_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_tiled_tiles_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_tiled_watertest_txt extends null { }
class __ASSET__assets_ui_dialog_box_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_ui_inventory_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_ui_sign_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_xml_play_xml extends null { }
class __ASSET__assets_xml_popup_demo_xml extends null { }
class __ASSET__assets_xml_popup_simple_xml extends null { }
class __ASSET__assets_xml_state_battle_xml extends null { }
class __ASSET__assets_xml_state_default_xml extends null { }
class __ASSET__assets_xml_state_menu_xml extends null { }
class __ASSET__assets_xml_state_save_xml extends null { }
class __ASSET__assets_xml_state_title_xml extends null { }
class __ASSET__assets_xml__ui_globals_xml extends null { }


#elseif html5



























































class __ASSET__assets_fonts_vera_ttf extends flash.text.Font { }
class __ASSET__assets_fonts_verab_ttf extends flash.text.Font { }
class __ASSET__assets_fonts_verai_ttf extends flash.text.Font { }
class __ASSET__assets_fonts_veraz_ttf extends flash.text.Font { }



















































































































































































































#end