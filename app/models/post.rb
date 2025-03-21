class Post < ActiveRecord::Base

  def self.get(title)
    title = title.gsub('-', ' ')
    where('LOWER(title) = ?', "#{title}").first
  end


  def self.search(keyword)
    where('title ILIKE ?', "%#{keyword.downcase}%").order('title')
  end


  def self.categorize(category)
    where('LOWER(category) = ?', "#{category.downcase}")
  end
  
end
