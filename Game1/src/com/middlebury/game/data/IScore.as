package com.middlebury.game.data
{
	public interface IScore
	{
		function set score(value:Number):void;
		function get score():Number;
		function get total():Number;
		function set max(value:Number):void;
		function get max():Number;
	}
}