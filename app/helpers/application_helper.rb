module ApplicationHelper
  def formated_date_dd_mm_yy(date)
    return nil unless date.present?
    date.strftime('%d-%m-%Y')
  end
end
