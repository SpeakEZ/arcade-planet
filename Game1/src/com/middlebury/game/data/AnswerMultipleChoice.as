package com.middlebury.game.data
{
	public class AnswerMultipleChoice implements IAnswer
	{
		protected var _prompt:String;
		
		public function AnswerMultipleChoice(prompt:String="")
		{
			this.prompt = prompt; 
		}

		public function get prompt():String
		{
			return _prompt;
		}

		public function set prompt(value:String):void
		{
			_prompt = value;
		}

	}
}