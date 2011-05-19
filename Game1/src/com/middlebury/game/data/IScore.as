////////////////////////////////////////////////////////////////////////////////
//
// 	MIDDLEBURY INTERACTIVE LANGUAGES
//  Copyright 2011 Middlebury Interactive Languages
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////
package com.middlebury.game.data
{
	/**
	 * <p>IScore interface for scoring.</p>
	 * 
	 * @see com.middlebury.game.data.Score
	 * @see com.middlebury.game.controller.ScoreController
	 * 
	 * @author geo
	 * 
	 */	
	public interface IScore
	{
		function set score(value:Number):void;
		function get score():Number;
		function get total():Number;
		function set max(value:Number):void;
		function get max():Number;
	}
}