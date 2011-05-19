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
	}
}