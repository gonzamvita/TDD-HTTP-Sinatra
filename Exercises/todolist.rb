require 'Date'

class Todolist
  attr_reader :tasks

  def initialize (user)
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
end

class Task
  attr_reader :content, :id, :updated_at, :created_at

  @@current_id = 1

  def initialize(content)
    @content = content
    @id = @@current_id
    @completed = false
    @created_at = Time.now
    @updated_at = nil
    @@current_id += 1
  end

  def isTaskComplete?
    @completed
  end

  def complete!
    @completed = true
  end

  def make_incomplete!
    @completed = false
  end

  def update_content! (newcontent)
    save_updating_date!
    @content = newcontent
  end

  def save_updating_date!
    @updated_at = Time.now.asctime
  end
end
