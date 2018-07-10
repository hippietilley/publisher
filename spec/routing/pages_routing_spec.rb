require 'rails_helper'

RSpec.describe PagesController, type: :routing do
  describe 'routing' do
    def page_params
      { year: '2013', month: '09', day: '07', slug: 'resume' }
    end

    def page_path
      '/resume'
    end

    it 'routes to #index' do
      expect(get: '/pages').to route_to('pages#index')
    end

    it 'routes to #new' do
      expect(get: '/pages/new').to route_to('pages#new')
    end

    it 'routes to #show' do
      expect(get: '/resume').to route_to('pages#show', slug: 'resume')
    end
  end
end
