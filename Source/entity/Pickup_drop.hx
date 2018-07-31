package objects.pickups
{
    import org.flixel.*;
    import objects.*;
    import objects.players.*;
    import objects.pickups.*;
    import background.*;
    
    public class Pickup_drop extends Drop {
        protected static const PLAYER_RUN_SPEED:int = 80;
        protected static var MAX_VELOCITY_Y:Number = -10;
        public var speed:int = 25;

        public function Pickup_drop() {
            
            acceleration.y = gravity_acceleration;
            maxVelocity.y = MAX_VELOCITY_Y;
            scrollFactor.x = scrollFactor.y = 0;
            this.makeGraphic(2, 3, 0xff2525FF);    
            exists = false;
        }
        
        
        
        public function go():void {
            velocity.y = -(speed * Registry.player.drop_speed);
            x = Math.round((Math.random() * FlxG.width));
            y = 0;
            velocity.y = speed;
            exists = true;            
        }

        

        public function taken():void {
            exists = false;
        }

        
        
        public override function update():void {
            velocity.y = (speed * Registry.player.drop_speed);
            super.update();
            if (exists && y > FlxG.height) {
                exists = false;
            }
        }        
    }

}