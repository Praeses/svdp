module SearchesHelper

  def case_file family
    family.case_files.where(number: params[:term].to_i).first
  end

  def case_file_link family
    cf = case_file(family)
    link_to "Case File ##{params[:term]}", edit_case_file_url(cf), target: '_blank' if cf
  end
end
