require 'Date'
require 'yaml/store'

class Todolist
  attr_reader :tasks

  def initialize (user)
    @todo_store = YAML::Store.new("./public/tasks.yml")
    @tasks = []
    @user = user
  end

  def add_task (task)
    return false if !(task.is_a?Task)
    @tasks << task
  end

  def delete_task (id)
    return false if !(id.is_a?Fixnum)
    @tasks.delete_if { |task| task.id == id }
  end

  def find_task_by_id (id)
    return false if !(id.is_a?Fixnum)
    task = @tasks.find { |task| task.id == id }
    task == nil ? nil : task.content
  end

  def sort_by_created
    sorted_tasks = @tasks.sort { |task1, task2| task1.created_at <=> task2.created_at }
  end

  def save
    @todo_store.transaction do
        @todo_store[@user] = @tasks
    end
  end

  def load_tasks
    @tasks = YAML::Store.load("./public/tasks.yml")
  end
end
