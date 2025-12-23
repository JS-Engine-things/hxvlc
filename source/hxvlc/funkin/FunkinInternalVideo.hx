package hxvlc.funkin;

import hxvlc.flixel.FlxInternalVideo;
import flixel.FlxG;

@:nullSafety
class FunkinInternalVideo extends FlxInternalVideo
{
  public var autoPause:Bool = true; // literally to just fix one measily little issue

  @:noCompletion
  override function onFocusLost():Void
  {
    #if !mobile
    if (!FlxG.autoPause) return;
    #end

    if (autoPause)
    {
      resumeOnFocus = isPlaying;
      pause();
    }
    else
      resumeOnFocus = false;

    super.onFocusLost();
  }
}