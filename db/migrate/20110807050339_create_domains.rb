class CreateDomains < ActiveRecord::Migration
  def self.up
    create_table :domains do |t|
      t.string :domain
      t.string :email
      t.string :confirm_code
      t.string :confirmed
      t.string :ip

      t.timestamps
    end
  end

  def self.down
    drop_table :domains
  end
end
