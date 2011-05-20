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
	import com.pblabs.rendering2D.ui.PBLabel;
	import com.pblabs.rendering2D.ui.SceneView;
	import com.pblabs.screens.BaseScreen;
	
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
		public var score:IScore;
		
		public function GameScreen(score:IScore)
		{
			super();
			
			this.score = score;
			
			// Set up the scene view to be full screen.
			sceneView.name = "MainView";
			sceneView.width = 640;
			sceneView.height = 480;
			addChild(sceneView);
			
			// Score indicator (also a label).
			addChild(lblScore);
			lblScore.extents = new Rectangle(25, 0, 150, 30);
			lblScore.fontColor = 0xffffff;
			lblScore.fontSize = 24;
			lblScore.fontAlign = TextFormatAlign.RIGHT;
			lblScore.refresh();
		}
		
		public override function onShow() : void
		{
			// ?
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
			// score?
		}
	}
}