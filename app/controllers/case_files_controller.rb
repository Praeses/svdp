class CaseFilesController < ApplicationController

  before_action :set_case_file, only: [:show, :edit, :update, :destroy]
  before_action :set_family,    only: [:new,:create]

  # GET /case_files/1
  # GET /case_files/1.json
  def show
  end

  # GET /case_files/new
  def new
    @case_file = CaseFile.new
    @case_file.needs << Need.new
    @case_file.family = @family
  end

  # GET /case_files/1/edit
  def edit
  end

  # POST /case_files
  # POST /case_files.json
  def create
    @case_file = CaseFile.new(case_file_params)
    @case_file.family = @family
    redirect_to [:edit, @family] if @case_file.save
  end

  # PATCH/PUT /case_files/1
  # PATCH/PUT /case_files/1.json
  def update
    redirect_to [:edit, @case_file.family] if @case_file.update( case_file_params )
  end

  # DELETE /case_files/1
  # DELETE /case_files/1.json
  def destroy
    @case_file.destroy
    respond_to do |format|
      format.html { redirect_to case_files_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case_file
      @case_file = CaseFile.find(params[:id])
    end

    def set_family
      @family = Family.find(params[:family_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def case_file_params
      params.require(:case_file).permit(:number,:date, :comment,
        needs_attributes: [:need_tag_id,:description,:account,:action_tag_id,:action ] )
    end

end
