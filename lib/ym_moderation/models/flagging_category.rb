module YmModeration::FlaggingCategory

  def self.included(base)
    base.has_many :flaggings
    base.has_many :flags, :through => :flaggings, :uniq => true
  end

end