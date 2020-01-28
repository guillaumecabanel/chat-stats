class Chat < ApplicationRecord
  has_one_attached :raw_chat

  before_create :set_uuid

  private

  def set_uuid
    self.uuid = SecureRandom.uuid
  end
end
