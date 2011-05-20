package com.middlebury.game.controller
{
	import com.pblabs.engine.components.TickedComponent;
	import com.pblabs.engine.entity.PropertyReference;
	import com.pblabs.rendering2D.MovieClipRenderer;
	
	import flash.geom.Point;
	
	public class BackgroundController extends TickedComponent
	{
		public var TrackObject:MovieClipRenderer = null;
		public var BGImagePositionReference:PropertyReference = null;
		public var MovementScale:Number = 1;
		public function BackgroundController()
		{
			super();
		}
		
		public override function onTick(tickRate:Number):void
		{
			super.onTick(tickRate);
			
			var playerPosition:Point = TrackObject.renderPosition;
			
			var bgPosition:Point = new Point(
				(playerPosition.x * MovementScale), 
				(playerPosition.y * MovementScale));
			
			owner.setProperty(BGImagePositionReference, bgPosition);			
		}
	}
}