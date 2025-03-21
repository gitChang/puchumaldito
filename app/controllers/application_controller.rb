class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def set_meta(obj=nil)
    @meta_title = 'Puchu Maldito'
    @meta_description = 'I am Puchu-Puchu the stubborn cat. I will share to you my master\'s secrets.'
    @meta_keywords = 'puchu, stubborn, cat, el, gato, maldito, geek'

    case action_name
    when 'search'
      @meta_title = 'Search'
    when 'categorize'
      @meta_title = "#{params[:category].capitalize}"
    when 'show'
      @meta_title = obj.title
      @meta_description = obj.description
      @meta_keywords = obj.tags
    end
  end


  def set_page_title(title='')
    case action_name
    when 'index'
      @page_title = 'Welcome, Gatos!'
    when 'search'
      @page_title = "Search for results for \"#{params[:keyword]}\"."
    when 'show'
      @page_title = title
    end
  end


  def get_categories
    @categories = Post.uniq.pluck(:category).sort
  end


  def get_recents
    @recents = Post.order('id desc').limit(10)
  end
end
