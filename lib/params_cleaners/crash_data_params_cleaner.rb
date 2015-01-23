class CrashDataParamsCleaner
  attr_reader :params

  def initialize(params, klass)
    @params = params
    @klass = klass
  end

  def clean
    allowed_params
  end

  private

  def allowed_params
    params.keep_if do |attr, value|
      attrs_accessibles.include?(attr.to_s)
    end
  end

  def attrs_accessibles
    @attrs_accessibles ||= @klass.accessible_attributes
  end
end
