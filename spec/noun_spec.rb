# frozen_string_literal: true

require_relative '../lib/noun'

describe Noun do
  it 'id is self' do
    foo_noun = Noun.new 'foo'
    expect(foo_noun).to eq(foo_noun.id)
  end

  context 'equality' do
    foo_noun = Noun.new 'foo'
    foo_noun_too = Noun.new 'foo'
    bar_noun = Noun.new 'bar'

    it 'when same instance equal' do
      expect(foo_noun).to eq(foo_noun)
    end

    it 'when same label equal' do
      expect(foo_noun).to eq(foo_noun_too)
    end

    it 'when different label, not equal' do
      expect(foo_noun).not_to eq(bar_noun)
    end
  end
end
