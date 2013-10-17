module YmModeration::Flag

  def self.included(base)
    base.belongs_to :resource, :polymorphic => true
    base.belongs_to :resolved_by, :class_name => 'User'
    base.has_many :flaggings, :dependent => :destroy
    base.has_many :categories, :through => :flaggings, :uniq => true
    base.validates :resource, :presence => true
    base.send(:default_scope, base.where(:resolved_at => nil).order('updated_at DESC'))
  end

  def resolve!(current_user)
    update_attributes(:resolved_at => Time.now, :resolved_by => current_user)
  end

  def resource_text
    %w{text description bio}.each do |attr_name|
      if resource.respond_to?(attr_name)
        return resource.send(attr_name)
      end
    end
    ''
  end

end