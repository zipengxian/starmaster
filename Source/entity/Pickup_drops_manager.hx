package objects.pickups
{
    import org.flixel.*;
 
    public class Pickup_drops_manager extends FlxGroup {
        
        public function Pickup_drops_manager() {
            super();

            for (var i:int = 0; i < 500; i++) {
                add(new Pickup_drop);
            }            
        }



        public function go():void {
            if (getFirstAvailable()) {
                Pickup_drop(getFirstAvailable()).go();
            }

        }        
    }

}