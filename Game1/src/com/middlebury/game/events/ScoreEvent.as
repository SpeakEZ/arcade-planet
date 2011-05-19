////////////////////////////////////////////////////////////////////////////////
//
// 	MIDDLEBURY INTERACTIVE LANGUAGES
//  Copyright 2011 Middlebury Interactive Languages
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////
package com.middlebury.game.events
{
	import com.middlebury.game.data.IScore;
	
	import flash.events.Event;
	/**
	 * <p>Scoring event, updates properties for score.</p>
	 * 
	 * @see com.middlebury.game.data.IScore
	 * @see com.middlebury.game.data.IScore
	 * @see com.middlebury.game.controller.ScoreController
	 *  
	 * @author geo
	 * 
	 */	
	public class ScoreEvent extends Event implements IScore
	{
		public static const SCORE:String 		= "sMasterEvent";
		public static const UPDATE_SCORE:String = "uSMasterEvent";
		public static const UPDATE_MAX:String 	= "uMsMasterEvent";
		public static const INIT:String 		= "iSMasterEvent";
		
		
		public function ScoreEvent(type:String,score:IScore=null)
		{
			super(type, true);
			_iscore = score;
			_score = score.score;
			_total = score.total;
		}
		
		override public function clone():Event
		{
			return new ScoreEvent(type,iscore);
		}
		private var _score:Number;
		public function set score(value:Number):void
		{
			_score = value;
		}
		
		public function get score():Number
		{
			return _score;
		}
		private var _total:Number;
		public function get total():Number
		{
			return _total;
		}
		private var _max:Number;
		public function set max(value:Number):void
		{
			_max = value;
		}
		
		public function get max():Number
		{
			return _max;
		}
		
		private var _iscore:IScore;
		public function get iscore():IScore
		{
			return _iscore;
		}
		
	}
}