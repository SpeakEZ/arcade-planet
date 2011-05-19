package com.middlebury.game
{
	import com.pblabs.engine.resource.ResourceBundle;

	public class Assets extends ResourceBundle
	{
		[Embed(source="assets/bg_sunset2.jpg")]
		public var bg:Class;
		
		public function Assets()
		{
		}
	}
}