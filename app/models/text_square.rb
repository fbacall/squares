class TextSquare < Square
  field :text, type: String

  def type
    'text'
  end
end
