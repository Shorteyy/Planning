connection: "planning_dashboard"

# include all the views
include: "/views/**/*.view"

datagroup: planning_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: planning_default_datagroup

explore: customers {}

explore: employees {}

explore: planning {
  join: employees {
    type: left_outer
    sql_on: ${planning.employee_id} = ${employees.employee_id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${planning.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}
