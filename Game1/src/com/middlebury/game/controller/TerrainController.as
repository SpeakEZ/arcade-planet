////////////////////////////////////////////////////////////////////////////////
//
// 	MIDDLEBURY INTERACTIVE LANGUAGES
//  Copyright 2011 Middlebury Interactive Languages
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////
package com.middlebury.game.controller
{
	import com.pblabs.engine.PBE;
	import com.pblabs.engine.components.TickedComponent;
	import com.pblabs.engine.core.InputKey;
	import com.pblabs.engine.entity.IEntity;
	import com.pblabs.engine.entity.PropertyReference;
	
	import flash.geom.Point;
	
	/**
	 * <p>Background image controller. onTick updates background.</p>
	 * @see com.pblabs.engine.components.TickedComponent
	 * @author geo
	 * 
	 */	
	public class TerrainController extends TickedComponent
	{
		public var pr:PropertyReference = new PropertyReference("@Spatial.position");
		
		public var xDriftSpeed:Number;
		public var yDriftSpeed:Number;
		
		public var mouseEffectX:Number;
		public var mouseEffectY:Number;
		
		protected var position:Point;
		protected var newPosition:Point = new Point();
		
		public override function onTick(tickRate:Number):void
		{
			super.onTick(tickRate);
			
			// Get references for our spatial position.
			position = owner.getProperty(pr);
			newPosition.x = position.x;
			newPosition.y = position.y;
			
			// Look at our input keys to see which direction we should move. Left is -x, right is +x.
			if (PBE.isKeyDown(InputKey.RIGHT))
				newPosition.x += mouseEffectX;
			else if (PBE.isKeyDown(InputKey.LEFT))
				newPosition.x -= mouseEffectX;
			
			if (PBE.isKeyDown(InputKey.UP))
				newPosition.y -= mouseEffectY;
			else if (PBE.isKeyDown(InputKey.DOWN))
				newPosition.y += mouseEffectY;
			
			// Move x as player moves, don't move y?
			newPosition = new Point(newPosition.x + xDriftSpeed, newPosition.y + yDriftSpeed);
			
			
			// Send our manipulated spatial variables back to the spatial manager
			owner.setProperty(pr, newPosition);
		}
	}
}