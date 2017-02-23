class EmployeeService
	def intialize

	end

	def get_employee_data employees, params
		per_page  = params[:iDisplayLength].to_i
    page      = params[:iDisplayStart] ? (params[:iDisplayStart].to_i / per_page + 1) : 0
    sort_col  = params[:iSortCol_0].to_i
    cols = {
      0 => "id",
      1 => "first_name",
      2 => "last_name",
      3 => "day_of_birth",
      4 => "salary",
      5 => "experience",
    }
    sort_condition = params[:sSortDir_0] == "asc" ? "#{cols[sort_col]} asc" : "#{cols[sort_col]} desc"
    aa_data   = employees.order(sort_condition).paginate(page: page, per_page: per_page).each_with_index.map do |employee, i|
      {
        index:      employee.id,
        first_name: employee.first_name,
        last_name:  employee.last_name,
        birth:      employee.day_of_birth,
        salary:     employee.salary,
        experience: employee.experience,
        age:        Time.now.year - employee.day_of_birth.year,
        onsite:     employee.onsite,
        action: 		"<button class='btn btn-default get-details'><span class='glyphicon glyphicon-plus'></span></button>"
      }
    end

    aa_data
	end

end