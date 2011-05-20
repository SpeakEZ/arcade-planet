package
{
	import Lesson5Final.src.HeroControllerComponent;
	
	import com.middlebury.game.Assets;
	import com.middlebury.game.display.Display;
	import com.middlebury.game.display.RenderObject;
	import com.pblabs.engine.PBE;
	import com.pblabs.engine.entity.IEntity;
	import com.pblabs.engine.entity.PropertyReference;
	import com.pblabs.rendering2D.MovieClipRenderer;
	import com.pblabs.rendering2D.SimpleSpatialComponent;
	import com.pblabs.rendering2D.SpriteRenderer;
	import com.pblabs.rendering2D.ui.SceneView;
	
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	 * @author 		Stephen Felt
	 * @date 		2011 May 14
	 */
	[SWF(width="800", height="500", frameRate="60")]
	public class Fly extends Sprite
	{
		public function Fly()
		{
			setupTheGame();
		}
		
		/**
		 * get the game going
		 */
		private function setupTheGame():void
		{
			// Start up PBE
			PBE.startup(this);
		
			// Load up our embedded resources
			PBE.addResources(new Assets());
			
			// Set up a simple scene entity
			createScene();
			
			// Create an avatar entity
			createHero();
			
			// Create a simple background entity
			createBackground();
		}
		
		private function createScene():void 
		{
			var sceneView:SceneView = new SceneView();
			sceneView.width = 800;
			sceneView.height = 500;
			
			PBE.initializeScene(sceneView);          
		}
		
		
		private function createHero():void
		{
			// Allocate an entity for our hero avatar
			var hero:IEntity = PBE.allocateEntity();
			
			// Add our spatial component to the Hero entity ...
			createSpatial( hero,
				// with location of 0,150...
				new Point(0, 150),
				// and with size of 60,53...
				new Point(30, 26)
			);
			
			// Create a simple render component to display our object
			
			// Here we've removed the reference to our simple shape renderer, and added a sprite render component.
			var render:MovieClipRenderer = new MovieClipRenderer();
			
			// Tell the Render component to use one of the images embedded by our ResourceBundle
			render.fileName = "assets/alien.swf";
			
			// Add the renderer to the scene.
			render.scene = PBE.scene;
			
			// Set our hero to render above the background.
			render.layerIndex = 10;
			
			// Point the render component to this entity's Spatial component for position information
			render.positionProperty = new PropertyReference("@Spatial.position");
			// Point the render component to this entity's Spatial component for size information
			render.sizeProperty = new PropertyReference("@Spatial.size");
			
			// Add our render component to the Hero entity with the name "Render"
			hero.addComponent( render, "Render" );
			
			// Create an instance of our hero controller component
			var controller:HeroControllerComponent = new HeroControllerComponent();
			// Point the controller component to this entity's Spatial component for position information
			controller.positionReference = new PropertyReference("@Spatial.position");
			
			// Add the demo controller component to the Hero entity with the name "Controller"
			hero.addComponent( controller, "Controller" );
			
			// Register the entity with PBE under the name "Hero"
			hero.initialize("Hero");
		}
		
		private function createBackground():void
		{
			// Allocate an entity for our background sprite
			var bg:IEntity = PBE.allocateEntity();
			
			// Add our spatial component to the background entity ...
			createSpatial( bg, 
				// with location of 0,0...
				new Point(0, 0)
			);
			var render:RenderObject 
			= new RenderObject(
				"Render",  					// Component name
				"assets/bg_sunset2.jpg", 	// Component asset
				1,  						// Component layer
				PBE.scene,					// Component scene
				"@Spatial.position"			// Component position
			);
			var terrain:Display 
				= new Display(render);
				
			// Add our render component to the BG entity with the name "Render"
			bg.addComponent( terrain, terrain.renderObject.name );
	
			// Register the entity with PBE under the name "BG"
			bg.initialize("BG");         
		}

		// This is a shortcut function to help simplify the creation of spatial components
		private function createSpatial( ent:IEntity, pos:Point, size:Point = null ):void
		{
			// Create our spatial component
			var spatial:SimpleSpatialComponent = new SimpleSpatialComponent();
			
			// Do a named lookup to register our background with the scene spatial database
			spatial.spatialManager = PBE.spatialManager;
			
			// Set our background position in space
			spatial.position = pos;
			
			if (size != null) 
				spatial.size = size;
			
			ent.addComponent(spatial, "Spatial");
		}



	}
}