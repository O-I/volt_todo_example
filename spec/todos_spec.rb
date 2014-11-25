if ENV['BROWSER']
  require 'spec_helper'

  describe 'Todos app navigation', type: :feature do
    it 'loads the home page as the root' do
      visit '/'
      expect(page).to have_content('Home')
    end

    it 'has an about page', type: :feature do
      visit '/about'
      expect(page).to have_content('About')
    end

    it 'has a todos page', type: :feature do
      visit '/todos'
      expect(page).to have_content('Todo List')
    end
  end
end
