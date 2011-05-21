package com.middlebury.game.controller
{
	import com.middlebury.game.data.AnswerMultipleChoice;
	import com.middlebury.game.data.IQuestion;
	import com.middlebury.game.data.QuestionCollection;
	import com.middlebury.game.data.QuestionMultipleChoice;
	import com.middlebury.game.display.QuestionScreen;
	import com.pblabs.engine.components.TickedComponent;
	import com.pblabs.rendering2D.ui.PBLabel;
	import com.pblabs.screens.IScreen;
	import com.pblabs.screens.ScreenManager;
	
	import flash.text.TextFormatAlign;
	
	import org.osmf.layout.AbsoluteLayoutFacet;

	/**
	 * Handles questions: when questions appear, when they disappear,
	 * when an answer is committed
	 * 
	 * @author Stephen Felt
	 * @date 2011 May 21
	 */
	public class QuestionController extends TickedComponent
	{
		protected var questionCollection:QuestionCollection;
		protected var _ticksSinceLastQuestion:int;
		protected var _ticksQuestionShowing:int;
		protected var _questionShowing:Boolean;
		protected var questionIndex:int;
		
		public var allowRandomQuestionOrder:Boolean = true;
		
		protected var returnToScreen:IScreen;
		
		public var ticksBetweenQuestions:int = 600;
		
		public function QuestionController()
		{
			// test stuff
			questionIndex = 0;
			
			questionCollection = new QuestionCollection();
			var q0:QuestionMultipleChoice = new QuestionMultipleChoice();
			
			var a:Array = [];
			
			a.push(new AnswerMultipleChoice("Am I the right answer?"));
			a.push(new AnswerMultipleChoice("What is a right answer?"));
			a.push(new AnswerMultipleChoice("In the big picture, does it matter?"));
			a.push(new AnswerMultipleChoice("Will answering incorrectly teach me more?"));
			
			q0.prompt = "Which of the following is the most important question? I mean, the verry most important question. Not the second most important, the most important. Thanks.";
			q0.answers = a;
			q0.correctAnswerIndex = 0;
			
			
			var q1:QuestionMultipleChoice = new QuestionMultipleChoice();
			
			var b:Array = [];
			
			b.push(new AnswerMultipleChoice("Blue"));
			b.push(new AnswerMultipleChoice("Peuce"));
			b.push(new AnswerMultipleChoice("In the big picture there are many colors."));
			b.push(new AnswerMultipleChoice("Dark indigo twilight maroon"));
			
			q1.prompt = "Which of the following is your favorite color?";
			q1.answers = b;
			q1.correctAnswerIndex = 0;
			
			
			var q2:QuestionMultipleChoice = new QuestionMultipleChoice();
			
			var c:Array = [];
			
			c.push(new AnswerMultipleChoice("true"));
			c.push(new AnswerMultipleChoice("false"));
			
			q2.prompt = "True is false, and false is true.";
			q2.answers = c;
			q2.correctAnswerIndex = 0;
			
			questionCollection.addItem(q2);
			questionCollection.addItem(q2);
			questionCollection.addItem(q1);
			questionCollection.addItem(q0);
			questionCollection.addItem(q0);
			questionCollection.addItem(q0);
			questionCollection.addItem(q0);
			questionCollection.addItem(q0);
			questionCollection.addItem(q1);
			questionCollection.addItem(q1);
			questionCollection.addItem(q1);
			questionCollection.addItem(q1);
			questionCollection.addItem(q2);
			questionCollection.addItem(q2);
			questionCollection.addItem(q2);
			
		}

		public function get ticksSinceLastQuestion():int
		{
			return _ticksSinceLastQuestion;
		}
		
		public function get ticksQuestionShowing():int
		{
			return _ticksQuestionShowing;
		}

		public function get questionShowing():Boolean
		{
			return _questionShowing;
		}

		public function startQuestion():void
		{
			// remember what screen we were on so we can go back to it
			returnToScreen = ScreenManager.instance.getCurrentScreen();
			
			// prep question screen
			var q:QuestionScreen = ScreenManager.instance.get("question") as QuestionScreen;
			q.currentQuestion = questionCollection.getItemAt(questionIndex) as IQuestion;
			
			// switch to the question screen
			ScreenManager.instance.push("question");
			
			_questionShowing = true;
			_ticksQuestionShowing = 0;
		}

		
		public function endQuestion():void
		{
			// return to previous screen
			ScreenManager.instance.pop();
			
			_questionShowing = false;
			_ticksSinceLastQuestion = 0;
			
			// if we only have a handful of questions, don't randomize, or 
			//	the learner will feel like they're seeing the same question
			// over and over again
			if(!allowRandomQuestionOrder || questionCollection.count < 10)
			{
				// don't do random, just goto next question
				// if we've surpassed the question count, start over at 0
				if(++questionIndex == questionCollection.count)
					questionIndex = 0;
			}
			else
			{
				// find a random questino to show
				
				var newIndexCandidate:int;
				
				// do not show the same question as we just showed
				do
				{
					newIndexCandidate = 
						Math.floor(Math.random() * questionCollection.count);
				}
				while(newIndexCandidate == questionIndex);

				// switch to new question
				questionIndex = newIndexCandidate;
			}
		}
		
		public override function onTick(tickRate:Number):void
		{
			if(_questionShowing)
			{
				// ++_ticksQuestionShowing;
				
				// test code
				if(++_ticksQuestionShowing > ticksBetweenQuestions)
				{
					endQuestion();
					
				}
			}
			else if(++_ticksSinceLastQuestion > ticksBetweenQuestions)
				startQuestion();
		
		}
	}
}