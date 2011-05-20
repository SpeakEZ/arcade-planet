////////////////////////////////////////////////////////////////////////////////
//
// 	MIDDLEBURY INTERACTIVE LANGUAGES
//  Copyright 2011 Middlebury Interactive Languages
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////
package
{
	
	import com.middlebury.game.Assets;
	import com.middlebury.game.HeroControllerComponent;
	import com.middlebury.game.controller.EntityFactory;
	import com.middlebury.game.controller.ScoreController;
	import com.middlebury.game.data.Score;
	import com.middlebury.game.display.Display;
	import com.middlebury.game.display.GameScreen;
	import com.middlebury.game.display.RenderObject;
	import com.middlebury.game.events.ScoreEvent;
	import com.pblabs.box2D.Box2DSpatialComponent;
	import com.pblabs.engine.PBE;
	import com.pblabs.engine.core.LevelManager;
	import com.pblabs.engine.entity.IEntity;
	import com.pblabs.engine.entity.PropertyReference;
	import com.pblabs.rendering2D.MovieClipRenderer;
	import com.pblabs.rendering2D.SimpleShapeRenderer;
	import com.pblabs.rendering2D.SpriteRenderer;
	import com.pblabs.rendering2D.ui.SceneView;
	import com.pblabs.screens.ScreenManager;
	
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
			// first, register all classes that are referenced in the xml
			PBE.registerType(com.pblabs.rendering2D.MovieClipRenderer);
			PBE.registerType(com.pblabs.rendering2D.SimpleShapeRenderer);
			PBE.registerType(com.pblabs.rendering2D.SimpleSpatialComponent);
			PBE.registerType(com.pblabs.rendering2D.SpriteRenderer);
			PBE.registerType(com.pblabs.rendering2D.ui.SceneView);
			PBE.registerType(com.pblabs.box2D.Box2DSpatialComponent);
			PBE.registerType(com.middlebury.game.HeroControllerComponent);
			
			PBE.startup(this);
			PBE.addResources(new Assets());
			// setup our scene (defaults to size of stage)
			PBE.initializeScene(new SceneView(), "flyIt");
			
			// load first leve from xml
			LevelManager.instance.load("assets/LevelDescriptions.xml", 1);
			
			// Create terrain
			createTerrain();
			
			// initialize score
			createScore();
			
			// initialize lives
			createLives();
			
			ScreenManager.instance.registerScreen("game", new GameScreen(score));
			ScreenManager.instance.goto("game");
		}
		

		private function createTerrain():void
		{
			PBE.defineEntityByFunction("Terrain",EntityFactory.CreateTerrain);
			PBE.makeEntity("Terrain");
		}
		
		
		// Initialize the score controller
		private function createScore():void
		{
			// Setup score controller and default test score
			var testScore:Score = new Score();
			testScore.score = 100;
			this.score = new ScoreController(this,testScore);
		}
		
		private var maxLives:int = 6;
		private function createLives():void
		{
			for(var i:int = 1; i < maxLives; i++) {
				PBE.defineEntityByFunction("Life"+EntityFactory.lives, EntityFactory.AddLife);
				PBE.makeEntity("Life"+EntityFactory.lives);
			}
		}

	}
}