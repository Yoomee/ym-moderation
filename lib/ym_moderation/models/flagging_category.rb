module YmModeration::FlaggingCategory

  def self.included(base)
    base.has_many :flaggings
  end

end