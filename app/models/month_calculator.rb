class MonthCalculator
  def self.month_names(from, to = Date.today)
    (from.year..to.year).each_with_object([]) do |y, array|
      mo_start = (from.year == y) ? from.month : 1
      mo_end = (to.year == y) ? to.month : 12
      (mo_start..mo_end).each do |m|
        array << [Date::MONTHNAMES[m], y]
      end
    end
  end

  def self.count_months(from, to = Date.today)
    (to.year * 12 + to.month) - (from.year * 12 + from.month)
  end

end
