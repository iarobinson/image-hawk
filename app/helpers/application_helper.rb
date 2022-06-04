module ApplicationHelper
  def common_column_spacing
    "col-lg-6 offset-lg-3"
  end

  def format_cents_to_readable price
    (price.to_i/100.0).to_s
  end
end
