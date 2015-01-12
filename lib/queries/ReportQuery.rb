class ReportQuery
  attr_reader :criteria

  def initialize(criteria, sorting=true)
    @criteria = (criteria or {})
    @criteria = @criteria.symbolize_keys unless @criteria.empty?
    @sorting = sorting
    process_criteria
  end

  def results
    crash_data = CrashData.order(@sorting ? 'created_at desc' : '')
    crash_data = crash_data.where('created_at >= ?', @since) if @since
    crash_data = crash_data.where('created_at <= ?', @untilz) if @untilz
    crash_data
  end

  private

  def process_criteria
    @since = process_date(criteria[:since]) rescue "Invalid parameter: since (#{$!})"
    @untilz = process_date(criteria[:until]) rescue "Invalid parameter: until (#{$!})"
  end

  def process_date(input)
    input.present? ? Date.parse(input) : nil
  end
end
