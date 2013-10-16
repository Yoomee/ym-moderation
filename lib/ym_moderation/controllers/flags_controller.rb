module YmModeration::FlagsController

  def self.included(base)
    base.authorize_resource
  end

  def index
    @flags = Flag.all
  end

end