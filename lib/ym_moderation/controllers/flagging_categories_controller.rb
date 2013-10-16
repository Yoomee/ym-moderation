module YmModeration::FlaggingCategoriesController

  def self.included(base)
    base.load_and_authorize_resource :instance_name => 'category'
  end

  def create
    if @category.save
      flash_notice(@category)
      redirect_to flagging_categories_path
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def index
  end
  
  def new
  end
  
  def update
    if @category.update_attributes(params[:flagging_category])
      flash_notice(@category)
    else
      render :action => 'edit'
    end
  end
  
end