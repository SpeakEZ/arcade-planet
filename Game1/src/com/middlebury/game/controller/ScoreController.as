////////////////////////////////////////////////////////////////////////////////
//
// 	MIDDLEBURY INTERACTIVE LANGUAGES
//  Copyright 2011 Middlebury Interactive Languages
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////
package com.middlebury.game.controller
{
	import com.middlebury.game.data.IScore;
	import com.middlebury.game.data.Score;
	import com.middlebury.game.events.ScoreEvent;
	import com.middlebury.game.util.Debug;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	/**
	 * <p>ScoreController handled score events and properties.</p>
	 * 
	 * @see com.middlebury.game.events.ScoreEvent 
	 * @see com.middlebury.game.data.IScore
	 * @see com.middlebury.game.data.Score
	 * 
	 * @author geo
	 * 
	 */
	public class ScoreController
	{	
		public function ScoreController(dispatcher:IEventDispatcher=null,score:IScore=null)
		{
			this.dispatcher = dispatcher;
			this.score = score;
		}
		
		public function handleEvent(event:ScoreEvent):void
		{
			if(event && event is ScoreEvent) {
				switch (event.type) {
					case ScoreEvent.INIT: 			// init both max and score
						score.max = event.max;
						score.score = event.score;
						break;
					case ScoreEvent.UPDATE_MAX: 	// update max
						score.max = event.max;
						break;
					case ScoreEvent.UPDATE_SCORE: 	// update score
						score.score = event.score;
						break;
					case ScoreEvent.SCORE:			// generic
						break;
					default:
						break;
				}
			}
		}
		
		private var dispatcher:IEventDispatcher;
		public function dispatchEvent(event:Event):void
		{
			if(dispatcher && event) {
				dispatcher.dispatchEvent(event);
			} else {
				if(!dispatcher)
					Debug.log("ScoreController->dispatcher == null",Debug.RED);
				if(!event)
					Debug.log("ScoreController->event == null",Debug.RED);
			}
		}
		
		private var _score:IScore;
		public function get score():IScore
		{
			if(!_score)
				_score = new Score();
			return _score;
		}

		public function set score(value:IScore):void
		{
			_score = value;
		}

	}
}