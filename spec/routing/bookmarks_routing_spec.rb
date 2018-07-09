require 'rails_helper'

RSpec.describe BookmarksController, type: :routing do
  describe 'routing' do
    def bookmark_params
      { year: '2014', month: '02', day: '05', slug: 'why-we-dug-atari-the-atlantic' }
    end

    def bookmark_path
      '/bookmarks/2014/02/05/why-we-dug-atari-the-atlantic'
    end

    it 'routes to bookmarks Atom feed' do
      expect(get: '/bookmarks/feed').to route_to('bookmarks#index', format: 'atom')
    end

    it 'routes to #index' do
      expect(get: '/bookmarks').to route_to('bookmarks#index')
    end

    it 'routes to #new' do
      expect(get: '/bookmarks/new').to route_to('bookmarks#new')
    end

    it 'routes to #show' do
      expect(get: bookmark_path).to route_to('bookmarks#show', bookmark_params)
    end

    it 'routes to #edit' do
      expect(get: "#{bookmark_path}/edit").to route_to('bookmarks#edit', bookmark_params)
    end

    it 'routes to #create' do
      expect(post: '/bookmarks').to route_to('bookmarks#create')
    end

    it 'routes to #update via PUT' do
      expect(put: bookmark_path).to route_to('bookmarks#update', bookmark_params)
    end

    it 'routes to #update via PATCH' do
      expect(patch: bookmark_path).to route_to('bookmarks#update', bookmark_params)
    end

    it 'routes to #destroy' do
      expect(delete: bookmark_path).to route_to('bookmarks#destroy', bookmark_params)
    end
  end
end
