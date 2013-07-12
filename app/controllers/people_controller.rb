class PeopleController < ApplicationController

  before_action :set_family, only: [:show, :edit, :update, :destroy, :create]
  before_action :set_person, only: [:show, :edit, :update, :destroy ]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @people }
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/new
  # GET /people/new.json
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/1/edit
  def edit
    @visits = Visit.with_person_id(params[:id]).order("date_of_visit DESC")
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(params[:person])
    @family.people << @person
    if @person.save and @family.save
      redirect_to [:edit, @family]
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to [:edit, @family], :notice => '' }
        #format.html { redirect_to :people, :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end


  private

  def set_family
    @family = Family.find_by_id(params[:family_id])
  end

  def set_person
    @person = Person.find_by_id(params[:id])
  end



end
