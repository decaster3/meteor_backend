class CreateSmsValidations < ActiveRecord::Migration[5.2]
  def change
    create_table :sms_validations do |t|
      t.string :phone
      t.string :code
      t.timestamp :expires_at

      t.timestamps
    end
  end
end
