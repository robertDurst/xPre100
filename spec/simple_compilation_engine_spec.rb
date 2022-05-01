# frozen_string_literal: true

require_relative '../lib/compilation_engine_factory'

describe SimpleCompilationEngine do
  context 'parse_correctly' do
    it 'works on empty string' do
      compile_version0('', 0)
    end

    it 'works on simple phrase with multiple words' do
      actual = compile_version0('PEPPERONI PIZZA', 1)
      expect(actual.size).to eq(1)
      expect_phrase(actual[0], 'PEPPERONI PIZZA')
    end

    it 'works on simple relationship' do
      actual = compile_version0('PIZZA is a FOOD', 1)
      expect_relationship(actual[0], 'PIZZA', 'FOOD')
    end

    it 'works with extraneous text, simple relationship, and simple phrase' do
      actual = compile_version0('HAWAIIAN PIZZA is a FOOD that all people, especially JARISELLE should enjoy!', 2)
      expect_relationship(actual[0], 'HAWAIIAN PIZZA', 'FOOD')
      expect_phrase(actual[1], 'JARISELLE')
    end
  end
end

def compile_version0(input, num_expected_concepts)
  compilation_engine = CompilationEngineFactory.create(0)
  actual = compilation_engine.parse(input)
  expect(actual.size).to eq(num_expected_concepts)

  actual
end

def expect_phrase(concept, expected_phrase)
  phrase = concept.phrase_or_relationship
  expect(phrase.type).to eq('phrase')
  expect(phrase.phrase).to eq(expected_phrase)
end

def expect_relationship(concept, expected_phrase1, expected_phrase2)
  relationship = concept.phrase_or_relationship
  expect(relationship.type).to eq('relationship')
  expect(relationship.phrase1.phrase).to eq(expected_phrase1)
  expect(relationship.phrase2.phrase).to eq(expected_phrase2)
end
