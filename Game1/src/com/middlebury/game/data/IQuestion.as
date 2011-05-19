package com.middlebury.game.data
{
	public interface IQuestion
	{
		public function get prompt():String;
		public function set prompt(value:String);
		public function get hasBeenAnswered():Boolean;
		public function get hasBeenAnsweredCorrectly():Boolean;
	}
}