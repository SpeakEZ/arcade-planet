package com.middlebury.game.data
{
	/**
	 * @author Stephen Felt
	 * @date May 19, 2011
	 */
	public class QuestionCollection
	{
		/** an array of IQuestion objects */
		protected var _source:Array;
		
		public function QuestionCollection()
		{
		}

		public function get source():Array
		{
			return _source;
		}

		public function set source(value:Array):void
		{
			_source = value;
		}
		
		public function getItemAt(index:int):Object
		{
			return _source[index];
		}
		
		public function setItemAt(item:Object, index:int):void
		{
			_source[index] = item;
		}
		
		public function randomize():void
		{
			// temporary array to work with
			var tempSource:Array = source.slice();
			// new array
			var newSource:Array = [];

			// randomly splice (remove) objects from tempSource and push them into newSource
			while(tempSource.length > 0)
				newSource.push(tempSource.splice(Math.round(Math.random() * tempSource.length), 1)[0]);
			
			source = newSource;
		}

	}
}