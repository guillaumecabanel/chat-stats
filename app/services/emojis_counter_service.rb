class EmojisCounterService
  EMOJIS_LOVE = {
    'face-throwing-a-kiss_1f618'                            => "\u{1f618}",
    'heavy-black-heart_2764'                                => "\u{2764}",
    'hugging-face_1f917'                                    => "\u{1f917}",
    'smiling-face-with-heart-shaped-eyes_1f60d'             => "\u{1f60d}",
    'smiling-face-with-smiling-eyes-and-three-hearts_1f970' => "\u{1f970}",
  }

  EMOJIS_ANIMALS = {
    'cat-face_1f431'             => "\u{1f431}",
    'dog-face_1f436'             => "\u{1f436}",
    'hatching-chick_1f423'       => "\u{1f423}",
    'hear-no-evil-monkey_1f649'  => "\u{1f649}",
    'lion-face_1f981'            => "\u{1f981}",
    'see-no-evil-monkey_1f648'   => "\u{1f648}",
    'speak-no-evil-monkey_1f64a' => "\u{1f64a}",
    'unicorn-face_1f984'         => "\u{1f984}",
  }
  
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

    EMOJIS[@category].each do |name, emoji|
      emojis_occurences[name] = File.read(@file).count(emoji)
    end

    emojis_occurences.sort_by(&:last).reverse
  end
end
