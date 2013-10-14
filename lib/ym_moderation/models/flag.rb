module YmModeration::Flag

  def self.included(base)
    base.belongs_to :resource, :polymorphic => true
    base.has_many :flaggings
  end

end