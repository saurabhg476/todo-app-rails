class CreateAuthentications < ActiveRecord::Migration[5.1]
  def change
    create_table :authentications do |t|
      t.string :kind , :default => 'password'
      t.string :value
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
