////////////////////////////////////////////////////////////////////////////////
//
// 	MIDDLEBURY INTERACTIVE LANGUAGES
//  Copyright 2011 Middlebury Interactive Languages
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////
package com.middlebury.game.display
{
	import com.pblabs.engine.entity.PropertyReference;
	import com.pblabs.rendering2D.SpriteRenderer;
	
	public class Display extends SpriteRenderer
	{
		public var renderObject:RenderObject;
		public function Display(renderObject:RenderObject)
		{
			super();
			initRender(renderObject);
		}
		
		public function initRender(renderObject:RenderObject):void
		{
			this.renderObject = renderObject;
			
			// Initialize properties
			fileName = renderObject.file;
			layerIndex = renderObject.layer;
			scene = renderObject.scene;
			positionProperty = new PropertyReference(renderObject.position);
		}
	}
}