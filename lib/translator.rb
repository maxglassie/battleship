module Translator

  def self.translator_hash
     {
      "A1" => 0,
      "A2" => 1,
      "A3" => 2,
      "A4" => 3,
      "B1" => 4,
      "B2" => 5,
      "B3" => 6,
      "B4" => 7,
      "C1" => 8,
      "C2" => 9,
      "C3" => 10,
      "C4" => 11,
      "D1" => 12,
      "D2" => 13,
      "D3" => 14,
      "D4" => 15
    }
  end

  def self.translate(coordinate)
    Translator.translator_hash[coordinate]
  end

end