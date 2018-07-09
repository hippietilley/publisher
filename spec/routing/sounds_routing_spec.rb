require 'rails_helper'

RSpec.describe SoundsController, type: :routing do
  describe 'routing' do
    def sound_params
      { year: '2014', month: '07', day: '09', slug: 'famous-friend-by-joyce-manor' }
    end

    def sound_path
      '/sounds/2014/07/09/famous-friend-by-joyce-manor'
    end

    it 'routes to sounds Atom feed' do
      expect(get: '/sounds/feed').to route_to('sounds#index', format: 'atom')
    end

    it 'routes to #index' do
      expect(get: '/sounds').to route_to('sounds#index')
    end

    it 'routes to #new' do
      expect(get: '/sounds/new').to route_to('sounds#new')
    end

    it 'routes to #show' do
      expect(get: sound_path).to route_to('sounds#show', sound_params)
    end

    it 'routes to #edit' do
      expect(get: "#{sound_path}/edit").to route_to('sounds#edit', sound_params)
    end

    it 'routes to #create' do
      expect(post: '/sounds').to route_to('sounds#create')
    end

    it 'routes to #update via PUT' do
      expect(put: sound_path).to route_to('sounds#update', sound_params)
    end

    it 'routes to #update via PATCH' do
      expect(patch: sound_path).to route_to('sounds#update', sound_params)
    end

    it 'routes to #destroy' do
      expect(delete: sound_path).to route_to('sounds#destroy', sound_params)
    end
  end
end
