module YmModeration::FlaggingsController

  def new
    @resource = params[:resource_type].classify.constantize.find(params[:resource_id])
    @flag = Flag.find_or_create_by_resource_type_and_resource_id(params[:resource_type], params[:resource_id])
    @flag.resolved_at = nil
    @flagging = @flag.flaggings.build
  end

end