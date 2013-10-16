module YmModeration::Flag

  def self.included(base)
    base.belongs_to :resource, :polymorphic => true
    base.belongs_to :resolved_by, :class_name => 'User'
    base.has_many :flaggings, :dependent => :destroy
    base.validates :resource, :presence => true
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