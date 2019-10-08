module RecordsHelper
  def edit_or_new?(record)
    if  action_name == "edit"
      record.labels[0].id
    end
  end
end
