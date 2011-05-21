package com.middlebury.game.display
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	/**
	 * Draw a rectangle
	 * 
	 * @author Stephen Felt
	 * @date 2011 May 21 
	 */
	public class RectangleSprite extends Sprite
	{
		protected var _fillAlpha:Number = 0.5;
		protected var _fillColor:uint = 0x00FF00;
		protected var _lineColor:uint = 0x00FF00;
		protected var _lineSize:Number = 0.5;
		protected var _lineAlpha:Number = 1;
		
		// where to draw the rectangle
		protected var _extents:Rectangle = new Rectangle(0,0,100,100);

		
		public function get extents():Rectangle
		{
			return _extents;
		}

		public function set extents(value:Rectangle):void
		{
			_extents = value;
			refresh();
		}

		public function get lineAlpha():Number
		{
			return _lineAlpha;
		}
		
		/**
		 * The opacity of the line. 
		 */
		public function set lineAlpha(value:Number):void
		{
			_lineAlpha = value;
			refresh();
		}
		
		public function get lineSize():Number
		{
			return _lineSize;
		}
		
		/**
		 * Thickness of the line. If between 0 and 1 you get a hairline. 
		 */
		public function set lineSize(value:Number):void
		{
			_lineSize = value;
			refresh();
		}
		
		public function get lineColor():uint
		{
			return _lineColor;
		}
		
		/**
		 * Color of the line.
		 */
		public function set lineColor(value:uint):void
		{
			_lineColor = value;
			refresh();
		}
		
		public function get fillAlpha():Number
		{
			return _fillAlpha;
		}
		
		/**
		 * Opacity for the shape fill.
		 */
		public function set fillAlpha(value:Number):void
		{
			_fillAlpha = value;
			refresh();
		}
		
		public function get fillColor():uint
		{
			return _fillColor;
		}
		
		/**
		 * Fill shape with color.
		 */
		public function set fillColor(value:uint):void
		{
			_fillColor = value;
			refresh();
		}
		
		/**
		 * Automatically called, but refreshs the Sprite based on the user's
		 * settings.
		 */
		public function refresh():void
		{
			var g:Graphics = graphics;
			
			// Don't forget to clear.
			g.clear();
			
			trace("Start drawing from (" + (-extents.width/2) + " , " + ( -extents.height/2));
			
			// Prep line/fill settings.
			g.lineStyle(_lineSize, _lineColor, _lineAlpha);
			g.beginFill(_fillColor, _fillAlpha);
			g.drawRect(0, 0, extents.width, extents.height);
			
			g.endFill();
		}
	}
}