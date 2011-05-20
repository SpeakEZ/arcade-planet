////////////////////////////////////////////////////////////////////////////////
//
// 	MIDDLEBURY INTERACTIVE LANGUAGES
//  Copyright 2011 Middlebury Interactive Languages
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////
package com.middlebury.game.data
{
	/**
	 * <p>Score default object to implement IScore. for game scoring.</p>
	 * 
	 * @see com.middlebury.game.data.Score
	 * @see com.middlebury.game.controller.ScoreController 
	 * 
	 * @author geo
	 * 
	 */	
	public class Score implements IScore
	{
		public function Score()
		{
		}
		
		public function updateScore(value:Number):void
		{
			if(isNaN(_total))
				_total = 0;
			_total += value;
		}
		
		private var _score:Number;
		public function set score(value:Number):void
		{
			_score = value;
			updateScore(value);
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