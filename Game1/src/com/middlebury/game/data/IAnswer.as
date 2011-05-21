package com.middlebury.game.data
{
	/**
	 * An answer, such as are shown for a multiple choice or true/false question
	 * 
	 * @author Stephen Felt
	 * @date May 19, 2011
	 */
	public interface IAnswer
	{
		/**
		 * the text to show which represents this answer
		 */
		function get prompt():String;
		function set prompt(value:String):void;
	}
}