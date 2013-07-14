class SearchesController < ApplicationController
  def index
    @search = Search.new
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @search = Search.where(term: params[:term]).first_or_create
    @results = @search.call()

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @results }
    end

  end

  def create
    @search = Search.where(params[:search]).first_or_initialize

    respond_to do |format|
      if @search.save
        format.html { redirect_to search_url @search.term }
        format.json { render json: @search, status: :created, location: @search }
      else
        format.html { render action: "new" }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end

  end
end
