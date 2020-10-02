# frozen_string_literal: true

module RecordsHelper
  def edit_or_new(record)
    record.label.id if action_name == 'edit'
  end

  def form_date(record)
    case action_name
    when 'new'
      Date.today
    when 'edit'
      record.purchase_date
    end
  end
end
