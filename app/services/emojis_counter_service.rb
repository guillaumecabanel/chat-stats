require_relative '../../lib/assets/love_emojis'
require_relative '../../lib/assets/animals_emojis'

class EmojisCounterService
  EMOJIS = {
    love: EMOJIS_LOVE,
    animals: EMOJIS_ANIMALS
  }

  def initialize(file, category)
    @file = file
    @category = category
  end

  def call
    emojis_occurences = {}

    EMOJIS[@category].each do |code, emoji|
      emojis_occurences[code] = File.read(@file).count(emoji[:code])
    end

    emojis_occurences.sort_by(&:last).reverse
  end
end
