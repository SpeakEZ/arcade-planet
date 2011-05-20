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
	import com.pblabs.engine.entity.IEntity;
	import com.pblabs.engine.entity.PropertyReference;
	import com.pblabs.rendering2D.SimpleSpatialComponent;
	import com.pblabs.rendering2D.SpriteRenderer;
	
	import flash.geom.Point;

	public class EntityFactory
	{
		public static function CreateLives():IEntity
		{
			var entity:IEntity = PBE.allocateEntity();                                 
			entity.initialize("Lives");      
			
			var spatial:Box2DSpatialComponent = new Box2DSpatialComponent();
			spatial.canMove = false;
			spatial.canRotate = false;
			spatial.position = new Point(-345,-215);
			spatial.size = new Point(10,10);
			
			// Create a render object give it an asset, layer and scene
			var render:RenderObject 
				= new RenderObject("assets/dot.png",2,PBE.scene);
				
			// Create render display object
			var life:Display = new Display(render);
			
			entity.addComponent(spatial, "Spatial"); 
			entity.addComponent( life, life.renderObject.name );                                                                       
			
			return entity;			
		}
		
		public static function CreateLives2():IEntity
		{
			var entity:IEntity = PBE.allocateEntity();                                 
			entity.initialize("Lives2");      
			
			var spatial:Box2DSpatialComponent = new Box2DSpatialComponent();
			spatial.canMove = false;
			spatial.canRotate = false;
			spatial.position = new Point(-335,-215);
			spatial.size = new Point(10,10);
			
			// Create a render object give it an asset, layer and scene
			var render:RenderObject 
			= new RenderObject("assets/dot.png",2,PBE.scene);
			
			// Create render display object
			var life:Display = new Display(render);
			
			entity.addComponent(spatial, "Spatial"); 
			entity.addComponent( life, life.renderObject.name );                                                                       
			
			return entity;			
		}
		
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
			
			return entity;
		}
	}
}