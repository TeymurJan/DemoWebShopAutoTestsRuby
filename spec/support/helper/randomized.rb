# frozen_string_literal: true

class Randomizer
  def self.getCurrentDate
    date = DateTime.now
    date.strftime('%d%m%Y%H%M%S')
  end
end
