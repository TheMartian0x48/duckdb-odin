package main

import duck ".."
import "core:fmt"
import "core:os"

// Build and run (DuckDB is linked statically, no extra flags needed):
//   odin run example

main :: proc() {
	fmt.println("DuckDB", duck.duckdb_library_version())

	// Open an in-memory database and connect to it.
	db: duck.duckdb_database
	if duck.duckdb_open(nil, &db) == .DuckDBError {
		fmt.eprintln("failed to open database")
		os.exit(1)
	}
	defer duck.duckdb_close(&db)

	con: duck.duckdb_connection
	if duck.duckdb_connect(db, &con) == .DuckDBError {
		fmt.eprintln("failed to connect")
		os.exit(1)
	}
	defer duck.duckdb_disconnect(&con)

	// Plain queries.
	run(con, "CREATE TABLE people (id INTEGER, name VARCHAR, score DOUBLE)")
	run(con, "INSERT INTO people VALUES (1, 'Ada', 9.5), (2, 'Grace', 8.25), (3, 'Linus', NULL)")

	// Read results with the row/column accessors.
	result: duck.duckdb_result
	if duck.duckdb_query(con, "SELECT id, name, score FROM people ORDER BY id", &result) ==
	   .DuckDBError {
		fmt.eprintln("query failed:", duck.duckdb_result_error(&result))
		duck.duckdb_destroy_result(&result)
		os.exit(1)
	}
	defer duck.duckdb_destroy_result(&result)

	cols := duck.duckdb_column_count(&result)
	rows := duck.duckdb_row_count(&result)

	for c in 0 ..< cols {
		fmt.printf("%-8v", duck.duckdb_column_name(&result, c))
	}
	fmt.println()

	for r in 0 ..< rows {
		id := duck.duckdb_value_int32(&result, 0, r)

		// duckdb_value_varchar allocates; free it with duckdb_free.
		name := duck.duckdb_value_varchar(&result, 1, r)
		defer duck.duckdb_free(rawptr(name))

		if duck.duckdb_value_is_null(&result, 2, r) {
			fmt.printf("%-8v%-8v%v\n", id, name, "NULL")
		} else {
			fmt.printf("%-8v%-8v%v\n", id, name, duck.duckdb_value_double(&result, 2, r))
		}
	}

	// Prepared statement with a bound parameter.
	stmt: duck.duckdb_prepared_statement
	if duck.duckdb_prepare(con, "SELECT name FROM people WHERE id = ?", &stmt) == .DuckDBError {
		fmt.eprintln("prepare failed:", duck.duckdb_prepare_error(stmt))
		duck.duckdb_destroy_prepare(&stmt)
		os.exit(1)
	}
	defer duck.duckdb_destroy_prepare(&stmt)

	duck.duckdb_bind_int32(stmt, 1, 2)

	prepared: duck.duckdb_result
	if duck.duckdb_execute_prepared(stmt, &prepared) == .DuckDBSuccess {
		name := duck.duckdb_value_varchar(&prepared, 0, 0)
		fmt.println("id 2 is", name)
		duck.duckdb_free(rawptr(name))
	}
	duck.duckdb_destroy_result(&prepared)
}

// Run a statement and exit on failure.
run :: proc(con: duck.duckdb_connection, sql: cstring) {
	res: duck.duckdb_result
	defer duck.duckdb_destroy_result(&res)

	if duck.duckdb_query(con, sql, &res) == .DuckDBError {
		fmt.eprintln("error:", duck.duckdb_result_error(&res), "\n  in:", sql)
		os.exit(1)
	}
}
