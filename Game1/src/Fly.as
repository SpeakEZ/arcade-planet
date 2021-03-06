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
	import com.middlebury.game.controller.QuestionController;
	import com.middlebury.game.controller.ScoreController;
	import com.middlebury.game.controller.TerrainController;
	import com.middlebury.game.data.Score;
	import com.middlebury.game.display.GameScreen;
	import com.middlebury.game.display.QuestionScreen;
	import com.pblabs.engine.PBE;
	import com.pblabs.engine.core.LevelManager;
	import com.pblabs.rendering2D.MovieClipRenderer;
	import com.pblabs.rendering2D.SimpleShapeRenderer;
	import com.pblabs.rendering2D.SpriteRenderer;
	import com.pblabs.rendering2D.ui.SceneView;
	import com.pblabs.screens.ScreenManager;
	
	import flash.display.Sprite;
	
	/**
	 * @author 		Stephen Felt
	 * @date 		2011 May 14
	 */
	[SWF(width="800", height="500", frameRate="60")]
	public class Fly extends Sprite
	{
		
		protected var score:ScoreController;
		protected var questions:QuestionController;

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
			
			PBE.registerType(com.middlebury.game.HeroControllerComponent);
			PBE.registerType(com.middlebury.game.controller.BackgroundController);
			PBE.registerType(com.middlebury.game.controller.TerrainController);
			PBE.registerType(com.middlebury.game.controller.QuestionController);
			
			PBE.startup(this);
			PBE.addResources(new Assets());
			// setup our scene (defaults to size of stage)
			PBE.initializeScene(new SceneView(), "FlySceneView");
			
			// load first leve from xml
			LevelManager.instance.load("assets/LevelDescriptions.xml", 1);
			
			// initialize score
			createScore();
			
			// initialize lives
			createLives();
			
			// init question collection
			createQuestions();
			
			// prepare the question screen
			ScreenManager.instance.registerScreen("question", new QuestionScreen());
			
			ScreenManager.instance.registerScreen("game", new GameScreen(score));
			ScreenManager.instance.goto("game");
			
		}
		
		
		private function createScene():void 
		{
			var sceneView:SceneView = new SceneView();
			sceneView.width = 800;
			sceneView.height = 500;
			   
			PBE.initializeScene(sceneView);          
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
		
		protected function createQuestions():void
		{
			this.questions = new QuestionController();
		}

	}
}