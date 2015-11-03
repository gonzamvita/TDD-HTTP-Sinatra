require_relative '../todolist.rb'
require 'Date'

RSpec.describe 'Task' do
  before :each do
    @task = Task.new("Walk the dog")
  end

  describe 'isTaskComplete?' do
    it 'returns the content of completed? attribute' do
      expect(@task.isTaskComplete?).to eq(false)
    end
  end

  describe 'complete!' do
    it 'set completed attribute to true' do
      @task.complete!
      expect(@task.isTaskComplete?).to eq(true)
    end
  end

  describe 'make_incomplete!' do
    it 'set completed attribute to false' do
      @task.make_incomplete!
      expect(@task.isTaskComplete?).to eq(false)
    end
  end

  describe 'update_content!' do
    it 'assigns new value to content' do
      @task.update_content!("Milk the walk")
      expect(@task.content).to eq("Milk the walk")
    end
  end

  describe 'save_updating_date!' do
    it 'updates the value stored in @updated_at' do
      @task.save_updating_date!
      expect(@task.updated_at). to eq(Time.now.asctime)
    end
  end
end
