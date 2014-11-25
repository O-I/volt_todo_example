if ENV['BROWSER']
  require 'spec_helper'

  describe 'Todos app' do

    describe 'Navigation', type: :feature do
      it 'loads the home page as the root' do
        visit '/'
        expect(page).to have_content('Home')
      end

      it 'has an about page' do
        visit '/about'
        expect(page).to have_content('About')
      end

      it 'has a todos page' do
        visit '/todos'
        expect(page).to have_content('Todo List')
      end
    end

    describe 'Functionality', type: :feature do    
      it 'creates a new todo' do
        visit '/todos'
        fill_in 'Add a new todo', with: 'Foobar the baz with the qux'
        page.execute_script("$('form').submit()")
      end
    end
  end
end