class ArcheologicalSiteDecorator < Draper::Decorator
  delegate_all

  
  def ceramic_types_to_s
    self.ceramic_types.collect { |type| type.name }.join('<br/>').html_safe
  end
  
  def ceramic_diagnostics_to_s
    self.ceramic_diagnostics.collect { |diagnostic| diagnostic.name }.join('<br/>').html_safe
  end
  
  def threats_to_s
    self.threats.collect { |threat| threat.name }.join('<br/>').html_safe
  end
  
  def previous_works_to_s
    self.previous_works.collect { |work| work.name }.join('<br/>').html_safe
  end
  
  def formatted_coordinates
    "#{self.longitude.round(2)}, #{self.latitude.round(2)}"
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
