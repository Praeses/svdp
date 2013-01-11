class VisitsController < ApplicationController
  # GET /visits
  # GET /visits.json
  def index
    @visits = Visit.all.with_person_id(params[:person_id])

    respond_to do |format|
      format.json { render json: @visits }
    end
  end

  # GET /visits/1
  # GET /visits/1.json
  def show
    @visit = Visit.find(params[:id])

    respond_to do |format|
      format.json { render json: @visit }
    end
  end

  # GET /visits/new
  # GET /visits/new.json
  def new
    @visit = Visit.new

    respond_to do |format|
      format.json { render json: @visit }
    end
  end

  # GET /visits/1/edit
  def edit
    @visit = Visit.find(params[:id])
  end

  # POST /visits
  # POST /visits.json
  def create
    @visit = Visit.new(params[:visit])

    respond_to do |format|
      if @visit.save
        format.json { render json: @visit, status: :created, location: @visit }
      else
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /visits/1
  # PUT /visits/1.json
  def update
    @visit = Visit.find(params[:id])

    respond_to do |format|
      if @visit.update_attributes(params[:visit])
        format.json { head :no_content }
      else
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
