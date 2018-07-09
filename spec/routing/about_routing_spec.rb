require 'rails_helper'

RSpec.describe AboutController, type: :routing do
  describe 'routing' do
    it 'routes to #public_key' do
      expect(get: '/key.pub').to route_to('about#public_key')
    end
  end
end
