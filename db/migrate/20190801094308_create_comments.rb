class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :user, index: true
      t.timestamps
      t.references :commentable, polymorphic: true, index: true
    end
  end
end