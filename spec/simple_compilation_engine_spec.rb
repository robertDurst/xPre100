# frozen_string_literal: true

require_relative '../lib/compilation_engine_factory'
require_relative '../lib/compiled_artifact'

describe SimpleCompilationEngine do
  context 'parse_correctly' do
    it 'works on empty string' do
      CompiledArtifactTest.new('').expect_num_concepts(0)
    end

    it 'works on simple phrase with multiple words' do
      CompiledArtifactTest
        .new('PEPPERONI PIZZA')
        .expect_num_concepts(1)
        .expect_phrase_exists('PEPPERONI PIZZA')
    end

    it 'works on simple relationship' do
      CompiledArtifactTest
        .new('PIZZA is a FOOD')
        .expect_num_concepts(1)
        .expect_relationship_exists('PIZZA', 'FOOD')
    end

    it 'works with extraneous text, multiple relationships, and multiple phrases' do
      CompiledArtifactTest
        .new('PIZZA is a FOOD that all PEOPLE, including Bob should enjoy (BOB is a PERSON)!')
        .expect_num_concepts(3)
        .expect_relationship_exists('PIZZA', 'FOOD')
        .expect_relationship_exists('BOB', 'PERSON')
        .expect_phrase_exists('PEOPLE')
    end
  end
end

class CompiledArtifactTest
  include RSpec::Mocks::ExampleMethods::ExpectHost
  include RSpec::Matchers

  def initialize(input)
    @concepts = CompilationEngineFactory
                .create(0)
                .parse(input)
                .concepts
  end

  def expect_num_concepts(num_expected_concepts)
    expect(@concepts.size).to eq(num_expected_concepts)
    self
  end

  def expect_phrase_exists(expected_phrase)
    matching_phrases = @concepts
                       .select do |c|
                         c.phrase_or_relationship.type == 'phrase' &&
                           c.phrase_or_relationship.phrase == expected_phrase
                       end

    expect(matching_phrases.size).to eq(1)
    self
  end

  def expect_relationship_exists(expected_phrase1, expected_phrase2)
    matching_relationships = @concepts
                             .select do |c|
                               c.phrase_or_relationship.type == 'relationship' &&
                                 c.phrase_or_relationship.phrase1.phrase == expected_phrase1 &&
                                 c.phrase_or_relationship.phrase2.phrase == expected_phrase2
                             end

    expect(matching_relationships.size).to eq(1)

    self
  end
end
