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
	public class ScoreController implements IScore
	{	
		public function ScoreController(dispatcher:IEventDispatcher=null,score:IScore=null)
		{
			this.dispatcher = dispatcher;
			this.iscore = score;
		}
		
		public function handleEvent(event:Event):void
		{
			if(event && event is ScoreEvent) {
				if((event as ScoreEvent).iscore)
					iscore = (event as ScoreEvent).iscore;
			} else {
				Debug.log("ScoreController->handleEvent event null || !score",Debug.RED);
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
		
		private var _iscore:IScore;
		public function get iscore():IScore
		{
			if(!_score)
				_iscore = new Score();
			return _iscore;
		}

		public function set iscore(value:IScore):void
		{
			_iscore = value;
			if(value) {
				score = value.score;
				max = value.max;
				_total = value.total;
			}
		}
		
		private var _score:Number;
		public function set score(value:Number):void
		{
			_score = value;
		}
		
		public function get score():Number
		{
			if(isNaN(_score))
				_score = 0;
			return _score;
		}
		private var _total:Number;
		public function get total():Number
		{
			if(isNaN(_total))
				_total = 0;
			return _total;
		}
		private var _max:Number;
		public function set max(value:Number):void
		{
			_max = value;
		}
		
		public function get max():Number
		{
			if(isNaN(_max))
				_max = 0;
			return _max;
		}

	}
}