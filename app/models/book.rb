# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  description :text
#  popular     :boolean
#  released_at :datetime
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Book < ApplicationRecord
end
