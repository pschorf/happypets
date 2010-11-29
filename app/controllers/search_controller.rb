class SearchController < ApplicationController
  
  def index
    @query = params[:query]
    @pets = Pet.where('name LIKE "%' + @query + '%"')
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pets }
    end
  end
  
end
