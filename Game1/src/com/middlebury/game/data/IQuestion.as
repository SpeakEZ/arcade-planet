package com.middlebury.game.data
{
	public interface IQuestion
	{
		function get prompt():String;
		function set prompt(value:String):void;
		function get hasBeenAnswered():Boolean;
		function get hasBeenAnsweredCorrectly():Boolean;
	}
}