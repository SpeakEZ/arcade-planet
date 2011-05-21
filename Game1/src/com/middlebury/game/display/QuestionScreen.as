////////////////////////////////////////////////////////////////////////////////
//
// 	MIDDLEBURY INTERACTIVE LANGUAGES
//  Copyright 2011 Middlebury Interactive Languages
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////
package com.middlebury.game.display
{
	import com.middlebury.game.data.IQuestion;
	import com.middlebury.game.data.QuestionMultipleChoice;
	import com.pblabs.rendering2D.SimpleShapeRenderer;
	import com.pblabs.rendering2D.ui.PBLabel;
	import com.pblabs.rendering2D.ui.SceneView;
	import com.pblabs.screens.BaseScreen;
	
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.text.TextFormatAlign;
	
	/**
	 * <p>Question Screen is a canvas for drawing the questions.</p>
	 *  
	 * @author Stephen Felt
	 * @date 2011 May 21
	 * 
	 */	
	public class QuestionScreen extends BaseScreen
	{
		public var sceneView:SceneView;
		public var questionLabel:PBLabel;
		public var questionBackground:RectangleSprite;
		protected var invalidateDisplay:Boolean = false;
		protected var _currentQuestion:IQuestion;
		protected var fullWidth:int = 800;
		protected var questionHeight:int = 60;
		protected var fullHeight:int = 500 - questionHeight;
		protected var bayCumulativeHeight:int = fullHeight - 60;
		protected var drawnBayCount:int = 0;
		
		protected static const bayColorArray:Array = [
				0xef4444, // red
				0xfff000, // yellow
				0x88c63d, // Aspen Breeze cabin sky blue 
				0x82c341, // green
				0xfaa31b, // orange
				0xd54799, // violet
				0x555555 // grey
			];
		
		public function QuestionScreen()
		{
			super();
			
			// Set up the scene view to be full screen.
			sceneView = new SceneView();
			sceneView.name = "QuestionView";
			sceneView.width = 800;
			sceneView.height = 500;
			addChild(sceneView);
				
			//draw a background for the question
			questionBackground = new RectangleSprite();
			questionBackground.extents = new Rectangle(0, 0, fullWidth + 4, questionHeight);
			questionBackground.x = questionBackground.y = -2;
			addChild(questionBackground);
			
			// Score indicator (also a label).
			questionLabel = new PBLabel();
			questionLabel.extents = new Rectangle(10, 10, fullWidth, questionHeight);
			questionLabel.fontColor = 0xffffff;
			questionLabel.fontSize = 20;
			questionLabel.fontAlign = TextFormatAlign.CENTER;
			addChild(questionLabel);
			
			invalidateDisplay = true;
			
		}
		
		
		public function get currentQuestion():IQuestion
		{
			return _currentQuestion;
		}

		public function set currentQuestion(value:IQuestion):void
		{
			_currentQuestion = value;
			invalidateDisplay = true;
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
			if(invalidateDisplay)
			{
				invalidateDisplay = false;
				
				if(currentQuestion)
				{
					questionLabel.caption = currentQuestion.prompt;
					questionLabel.refresh();
					
					drawAnswerBays();
				}
			}
		}
		
		
		/**
		 * draw the spaces where the ship can "dock" to indicate their answer
		 */
		protected function drawAnswerBays():void
		{
			
			if(currentQuestion is QuestionMultipleChoice)
			{
				var bayCount:int = (currentQuestion as QuestionMultipleChoice).answers.length;
				
				trace("Baycount:" + bayCount + "  drawn: " + drawnBayCount);
				if(bayCount > drawnBayCount)
				{
					trace(" __ need more basys!");
					var remainingBays:int =  bayCount - drawnBayCount;
					var startY:int = questionHeight;
					var bayHeight:int = bayCumulativeHeight/bayCount;
					
					while(--remainingBays > -1)
					{
						++drawnBayCount;
						trace(" __ HERE we GO!");
						var bay:RectangleSprite = new RectangleSprite();
						
						bay.extents = new Rectangle(0, 0, 804, bayHeight);
						bay.y = startY;
						startY += bayHeight;
						bay.fillColor = bayColorArray[remainingBays];
						bay.lineColor = bayColorArray[remainingBays];
						//bay.x = fullWidth;
						addChild(bay);
					}
				}
			}
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