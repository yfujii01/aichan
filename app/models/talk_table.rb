# frozen_string_literal: true

class TalkTable < ApplicationRecord
  # 空白禁止
  validates :input, presence: true
  validates :message, presence: true
  validates :tag, presence: true

  # 重複禁止
  validates :input, uniqueness: true

  # inputによる絞り込み
  scope :get_by_input, lambda { |val|
    where('input like ?', "%#{val}%")
  }

  # messageによる絞り込み
  scope :get_by_message, lambda { |val|
    where('message like ?', "%#{val}%")
  }

  # tagによる絞り込み
  scope :get_by_tag, lambda { |val|
    where('tag like ?', "%#{val}%")
  }
end
