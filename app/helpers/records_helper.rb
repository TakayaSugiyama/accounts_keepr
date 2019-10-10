module RecordsHelper
 def edit_or_new(record)
  if action_name == "edit"
    record.label.id
  end
 end
end
