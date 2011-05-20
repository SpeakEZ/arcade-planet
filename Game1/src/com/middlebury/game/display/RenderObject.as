package com.middlebury.game.display
{
	import com.pblabs.engine.entity.PropertyReference;
	import com.pblabs.rendering2D.IScene2D;

	public class RenderObject
	{
		public var name:String;
		public var file:String;
		public var layer:int;
		public var scene:IScene2D;
		public var position:String;
		
		public function RenderObject(file:String="",
									 layer:int=0,
									 scene:IScene2D=null,
									 position:String="@Spatial.position",
									 name:String="Render")
		{
			this.name = name;
			this.file = file;
			this.layer = layer;
			this.scene = scene;
			this.position = position;
		}
	}
}