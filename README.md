alpha_blog app

This repo is used to create rails modules from scratch to understand their functionality

Create new RoR file:
rails new app_name

Migration files are used to create tables

Create new migration file:
rails generate migration create_table_name

Run new migration files since last ran:
rails db:migrate

Rollback last migration to update schema file from migration file (not preferred):
rails db:rollback

Preferred method of editing schema files (Create a new migration file):
rails generate migration add_something_to_table

In new migration file:
def change
  add column :table_name, :column_name, :data_type
  add_column :articles, :created_at, :datetime
  add_column :articles, :updated_at, :datetime
end

rails db:migrate

Create a model to interact with the database:
Create model_name.rb in models folder

class ClassName < ApplicationRecord

end

Using the Rails console to perform CRUD operations

Open Rails console:
rails c

Check all records of a table:
ClassName.all

Create

Create a new record by creating an object with the class:
object = ClassName.new(col_1: "desc", col_n: "desc")
article = Article.new(title: "First Article", description: "Desc of first article")

Save the record into the table
object.save
article.save

Read

Find record by id
ClassName.find(id)

Read first record
ClassName.first

Reading specific columns of a record (Rails creates the getter & setter methods automatically, need to save the record in a variable first to access it)
variable_name = ClassName.find(id)
variable_name.col_name

Update

variable_name.col_name = "new content"
variable_name.save

Destroy

variable_name.destroy
OR (Method chainig)
ClassName.find(id).destroy

Validating columns to control what can be saved in the db (to prevent null values etc)
In model.rb

class ClassName < ApplicationRecord
  validates :col_name, presence: true, length: { minimum: 10, maximum: 100 }
end

Reading Errors

.errors.full_messages

Viewing a table on a browser

Routing (Adding all routes associated with a table)
only: [] restricts which routes to include using resources as it will pull in all routes

In routes.rb
resources :table_name, only: [:show]

Creating a controller to interact with the route and model

Create table_name.controller.rb in controllers folder

class ClassNameController < ApplicationController
  
  def show
  end

end

Create view template
Create table_name in views folder
Create show.html.erb

Showing relevant info based on db id
In table_name_controller.rb

(@var_name sets it to be an instance var or global var)
def show
  @article = Article.find(params1[:id])
end
