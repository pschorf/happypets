class AnimalsController < ApplicationController
  def new
    unless current_user and current_user.admin
      return render_forbidden
    end
    @animal = Animal.new
    
    respond_to do |format|
      format.html
      format.xml {render :xml => @animal}
    end
  end
  
  def index
    @animals = Animal.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @animals }
    end
  end

  def edit
    if current_user and current_user.admin
      @animal = Animal.find(params[:id])
    else
      return render_forbidden
    end
  end

  def update
    unless current_user and current_user.admin
      return render_forbidden
    end
    @animal = Animal.find(params[:id])
    respond_to do |format|
      if @animal.update_attributes(params[:animal])
        format.html { redirect_to('animals#index', :notice => 'Animal successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def create
    unless current_user and current_user.admin
      return render_forbidden
    end
    @animal = Animal.new(params[:animal])

    respond_to do |format|
      if @animal.save
        format.html { redirect_to(@animal, :notice => 'Animal successfully created.') }
        format.xml  { render :xml => @animal, :status => :created, :location => @animal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @animal.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @animal = Animal.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @animal }
    end
  end

end
