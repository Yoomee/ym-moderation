module YmModeration::FlaggingsController

  def self.included(base)
    base.before_filter :get_flag
  end

  def create
    @flag.update_attributes(:resolved_at => nil, :resolved_by_id => nil)
    @flagging = @flag.flaggings.create(params[:flagging])
  end

  def new
    @flagging = @flag.flaggings.build
  end

  private
  def get_flag
    @flag = Flag.unscoped.find_or_initialize_by_resource_type_and_resource_id(params[:resource_type], params[:resource_id])
  end

end