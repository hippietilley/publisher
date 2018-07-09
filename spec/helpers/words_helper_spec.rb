require 'rails_helper'

RSpec.describe WordsHelper, type: :helper do
  describe '#space' do
    it 'returns a space' do
      expect(space).to eq ' '
    end
  end

  describe '#small_word_tag' do
    it 'returns a word wrapped in an <i> tag' do
      expect(small_word_tag('of')).to eq '<i class="small-word small-word-of">of</i>'
    end
  end
end
