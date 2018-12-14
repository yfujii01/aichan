# frozen_string_literal: true

class TalkTable < ApplicationRecord
  # 空白禁止
  validates :input, presence: true
  validates :message, presence: true
  validates :tag, presence: true

  # 重複禁止
  validates :input, uniqueness: true
end
