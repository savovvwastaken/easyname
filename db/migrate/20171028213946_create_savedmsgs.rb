class CreateSavedmsgs < ActiveRecord::Migration[5.1]
  def change
    create_table :savedmsgs do |t|
      t.string :text

      t.timestamps
    end
  end
end
