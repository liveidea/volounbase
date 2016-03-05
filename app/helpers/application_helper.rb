module ApplicationHelper
  def link_to_add_fields(name, f, association, cssClass)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to(name, '#', class: cssClass, data: {association: "#{association}", fields: fields.gsub("\n", "")})
  end

  def is_user_organizer
    if @project.user == current_user
      value = true
    else
      value = false
    end
    return value
  end

  def is_user_candidate( event )
    !Candidate.where(event:event, user_id:current_user.id).empty?
  end

end
