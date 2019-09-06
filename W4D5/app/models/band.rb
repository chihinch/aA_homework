# == Schema Information
#
# Table name: bands
#
#  id   :bigint           not null, primary key
#  name :text             not null
#

class Band < ApplicationRecord
  validates :name, presence: true
end
