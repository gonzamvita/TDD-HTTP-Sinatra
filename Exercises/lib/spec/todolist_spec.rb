require_relative '../todolist.rb'

RSpec.describe 'TodoList' do
  before :each do
    @todolist = Todolist.new
    @task = Task.new("Commit every day")
  end

  describe 'add_task' do
    it 'returns false if you add something that is not a task' do
      expect(@todolist.add_task("pasear al perro")).to eq(false)
    end

    it 'adds a task to the tasks array' do
      @todolist.add_task(@task)
      expect(@todolist.tasks).to contain_exactly(@task)
    end
  end

  describe 'delete_task' do
    it 'returns false if it gets an invalid ID' do
      expect(@todolist.delete_task("string")).to eq(false)
    end

    it 'deletes a task from the array' do
      @todolist.add_task(@task)
      @todolist.delete_task(@task.id)
      expect(@todolist.tasks).to_not contain_exactly(@task)
    end
  end

  describe 'find_task_by_id' do
    it 'returns false if it gets an invalid ID' do
      expect(@todolist.find_task_by_id("Hols")).to eq false
    end

    it 'returns nil if he can not find any task' do
      expect(@todolist.find_task_by_id(2)).to eq(nil)
    end

    it 'returns the content if a task is found' do
      @todolist.add_task(@task)
      expect(@todolist.find_task_by_id(@task.id)).to eq(@task.content)
    end
  end

  describe 'sort_by_created' do
    it 'returns an array' do
      expect(@todolist.sort_by_created).to be_a(Array)
    end

    it 'returns a sorted tasks array' do
      @todolist.add_task(Task.new("Decir Hola"))
      @todolist.add_task(Task.new("Decir Adios"))
      sorted_tasks = @todolist.sort_by_created
      expect(sorted_tasks[0].created_at).to be < sorted_tasks[1].created_at
    end
  end
end
