require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreatePersons < ActiveRecord::Migration
  def change
    create_table :persons do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :type
      t.timestamps
    end
  end
end