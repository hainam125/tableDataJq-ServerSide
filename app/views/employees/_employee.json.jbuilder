json.extract! employee, :id, :first_name, :last_name, :day_of_birth, :place_of_birth, :salary, :experience, :onsite, :created_at, :updated_at
json.url employee_url(employee, format: :json)