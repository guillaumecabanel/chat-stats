require_relative '../../lib/assets/love_emojis'
require_relative '../../lib/assets/animals_emojis'

module ApplicationHelper
  EMOJIS = EMOJIS_ANIMALS.merge(EMOJIS_LOVE)

  def emoji_image_tag(code, options = {})
    image_tag(
      "#{ENV['EMOJIS_ASSETS_URL']}/#{code}.png",
      { title: EMOJIS[code][:title], alt: EMOJIS[code][:alt] }.merge(options)
    )
  end
end
