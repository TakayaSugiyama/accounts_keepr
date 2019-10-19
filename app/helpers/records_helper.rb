# frozen_string_literal: true

module RecordsHelper
  def edit_or_new(record)
    record.label.id if action_name == 'edit'
  end
end
