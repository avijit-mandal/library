class Madicine < ActiveRecord::Base
  validates_uniqueness_of :sl_no
end