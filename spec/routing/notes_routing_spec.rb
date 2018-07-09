require 'rails_helper'

RSpec.describe NotesController, type: :routing do
  describe 'routing' do
    def note_params
      { year: '2016', month: '02', day: '10', slug: 'this-is-maggie-aka-teddy-ruxpin' }
    end

    def note_path
      '/notes/2016/02/10/this-is-maggie-aka-teddy-ruxpin'
    end

    it 'routes to notes Atom feed' do
      expect(get: '/notes/feed').to route_to('notes#index', format: 'atom')
    end

    it 'routes to #index' do
      expect(get: '/notes').to route_to('notes#index')
    end

    it 'routes to #new' do
      expect(get: '/notes/new').to route_to('notes#new')
    end

    it 'routes to #show' do
      expect(get: note_path).to route_to('notes#show', note_params)
    end

    it 'routes to #edit' do
      expect(get: "#{note_path}/edit").to route_to('notes#edit', note_params)
    end

    it 'routes to #create' do
      expect(post: '/notes').to route_to('notes#create')
    end

    it 'routes to #update via PUT' do
      expect(put: note_path).to route_to('notes#update', note_params)
    end

    it 'routes to #update via PATCH' do
      expect(patch: note_path).to route_to('notes#update', note_params)
    end

    it 'routes to #destroy' do
      expect(delete: note_path).to route_to('notes#destroy', note_params)
    end
  end
end
