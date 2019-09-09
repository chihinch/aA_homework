# == Schema Information
#
# Table name: albums
#
#  id      :bigint           not null, primary key
#  title   :text             not null
#  yr      :integer          not null
#  band_id :integer          not null
#

class Album < ApplicationRecord
  validates :title, :yr, :band_id, presence: true



end
