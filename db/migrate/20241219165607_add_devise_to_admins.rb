class AddDeviseToAdmins < ActiveRecord::Migration[8.0]
  def up
    change_table :admins do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: "" unless column_exists?(:admins, :email)
      t.string :encrypted_password, null: false, default: "" unless column_exists?(:admins, :encrypted_password)

      ## Recoverable
      t.string   :reset_password_token unless column_exists?(:admins, :reset_password_token)
      t.datetime :reset_password_sent_at unless column_exists?(:admins, :reset_password_sent_at)

      ## Rememberable
      t.datetime :remember_created_at unless column_exists?(:admins, :remember_created_at)

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false unless column_exists?(:admins, :sign_in_count)
      t.datetime :current_sign_in_at unless column_exists?(:admins, :current_sign_in_at)
      t.datetime :last_sign_in_at unless column_exists?(:admins, :last_sign_in_at)
      t.string   :current_sign_in_ip unless column_exists?(:admins, :current_sign_in_ip)
      t.string   :last_sign_in_ip unless column_exists?(:admins, :last_sign_in_ip)

      ## Confirmable
      t.string   :confirmation_token unless column_exists?(:admins, :confirmation_token)
      t.datetime :confirmed_at unless column_exists?(:admins, :confirmed_at)
      t.datetime :confirmation_sent_at unless column_exists?(:admins, :confirmation_sent_at)
      t.string   :unconfirmed_email unless column_exists?(:admins, :unconfirmed_email) # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false unless column_exists?(:admins, :failed_attempts) # Only if lock strategy is :failed_attempts
      t.string   :unlock_token unless column_exists?(:admins, :unlock_token) # Only if unlock strategy is :email or :both
      t.datetime :locked_at unless column_exists?(:admins, :locked_at)
    end

    add_index :admins, :email,                unique: true unless index_exists?(:admins, :email)
    add_index :admins, :reset_password_token, unique: true unless index_exists?(:admins, :reset_password_token)
    add_index :admins, :confirmation_token,   unique: true unless index_exists?(:admins, :confirmation_token)
    add_index :admins, :unlock_token,         unique: true unless index_exists?(:admins, :unlock_token)
  end

  def down
    # If you want to rollback the migration, you can define how to remove the columns here.
    change_table :admins do |t|
      t.remove :email if column_exists?(:admins, :email)
      t.remove :encrypted_password if column_exists?(:admins, :encrypted_password)
      t.remove :reset_password_token if column_exists?(:admins, :reset_password_token)
      t.remove :reset_password_sent_at if column_exists?(:admins, :reset_password_sent_at)
      t.remove :remember_created_at if column_exists?(:admins, :remember_created_at)
      t.remove :sign_in_count if column_exists?(:admins, :sign_in_count)
      t.remove :current_sign_in_at if column_exists?(:admins, :current_sign_in_at)
      t.remove :last_sign_in_at if column_exists?(:admins, :last_sign_in_at)
      t.remove :current_sign_in_ip if column_exists?(:admins, :current_sign_in_ip)
      t.remove :last_sign_in_ip if column_exists?(:admins, :last_sign_in_ip)
      t.remove :confirmation_token if column_exists?(:admins, :confirmation_token)
      t.remove :confirmed_at if column_exists?(:admins, :confirmed_at)
      t.remove :confirmation_sent_at if column_exists?(:admins, :confirmation_sent_at)
      t.remove :unconfirmed_email if column_exists?(:admins, :unconfirmed_email)
      t.remove :failed_attempts if column_exists?(:admins, :failed_attempts)
      t.remove :unlock_token if column_exists?(:admins, :unlock_token)
      t.remove :locked_at if column_exists?(:admins, :locked_at)
    end
  end
end