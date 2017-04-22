class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string    :title
      t.string    :writer
      t.text      :text
      t.integer  :genre_id
      t.timestamps
    end
  end
end
