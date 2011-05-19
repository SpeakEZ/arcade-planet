package com.middlebury.game.data
{
	public class Score implements IScore
	{
		public function Score()
		{
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
		
		private function set total(value:Number):void
		{
			_total = value;
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