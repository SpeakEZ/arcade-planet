package com.middlebury.game
{
	import com.pblabs.engine.PBE;
	import com.pblabs.engine.resource.ResourceBundle;

	public class Assets extends ResourceBundle
	{
		[Embed(source = "assets/LevelDescriptions.xml", mimeType = 'application/octet-stream')]
		public var LevelDescriptions:Class;
		
		[Embed(source = "assets/Level1.pbelevel", mimeType = 'application/octet-stream')]
		public var Level1:Class;
		
		[Embed(source="assets/bg_sunset2.jpg")]
		public var bg:Class;
		
		[Embed(source="assets/alien.swf")]
		public var alien:Class;
		
		[Embed(source="assets/bg_space.png")]
		public var space:Class;
		
		[Embed(source="assets/dot.png")]
		public var dot:Class;
		
		[Embed(source="assets/stars.png")]
		public var stars:Class;
		
		[Embed(source="assets/bottom_terrain.png")]
		public var bottom:Class;
		
		public function Assets()
		{
		}
	}
}