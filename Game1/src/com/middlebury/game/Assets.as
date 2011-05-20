package com.middlebury.game
{
	import com.pblabs.engine.resource.ResourceBundle;

	public class Assets extends ResourceBundle
	{
		[Embed(source="assets/bg_sunset2.jpg")]
		public var bg:Class;
		
		[Embed(source="assets/alien.swf")]
		public var alien:Class;
		
		[Embed(source="assets/bg_space.png")]
		public var space:Class;
		
		[Embed(source="assets/dot.png")]
		public var dot:Class;
		
		public function Assets()
		{
		}
	}
}