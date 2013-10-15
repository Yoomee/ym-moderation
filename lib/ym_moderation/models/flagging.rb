module YmModeration::Flagging

  def self.included(base)
    base.belongs_to :flag
    base.belongs_to :category, :class_name => 'FlaggingCategory', :foreign_key => 'flagging_category_id'
  end

end