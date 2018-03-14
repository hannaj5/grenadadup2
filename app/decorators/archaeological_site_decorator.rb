# frozen_string_literal: true

# Decoroator class for ArchaeologicalSite providing displayable content for
# views.
class ArchaeologicalSiteDecorator < Draper::Decorator
  delegate_all

  def coordinates
    if latitude && longitude
      "#{latitude.round(2)}, #{longitude.round(2)}"
    else
      'NA'
    end
  end

  def ceramic_types_to_s
    ceramic_types.collect(&:name).join('<br/>').html_safe
  end

  def ceramic_diagnostics_to_s
    ceramic_diagnostics.collect(&:name).join('<br/>').html_safe
  end

  def threats_to_s
    threats.collect(&:name).join('<br/>').html_safe
  end

  def previous_works_to_s
    previous_works.collect(&:name).join('<br/>').html_safe
  end
  
  def representative_image
    map = nil
    map = self.maps.find(self.representative_image_id) if self.representative_image_id
    # map.inspect
    if self.maps.size > 0
      map = self.maps.first
    end if map.nil?
    if map && !map.nil?
      h.link_to h.image_tag(map.file.thumb.url)
    else
      h.image_tag('no-image_thumb.png', alt: 'No reprsentative map provided')
    end
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
end
