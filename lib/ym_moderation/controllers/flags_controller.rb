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

  def resolve
    @flag.resolve!(current_user)
    redirect_to flags_path
  end

  def show
  end

end