class MainController < Volt::ModelController
  model :store

  def index
    # Add code for when the index view is loaded
  end

  def about
    # Add code for when the about view is loaded
  end

  def add_todo
    _todos << { name: page._new_todo }
    page._new_todo = ''
  end

  def remove_todo(todo)
    _todos.delete(todo)
  end

  def current_todo
    _todos[params._index.or(0).to_i]
  end

  def check_all
    _todos.each { |todo| todo._completed = true }
  end

  def completed
    _todos.count { |todo| todo._completed }
  end

  def incomplete
    _todos.size - completed
  end

  def percent_complete
    (completed / _todos.size.to_f * 100).round
  end

  private

  # the main template contains a #template binding that shows another
  # template.  This is the path to that template.  It may change based
  # on the params._controller and params._action values.
  def main_path
    params._controller.or('main') + '/' + params._action.or('index')
  end
end
