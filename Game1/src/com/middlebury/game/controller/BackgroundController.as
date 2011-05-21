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
	import com.pblabs.engine.entity.IEntity;
	import com.pblabs.engine.entity.PropertyReference;
	
	import flash.geom.Point;

	/**
	 * <p>Background image controller. onTick updates background.</p>
	 * @see com.pblabs.engine.components.TickedComponent
	 * @author geo
	 * 
	 */	
	public class BackgroundController extends TickedComponent
	{
		public var pr:PropertyReference = new PropertyReference("@Spatial.position");
		public var movement:Number;
		protected var hero:IEntity;
		protected var position:Point;
		protected var playerPosition:Point;
		protected var newPosition:Point;
		
		public override function onTick(tickRate:Number):void
		{
			super.onTick(tickRate);
			if(!hero)
				hero = PBE.lookup("Hero") as IEntity;
			
			// Get references for our spatial position.
			position = owner.getProperty(pr);
			playerPosition = hero.getProperty(pr);
			
			// Move x as player moves, don't move y?
			var newPosition:Point = new Point((playerPosition.x * movement), (playerPosition.y * movement));
			
			// Send our manipulated spatial variables back to the spatial manager
			owner.setProperty(pr, newPosition);
		}
	}
}