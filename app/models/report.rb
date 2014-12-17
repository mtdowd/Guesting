class Report
  def initialize(bar)
    @bar = bar
  end

  def bar_name
    @bar.name
  end

  def bartenders
    @bar.users
  end

  def bartender_reports
    bartenders.map do |bartender|
      BartenderReport.new(@bar, bartender)
    end
  end
end
