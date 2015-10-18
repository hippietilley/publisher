module WordsHelper
  def small_word_tag(word)
    content_tag(:i, word, class: "small-word small-word-#{word}")
  end

  def preposition(text)
    content_tag(:span, text, class: "preposition")
  end

  def space
    " "
  end
end
