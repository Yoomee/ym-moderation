module YmModeration::FlagsController

  def self.included(base)
    base.load_and_authorize_resource
  end

  def index
    if @category = FlaggingCategory.find_by_id(params[:flagging_category_id])
      @flags = @category.flags
    else
      @flags = Flag.all
    end
  end

  def show
  end

end