package com.middlebury.game.controller
{
	import com.middlebury.game.data.AnswerMultipleChoice;
	import com.middlebury.game.data.QuestionCollection;
	import com.middlebury.game.data.QuestionMultipleChoice;

	public class QuestionController
	{
		protected var questionCollection:QuestionCollection;
		
		public function QuestionController()
		{
			// test stuff
			questionCollection = new QuestionCollection();
			var q0:QuestionMultipleChoice = new QuestionMultipleChoice();
			
			var a:Array = [];
			
			a.push(new AnswerMultipleChoice("Am I the right answer?"));
			a.push(new AnswerMultipleChoice("What is a right answer?"));
			a.push(new AnswerMultipleChoice("In the big picture, does it matter?"));
			a.push(new AnswerMultipleChoice("Will answering incorrectly teach me more?"));
			
			q0.prompt = "Which of the following is the most important question?";
			q0.answers = a;
			q0.correctAnswerIndex = 0;
			
			questionCollection.addItem(q0);
			
			var q1:QuestionMultipleChoice = new QuestionMultipleChoice();
			
			var b:Array = [];
			
			b.push(new AnswerMultipleChoice("Blue"));
			b.push(new AnswerMultipleChoice("Peuce"));
			b.push(new AnswerMultipleChoice("In the big picture there are many colors."));
			b.push(new AnswerMultipleChoice("Dark indigo twilight maroon"));
			
			q1.prompt = "Which of the following is your favorite color?";
			q1.answers = b;
			q1.correctAnswerIndex = 0;
			
			questionCollection.addItem(q1);
			
			var q2:QuestionMultipleChoice = new QuestionMultipleChoice();
			
			var c:Array = [];
			
			c.push(new AnswerMultipleChoice("true"));
			c.push(new AnswerMultipleChoice("false"));
			
			q2.prompt = "True is false, and false is true.";
			q2.answers = c;
			q2.correctAnswerIndex = 0;
			
			questionCollection.addItem(q2);
		}
	}
}