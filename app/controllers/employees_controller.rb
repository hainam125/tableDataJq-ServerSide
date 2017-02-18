class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
    if request.xhr?
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
      aa_data   = @employees.order(sort_condition).paginate(page: page, per_page: per_page).each_with_index.map do |employee, i|
        {
          index:      employee.id,
          first_name: employee.first_name,
          last_name:  employee.last_name,
          birth:      employee.day_of_birth,
          salary:     employee.salary,
          experience: employee.experience,
          age:        Time.now.year - employee.day_of_birth.year,
          onsite:      employee.onsite
        }
      end
      render json: {"aaData" => aa_data, "iTotalRecords" => @employees.length, "iTotalDisplayRecords" => @employees.length}
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :day_of_birth, :place_of_birth, :salary, :experience, :onsite)
    end
end
