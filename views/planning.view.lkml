view: planning {
  sql_table_name: `planner.planning`
    ;;

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: employee_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.employee_id ;;
  }

  measure: count {
    type: count
    drill_fields: [employees.employee_id, employees.employee_name, customers.customer_name, customers.customer_id]
  }
}
