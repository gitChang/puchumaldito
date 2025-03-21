module ApplicationHelper

  def activo(category)
    if action_name == "categorize"
      "active" if @members.first.category.downcase == category.downcase
    end
  end


  def search_notify
    count = @candidates.count
    if count > 0
      "#{count} #{'result'.pluralize(count)} found for query \"#{params[:keyword]}\"."
    else
      "0 result for query \"#{params[:keyword]}\"."
    end 
  end

end
