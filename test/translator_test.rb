require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator'

class TranslatorTest < Minitest::Test

  def test_create_new_object_and_test_file_works
    translator = Translator.new

    assert translator
  end

  def test_translator_hash_exists
    translator = Translator.new

    assert translator.translator_hash
  end

  def test_translate_takes_an_argument_and_returns_value
    translator = Translator.new
    coordinate = "A4"

    assert_equal 3, translator.translate(coordinate)
  end

end #class end


