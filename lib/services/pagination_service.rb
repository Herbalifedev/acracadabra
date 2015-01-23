class PaginationService
  def initialize(datasource, criteria)
    @criteria = criteria
    @datasource = datasource
    perform
  end

  def total
    @datasource.count
  end

  def pages
    (total/@per_page.to_f).ceil
  end

  def results
    @datasource
  end

  private

  def perform
    @page = (@criteria[:page].present? and integer? @criteria[:page]) ? @criteria[:page].to_i : 1

    @per_page = (@criteria[:per_page].present? and integer? @criteria[:per_page]) ? @criteria[:per_page].to_i : @datasource.per_page

    @datasource = @datasource.paginate(:page => @page, :per_page => @per_page)
  end

  def integer?(input)
    /\A[+-]?\d+\z/ === input
  end
end
