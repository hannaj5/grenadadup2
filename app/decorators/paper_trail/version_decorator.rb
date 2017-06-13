require 'differ'
class PaperTrail::VersionDecorator < Draper::Decorator
  delegate_all

  def format_diff format = :ascii
    output = []
    return '' if self.changeset.nil?
    self.changeset.except('updated_at').each do |key, value|
      output << "<strong>#{key}: </strong>"+Differ.diff_by_line(value.last.to_s, value.first.to_s).format_as(format)
    end
    return output.join('<br/>').html_safe if format == :html
    return output.join ('\n') unless format == :html
  end
  
  def pretty_object format = :ascii
    output = []
    object = self.reify
    object.attributes.each do |att, value|
      output << (format == :html? ? "<strong>#{object.send(att.to_sym)}: </strong> value" : "#{att}: #{value}")
    end unless object.nil?
    return output.join('<br/>').html_safe if format == :html
    return output.join('\n') unless format == :html
  end
  
  def version_author_name
    self.version_author.nil? ? 'System' : User.find(self.version_author).email 
  end

end
