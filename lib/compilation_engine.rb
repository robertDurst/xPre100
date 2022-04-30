# frozen_string_literal: true

# The CompilationEngine takes some unstructured, prose and returns annotated
# and structured text such that we can store, manipulate, etc. in a meaningful
# way.
class CompilationEngine
  def lex(prose_input)
    prose_input.scan(/[\w'-]+|[[:punct:]]+/)
  end
end 
