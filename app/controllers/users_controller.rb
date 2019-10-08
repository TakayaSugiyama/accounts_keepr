class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    labels = @user.records.map(&:labels).map(&:first).map(&:name)
    @chart = {}
    labels.uniq.each do |name|
      @chart["#{name}"] = labels.count(name)
    end
    @chart
  end
  
end
