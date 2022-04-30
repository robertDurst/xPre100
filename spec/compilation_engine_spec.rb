# frozen_string_literal: true

require_relative '../lib/compilation_engine'

describe CompilationEngine do
  context 'lexes' do
    it 'works on empty string' do
      expect(CompilationEngine.new.lex('')).to match_array([])
    end
    it 'does not drop punctuation' do
      some_prose = "This is a sentence with, dare I say, some snarky prose'd-up text!"
      expect(CompilationEngine.new.lex(some_prose)).to match_array(
        ['This', 'is', 'a', 'sentence', 'with', ',',
         'dare', 'I', 'say', ',', 'some', 'snarky',
         "prose'd-up", 'text', '!']
      )
    end
  end
end
