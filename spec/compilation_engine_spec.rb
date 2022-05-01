# frozen_string_literal: true

require_relative '../lib/compilation_engine'

describe CompilationEngine do
  context 'phase_0' do
    it 'works on empty string' do
      expect(CompilationEngine.new.phase_0('')).to match_array([])
    end
    it 'eliminates punctuation' do
      some_prose = 'This is a sentence with, dare I say, some snarky prose text!'
      expect(CompilationEngine.new.phase_0(some_prose)).to match_array(
        %w[This is a sentence with dare I say some snarky prose text]
      )
    end
  end
end
