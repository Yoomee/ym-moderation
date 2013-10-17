module YmModeration::Flagging

  def self.included(base)
    base.belongs_to :flag, :touch => true
    base.belongs_to :user
    base.belongs_to :category, :class_name => 'FlaggingCategory', :foreign_key => 'flagging_category_id'
    base.send(:default_scope, base.order('created_at DESC'))
  end

end