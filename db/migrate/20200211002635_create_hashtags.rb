class CreateHashtags < ActiveRecord::Migration[6.0]
  def change
    create_table :hashtags do |t|
      t.string :term, null: false

      t.timestamps
    end
  end
end
