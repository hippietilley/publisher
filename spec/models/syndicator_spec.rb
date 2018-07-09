require 'rails_helper'

describe Syndicator do
  fixtures :settings
  let(:syndicator) { described_class.for(:twitter) }

  describe '.for' do
    it 'is a specific syndicator' do
      expect(syndicator).to be_a Syndicator::Twitter
    end
  end

  describe '#valid?' do
    context 'when keys are wrong' do
      it 'returns false' do
        Setting.destroy_all
        expect(syndicator.valid?).to eq false
      end

      it 'returns false when a key is blank' do
        setting = settings(:twitter_key)
        setting.content = ''
        setting.save
        expect(syndicator.valid?).to eq false
      end
    end

    context 'when given both twitter keys' do
      it 'is valid' do
        settings(:twitter_key)
        settings(:twitter_secret)
        expect(syndicator.valid?).to eq true
      end
    end
  end
end
