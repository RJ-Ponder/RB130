require 'date'

class Meetup
  WEEKDAY_NUMBERS = {
    'monday' => 1,
    'tuesday' => 2,
    'wednesday' => 3,
    'thursday' => 4,
    'friday' => 5,
    'saturday' => 6,
    'sunday' => 7
  }

  SCHEDULE_INDEXES = {
    'first' => 0,
    'second' => 1,
    'third' => 2,
    'fourth' => 3,
    'fifth' => 4,
    'last' => -1,
    'teenth' => 'teenth'
  }

  attr_reader :year, :month

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    possible_dates = find_possible_dates(weekday)
    exact_date = find_exact_date(possible_dates, schedule)
    exact_date ? Date.civil(year, month, exact_date) : nil
  end

  def find_possible_dates(weekday)
    wkday = WEEKDAY_NUMBERS[weekday.downcase]
    possible_dates = []
    last_day = Date.new(year, month, -1).day
    (1..last_day).each do |day|
      possible_dates << day if Date.new(year, month, day).cwday == wkday
    end
    possible_dates
  end

  def find_exact_date(possible_dates, schedule)
    index = SCHEDULE_INDEXES[schedule.downcase]
    if index == 'teenth'
      possible_dates.select { |day| day >= 13 && day <= 19 }[0]
    else
      possible_dates[index]
    end
  end
end
