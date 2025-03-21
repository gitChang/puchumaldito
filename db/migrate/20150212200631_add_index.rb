class AddIndex < ActiveRecord::Migration

  def up
  	add_index :posts, [:id, :title, :category], order: { id: :desc, title: :asc, title: :varchar_pattern_ops } 
  end


  def down
  	remove_index :posts, name: :index_posts_on_id_and_title_and_category
  end

end
