class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.boolean :comments?

      t.timestamps
    end
    
    setting = Setting.create!(comments?: false)
    setting.save!
  end
end
