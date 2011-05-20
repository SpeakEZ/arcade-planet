////////////////////////////////////////////////////////////////////////////////
//
// 	MIDDLEBURY INTERACTIVE LANGUAGES
//  Copyright 2011 Middlebury Interactive Languages
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////
package com.middlebury.game.controller
{
	import com.pblabs.engine.components.TickedComponent;
	import com.pblabs.engine.entity.PropertyReference;
	import com.pblabs.rendering2D.SpriteRenderer;
	
	import flash.geom.Point;
	
	public class TerrainController extends TickedComponent
	{
		public var trackingObject:SpriteRenderer = null;
		public var positionRef:PropertyReference = null;
		public var movement:Number = 1;
		
		public function TerrainController()
		{
			super();
		}
		
		public override function onTick(tickRate:Number):void
		{
			super.onTick(tickRate);
			
			var playerPosition:Point = trackingObject.renderPosition;
			
			// Move x as player moves, don't move y?
			var bgPosition:Point 
			= new Point((playerPosition.x * -movement), 0);
			
			// Set property on owner background
			owner.setProperty(positionRef, bgPosition);			
		}
	}
}