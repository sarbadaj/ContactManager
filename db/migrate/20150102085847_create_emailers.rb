class CreateEmailers < ActiveRecord::Migration
  def change
    create_table :emailers do |t|
    	t.string :subject
    	t.string :to
    	t.text :body
    	
      t.timestamps
    end
  end
end
