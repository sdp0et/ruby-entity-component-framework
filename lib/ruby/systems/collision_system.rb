##
# Copyright 2012, Prylis Incorporated.
#
# This file is part of The Ruby Entity-Component Framework.
#
# The Ruby Entity-Component Framework is free software: you can redistribute it
# and/or modify it under the terms of the GNU Lesser General Public License as
# published by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# The Ruby Entity-Component Framework is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser
# General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License along
# with The Ruby Entity-Component Framework.  If not, see
# <http://www.gnu.org/licenses/>.

require 'components/renderable'

java_import org.newdawn.slick.geom.Polygon
java_import org.newdawn.slick.geom.Vector2f
java_import org.newdawn.slick.geom.Transform

class CollisionSystem < System

  def process_one_game_tick(container, delta, entity_mgr)
    collidable_entities=[]

    polygon_entities = entity_mgr.get_all_entities_with_component_of_type(PolygonCollidable)
    update_bounding_polygons(entity_mgr, polygon_entities)
    collidable_entities += polygon_entities

    # circle_entities = ...
    # update_bounding_circles(circle_entities)
    # collidable_entites += circle_entities

    bounding_areas={}
    collidable_entities.each do |e| 
      bounding_areas[e]=entity_mgr.get_entity_component_of_type(e, PolygonCollidable).bounding_polygon
    end

    # Naive O(n^2)
    bounding_areas.each_key do |entity|
      bounding_areas.each_key do |other|
        next if entity==other

        if bounding_areas[entity].intersects bounding_areas[other]
          return true if entity_mgr.get_entity_tag(entity)=='p1_lander' || entity_mgr.get_entity_tag(other)=='p1_lander'
        end
      end
    end

    return false
  end

  def update_bounding_circles(entities)
    # placeholder for thought
  end

  def update_bounding_polygons(entity_mgr, entities)
    entities.each do |e|
      spatial_component    = entity_mgr.get_entity_component_of_type(e, SpatialState)
      renderable_component = entity_mgr.get_entity_component_of_type(e, Renderable)
      collidable_component = entity_mgr.get_entity_component_of_type(e, PolygonCollidable)

      collidable_component.bounding_polygon = 
                   make_polygon(spatial_component.x, 
                                renderable_component.width,
                                spatial_component.y, 
                                renderable_component.height, 
                                renderable_component.rotation, 
                                renderable_component.scale)
    end
  end

  def make_polygon(position_x, width, position_y, height, rotation, scale)
    polygon = Polygon.new
    polygon.addPoint(position_x, position_y)
    polygon.addPoint(position_x + width, position_y)
    polygon.addPoint(position_x + width, position_y + height)
    polygon.addPoint(position_x, position_y + height)

    center = Vector2f.new(position_x + width/2.0*scale, position_y + height/2.0*scale)

    rotate_transform = Transform.createRotateTransform(rotation * Math::PI / 180.0, center.getX, center.getY)
    #scale_transform = Transform.createScaleTransform(scale, scale)

    polygon = polygon.transform(rotate_transform)
    #polygon = polygon.transform(scale_transform)
  end
end
