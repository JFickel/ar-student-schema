require_relative '../config'

class InternationalizeStudents < ActiveRecord::Migration
  def up
    add_column :students, :name, :string
    add_column :students, :address, :string

    Student.find_each do |student|
      student.name = student.first_name + " " + student.last_name
      student.save
    end

    remove_column :students, :first_name
    remove_column :students, :last_name
  end

  def down
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string
    Student.find_each do |student|
      full_name = student.name.split
      student.first_name = full_name.first
      student.last_name = full_name.last
      student.save
    end
    remove_column :students, :name
    remove_column :students, :address

  end
end
