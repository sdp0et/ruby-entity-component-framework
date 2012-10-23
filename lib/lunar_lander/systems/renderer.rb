require 'systems/system'
require 'renderable'
require 'screen_location'

class Renderer < System
  def process_one_game_tick(entity_mgr)
    entities = entity_mgr.get_all_entities_possessing_component(Renderable)

    entities.each do |e|
      loc_comp    = entity_mgr.get_component(e, ScreenLocation)
      render_comp = entity_mgr.get_component(e, Renderable)

      render_comp.image.draw(loc_comp.x, loc_comp.y, render_comp.scale)
    end
  end
end
