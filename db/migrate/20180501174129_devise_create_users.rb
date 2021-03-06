# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      # t.string :email, null: false, default: ""
      t.string :name, null: false
      t.string :encrypted_password, null: false, default: ""
      t.string :token, null: false

      # Confirmation
      t.string   :confirmation_code
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at

      # Commented out on 2018-05-09 untill basic JWT auth is working
      # ## Recoverable
      # t.string   :reset_password_token
      # t.datetime :reset_password_sent_at

      # Commented out on 2018-05-09 untill basic JWT auth is working
      # ## Rememberable
      # t.datetime :remember_created_at

      # Commented out on 2018-05-09 untill basic JWT auth is working
      # ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Custom

      t.timestamps null: false
    end

    # add_index :users, :email, unique: true

    # Commented out on 2018-05-09 untill basic JWT auth is working
    # add_index :users, :reset_password_token, unique: true

    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
