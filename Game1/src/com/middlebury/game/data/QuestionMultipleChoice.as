package com.middlebury.game.data
{
	public class QuestionMultipleChoice implements IQuestion
	{
		protected var _hasBeenAnswered:Boolean = false;
		protected var _answers:Array;
		protected var _prompt:String;
		/** the index of the correct answer in the answers array */
		public var correctAnswerIndex:uint;
		/** the index of the user's submitted answer in the answers array */
		public var userAnswerIndex:uint;
		
		public function QuestionMultipleChoice(prompt:String="")
		{
			this.prompt = prompt;
		}
		
		/**
		 * an array of answer objects (A, B, C etc)
		 */
		public function get answers():Array
		{
			return _answers;
		}

		public function set answers(value:Array):void
		{
			_answers = value;
		}
		
		/**
		 * has this question been answered?
		 */
		public function get hasBeenAnswered():Boolean
		{
			return _hasBeenAnswered;
		}
		
		/**
		 * if the question has been answered, is the answer correct?
		 */
		public function get hasBeenAnsweredCorrectly():Boolean
		{
			if(hasBeenAnswered && userAnswerIndex == correctAnswerIndex)
				return true;
			
			return false;
		}
		
		/**
		 * the text to show for this question
		 */
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