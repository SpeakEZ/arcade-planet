////////////////////////////////////////////////////////////////////////////////
//
// 	MIDDLEBURY INTERACTIVE LANGUAGES
//  Copyright 2011 Middlebury Interactive Languages
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////
package com.middlebury.game.display
{
	import com.middlebury.game.data.IScore;
	import com.pblabs.engine.PBE;
	import com.pblabs.engine.core.LevelManager;
	import com.pblabs.engine.entity.IEntity;
	import com.pblabs.engine.entity.PropertyReference;
	import com.pblabs.rendering2D.SimpleShapeRenderer;
	import com.pblabs.rendering2D.SimpleSpatialComponent;
	import com.pblabs.rendering2D.ui.PBLabel;
	import com.pblabs.rendering2D.ui.SceneView;
	import com.pblabs.screens.BaseScreen;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextFormatAlign;
	
	/**
	 * <p>Game Screen contains scoreboard.</p>
	 *  
	 * @author geo
	 * 
	 */	
	public class GameScreen extends BaseScreen
	{
		public var sceneView:SceneView = new SceneView();
		public var lblScore:PBLabel = new PBLabel();
		public var lblLives:PBLabel = new PBLabel();
		public var score:IScore;
		
		public function GameScreen(score:IScore)
		{
			super();
			
			this.score = score;
			
			// Set up the scene view to be full screen.
			sceneView.name = "MainView";
			sceneView.width = 800;
			sceneView.height = 500;
			addChild(sceneView);
			
			// Score indicator (also a label).
			addChild(lblScore);
			lblScore.extents = new Rectangle(0, 0, 150, 30);
			lblScore.fontColor = 0xffffff;
			lblScore.fontSize = 24;
			lblScore.fontAlign = TextFormatAlign.LEFT;
			lblScore.refresh();
			
			// Lives label
			addChild(lblLives);
			lblLives.extents = new Rectangle(0, 25, 150, 30);
			lblLives.fontColor = 0xffffff;
			lblLives.fontSize = 18;
			lblLives.fontAlign = TextFormatAlign.LEFT;
			lblLives.caption = "Lives: ";
			lblLives.refresh();
			
		}
		
		private function getLifeIcon():SimpleShapeRenderer
		{
			var life:SimpleShapeRenderer = new SimpleShapeRenderer();
			life.fillColor = 0x0000FF0;
			life.isCircle = true;
			life.lineSize = 2;
			life.radius = 25;
			life.lineColor = 0x000000;
			return life;
		}
		
		public override function onShow() : void
		{
			// do nothing
		}
		
		/**
		 * Called every frame; used to update time remaining and score. Only display
		 * aspects of the game are updated here. You will notice that currentTime
		 * is updated; that is so it is always super-smooth, but the gameplay
		 * logic happens in onTick.
		 */
		public override function onFrame(delta:Number) : void
		{	
			// Update score.
			lblScore.caption = "Score: "+score.total;
			lblScore.refresh();
		}
		/**
		 * Gameplay logic happens here; in this game, the only thing is to check
		 * if the user is out of time.
		 */
		public override function onTick(delta:Number) : void
		{		
			// do nothing
		}
	}
}