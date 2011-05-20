////////////////////////////////////////////////////////////////////////////////
//
// 	MIDDLEBURY INTERACTIVE LANGUAGES
//  Copyright 2011 Middlebury Interactive Languages
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////
package com.middlebury.game.controller
{
	import com.middlebury.game.display.Display;
	import com.middlebury.game.display.RenderObject;
	import com.pblabs.box2D.Box2DSpatialComponent;
	import com.pblabs.engine.PBE;
	import com.pblabs.engine.core.NameManager;
	import com.pblabs.engine.entity.EntityComponent;
	import com.pblabs.engine.entity.IEntity;
	import com.pblabs.engine.entity.PropertyReference;
	import com.pblabs.rendering2D.MovieClipRenderer;
	import com.pblabs.rendering2D.SimpleSpatialComponent;
	import com.pblabs.rendering2D.SpriteRenderer;
	
	import flash.geom.Point;

	public class EntityFactory
	{
		
		// Life static variables
		public static var lives:int = 1;
		private static var livesStartPt:Point = new Point(-355,-215);
		private static var lifeSize:Point = new Point(10,10);
		
		/**
		 * <p>Add a life incrementing lives after.</p> 
		 * @return 
		 * 
		 */		
		public static function AddLife():IEntity
		{
			// Generate a life element
			var entity:IEntity = generateLife("Life"+lives, lives);     
			
			// Increment lives
			lives++;
			return entity;			
		}
		
		/**
		 * <p>Generate a life entity and return it.</p>
		 *  
		 * @param name
		 * @param life
		 * @return 
		 * 
		 */		
		private static function generateLife(name:String,life:int):IEntity
		{
			var entity:IEntity = PBE.allocateEntity();                                 
			entity.initialize(name);      
			
			// life position slide over by width
			livesStartPt.x -= -lifeSize.x;
			
			// Get a entity component
			var spatial:Box2DSpatialComponent = getSpatialComponent(livesStartPt,lifeSize);
			
			// Create a render object give it an asset, layer and scene
			var render:RenderObject 
			= new RenderObject("assets/dot.png",life,PBE.scene);
			
			// Create render display object
			var lfe:Display = new Display(render);
			
			entity.addComponent(spatial, "Spatial"); 
			entity.addComponent( lfe, lfe.renderObject.name );                                                                       
			
			return entity;		
		}
		
		/**
		 * <p>Generate a spatial 2d component for use with lives.</p> 
		 * @param pos
		 * @param size
		 * @return 
		 * 
		 */		
		private static function getSpatialComponent(pos:Point,size:Point):Box2DSpatialComponent
		{
			var spatial:Box2DSpatialComponent = new Box2DSpatialComponent();
			spatial.canMove = false;
			spatial.canRotate = false;
			spatial.position = pos;
			spatial.size = size;
			return spatial;
		}
		
		/**
		 * <p>Create the background entity.</p> 
		 * @return 
		 * 
		 */		
		public static function CreateBackground():IEntity
		{
			// Allocate an entity for our background sprite
			var entity:IEntity = PBE.allocateEntity();
			entity.initialize("BG");
			
			var spatial:Box2DSpatialComponent = new Box2DSpatialComponent();
			spatial.canMove = false;
			spatial.canRotate = false;
			spatial.position = new Point(0,0);
			// Create a render object give it an asset, layer and scene
			var render:RenderObject 
				= new RenderObject("assets/bg_space.png",1,PBE.scene);
				
			// Create render display object
			var terrain:Display = new Display(render);
			
			// Add our render component to the BG entity with the name "Render"
			entity.addComponent(spatial, "Spatial"); 
			entity.addComponent( terrain, terrain.renderObject.name );
			
			var playerRender:MovieClipRenderer = PBE.lookupComponentByName(
				"Hero", "Render") as MovieClipRenderer;    
			
			var bgController:BackgroundController = new BackgroundController();
			bgController.TrackObject = playerRender; 
			bgController.BGImagePositionReference = new PropertyReference("@Spatial.position");
			bgController.MovementScale = 0.3;
			entity.addComponent(bgController, "BackgroundController");
			
			return entity;
		}
	}
}