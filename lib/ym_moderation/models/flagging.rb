module YmModeration::Flagging

  def self.included(base)
    base.belongs_to :flag
  end

end