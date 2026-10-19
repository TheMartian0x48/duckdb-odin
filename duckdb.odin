package duckdb

//odinfmt: disable
when ODIN_OS == .Darwin {
	foreign import lib {
		LIB_DIR + "libduckdb_static.a",
		LIB_DIR + "libcore_functions_extension.a",
		LIB_DIR + "libparquet_extension.a",
		LIB_DIR + "libjson_extension.a",
		LIB_DIR + "libicu_extension.a",
		LIB_DIR + "libautocomplete_extension.a",
		LIB_DIR + "libtpch_extension.a",
		LIB_DIR + "libtpcds_extension.a",
		LIB_DIR + "libduckdb_generated_extension_loader.a",
		LIB_DIR + "libduckdb_re2.a",
		LIB_DIR + "libduckdb_pg_query.a",
		LIB_DIR + "libduckdb_zstd.a",
		LIB_DIR + "libduckdb_miniz.a",
		LIB_DIR + "libduckdb_fsst.a",
		LIB_DIR + "libduckdb_fastpforlib.a",
		LIB_DIR + "libduckdb_yyjson.a",
		LIB_DIR + "libduckdb_mbedtls.a",
		LIB_DIR + "libduckdb_fmt.a",
		LIB_DIR + "libduckdb_utf8proc.a",
		LIB_DIR + "libduckdb_hyperloglog.a",
		LIB_DIR + "libduckdb_skiplistlib.a",
		"system:c++",
	}
} else when ODIN_OS == .Linux {
	foreign import lib {
		LIB_DIR + "libduckdb_static.a",
		LIB_DIR + "libduckdb_generated_extension_loader.a",
		LIB_DIR + "libcore_functions_extension.a",
		LIB_DIR + "libparquet_extension.a",
		LIB_DIR + "libjson_extension.a",
		LIB_DIR + "libicu_extension.a",
		LIB_DIR + "libautocomplete_extension.a",
		LIB_DIR + "libtpch_extension.a",
		LIB_DIR + "libtpcds_extension.a",
		LIB_DIR + "libduckdb_re2.a",
		LIB_DIR + "libduckdb_pg_query.a",
		LIB_DIR + "libduckdb_zstd.a",
		LIB_DIR + "libduckdb_miniz.a",
		LIB_DIR + "libduckdb_fsst.a",
		LIB_DIR + "libduckdb_fastpforlib.a",
		LIB_DIR + "libduckdb_yyjson.a",
		LIB_DIR + "libduckdb_mbedtls.a",
		LIB_DIR + "libduckdb_fmt.a",
		LIB_DIR + "libduckdb_utf8proc.a",
		LIB_DIR + "libduckdb_hyperloglog.a",
		LIB_DIR + "libduckdb_skiplistlib.a",
		LIB_DIR + "libduckdb_jemalloc.a",
		LIB_DIR + "libduckdb_static.a", // repeated: archives reference each other circularly
		"system:stdc++",
		"system:m",
		"system:pthread",
		"system:dl",
	}
} else when ODIN_OS == .Windows {
	foreign import lib {
		LIB_DIR + "libduckdb_static.a",
		LIB_DIR + "libcore_functions_extension.a",
		LIB_DIR + "libparquet_extension.a",
		LIB_DIR + "libjson_extension.a",
		LIB_DIR + "libicu_extension.a",
		LIB_DIR + "libautocomplete_extension.a",
		LIB_DIR + "libtpch_extension.a",
		LIB_DIR + "libtpcds_extension.a",
		LIB_DIR + "libduckdb_generated_extension_loader.a",
		LIB_DIR + "libduckdb_re2.a",
		LIB_DIR + "libduckdb_pg_query.a",
		LIB_DIR + "libduckdb_zstd.a",
		LIB_DIR + "libduckdb_miniz.a",
		LIB_DIR + "libduckdb_fsst.a",
		LIB_DIR + "libduckdb_fastpforlib.a",
		LIB_DIR + "libduckdb_yyjson.a",
		LIB_DIR + "libduckdb_mbedtls.a",
		LIB_DIR + "libduckdb_fmt.a",
		LIB_DIR + "libduckdb_utf8proc.a",
		LIB_DIR + "libduckdb_hyperloglog.a",
		LIB_DIR + "libduckdb_skiplistlib.a",
		"system:stdc++",
		"system:ws2_32",
		"system:rstrtmgr",
		"system:bcrypt",
	}
} else {
	#panic("duckdb: unsupported platform")
}
//odinfmt: enable

duckdb_type :: enum {
	Invalid         = 0,
	//! bool
	Boolean         = 1,
	//! int8_t
	Tinyint         = 2,
	//! int16_t
	Smallint        = 3,
	//! int32_t
	Integer         = 4,
	//! int64_t
	Bigint          = 5,
	//! uint8_t
	Utinyint        = 6,
	//! uint16_t
	Usmallint       = 7,
	//! uint32_t
	Uinteger        = 8,
	//! uint64_t
	Ubigint         = 9,
	//! float
	Float           = 10,
	//! double
	Double          = 11,
	//! duckdb_timestamp (microseconds)
	Timestamp       = 12,
	//! duckdb_date
	Date            = 13,
	//! duckdb_time
	Time            = 14,
	//! duckdb_interval
	Interval        = 15,
	//! duckdb_hugeint
	Hugeint         = 16,
	//! const char*
	Varchar         = 17,
	//! duckdb_blob
	Blob            = 18,
	//! duckdb_decimal
	Decimal         = 19,
	//! duckdb_timestamp_s (seconds)
	Timestamp_S     = 20,
	//! duckdb_timestamp_ms (milliseconds)
	Timestamp_Ms    = 21,
	//! duckdb_timestamp_ns (nanoseconds)
	Timestamp_Ns    = 22,
	//! enum type, only useful as logical type
	Enum            = 23,
	//! list type, only useful as logical type
	List            = 24,
	//! struct type, only useful as logical type
	Struct          = 25,
	//! map type, only useful as logical type
	Map             = 26,
	//! duckdb_hugeint
	Uuid            = 27,
	//! union type, only useful as logical type
	Union           = 28,
	//! duckdb_bit
	Bit             = 29,
	//! duckdb_time_tz
	Time_Tz         = 30,
	//! duckdb_timestamp (microseconds)
	Timestamp_Tz    = 31,
	//! duckdb_uhugeint
	Uhugeint        = 32,
	//! duckdb_array, only useful as logical type
	Array           = 33,
	//! enum type, only useful as logical type
	Any             = 34,
	//! duckdb_bignum
	Bignum          = 35,
	//! enum type, only useful as logical type
	Sqlnull         = 36,
	//! enum type, only useful as logical type
	String_Literal  = 37,
	//! enum type, only useful as logical type
	Integer_Literal = 38,
	//! duckdb_time_ns (nanoseconds)
	Time_Ns         = 39,
	//! GEOMETRY type, WKB blob
	Geometry        = 40,
	//! VARIANT type
	Variant         = 41,
}

duckdb_pending_state :: enum {
	Result_Ready       = 0,
	Result_Not_Ready   = 1,
	Error              = 2,
	No_Tasks_Available = 3,
}

duckdb_result_type :: enum {
	Invalid      = 0,
	Changed_Rows = 1,
	Nothing      = 2,
	Query_Result = 3,
}

duckdb_statement_type :: enum {
	Invalid           = 0,
	Select            = 1,
	Insert            = 2,
	Update            = 3,
	Explain           = 4,
	Delete            = 5,
	Prepare           = 6,
	Create            = 7,
	Execute           = 8,
	Alter             = 9,
	Transaction       = 10,
	Copy              = 11,
	Analyze           = 12,
	Variable_Set      = 13,
	Create_Func       = 14,
	Drop              = 15,
	Export            = 16,
	Pragma            = 17,
	Vacuum            = 18,
	Call              = 19,
	Set               = 20,
	Load              = 21,
	Relation          = 22,
	Extension         = 23,
	Logical_Plan      = 24,
	Attach            = 25,
	Detach            = 26,
	Multi             = 27,
	Copy_Database     = 28,
	Update_Extensions = 29,
	Merge_Into        = 30,
}

duckdb_error_type :: enum {
	Invalid                = 0,
	Out_Of_Range           = 1,
	Conversion             = 2,
	Unknown_Type           = 3,
	Decimal                = 4,
	Mismatch_Type          = 5,
	Divide_By_Zero         = 6,
	Object_Size            = 7,
	Invalid_Type           = 8,
	Serialization          = 9,
	Transaction            = 10,
	Not_Implemented        = 11,
	Expression             = 12,
	Catalog                = 13,
	Parser                 = 14,
	Planner                = 15,
	Scheduler              = 16,
	Executor               = 17,
	Constraint             = 18,
	Index                  = 19,
	Stat                   = 20,
	Connection             = 21,
	Syntax                 = 22,
	Settings               = 23,
	Binder                 = 24,
	Network                = 25,
	Optimizer              = 26,
	Null_Pointer           = 27,
	Io                     = 28,
	Interrupt              = 29,
	Fatal                  = 30,
	Internal               = 31,
	Invalid_Input          = 32,
	Out_Of_Memory          = 33,
	Permission             = 34,
	Parameter_Not_Resolved = 35,
	Parameter_Not_Allowed  = 36,
	Dependency             = 37,
	Http                   = 38,
	Missing_Extension      = 39,
	Autoload               = 40,
	Sequence               = 41,
	Invalid_Configuration  = 42,
}

duckdb_cast_mode :: enum {
	Normal = 0,
	Try    = 1,
}

duckdb_file_flag :: enum {
	Invalid    = 0,
	//! Open the file with read capabilities.
	Read       = 1,
	//! Open the file with write capabilities.
	Write      = 2,
	//! Create a new file, or open if it already exists.
	Create     = 3,
	//! Create a new file, or fail if it already exists.
	Create_New = 4,
	//! Open the file in append mode.
	Append     = 5,
}

duckdb_config_option_scope :: enum {
	Invalid = 0,
	//! The option is set for the duration of the current transaction only. CURRENTLY NOT IMPLEMENTED.
	Local   = 1,
	//! The option is set for the current session/connection only.
	Session = 2,
	//! Set the option globally for all sessions/connections.
	Global  = 3,
}

duckdb_catalog_entry_type :: enum {
	Invalid            = 0,
	Table              = 1,
	Schema             = 2,
	View               = 3,
	Index              = 4,
	Prepared_Statement = 5,
	Sequence           = 6,
	Collation          = 7,
	Type               = 8,
	Database           = 9,
}


duckdb_state :: enum {
	DuckDBSuccess = 0,
	DuckDBError   = 1,
}


duckdb_date :: struct {
	days: i32,
}

duckdb_date_struct :: struct {
	year:  i32,
	month: i8,
	day:   i8,
}

duckdb_time :: struct {
	micros: i64,
}

duckdb_time_struct :: struct {
	hour:   i8,
	min:    i8,
	sec:    i8,
	micors: i32,
}

duckdb_time_ns :: struct {
	nanos: i64,
}

duckdb_time_tz :: struct {
	bits: u64,
}

duckdb_time_tz_struct :: struct {
	time:   duckdb_time_struct,
	offset: i32,
}

duckdb_timestamp :: struct {
	micors: i64,
}

duckdb_timestamp_struct :: struct {
	date: duckdb_date_struct,
	time: duckdb_time_struct,
}

duckdb_timestamp_s :: struct {
	seconds: i64,
}

duckdb_timestamp_ms :: struct {
	millis: i64,
}

duckdb_timestamp_ns :: struct {
	nanos: i64,
}

duckdb_interval :: struct {
	months: i32,
	days:   i32,
	micros: i64,
}

duckdb_hugeint :: struct {
	lower: u64,
	upper: i64,
}

duckdb_uhugeint :: struct {
	lower: u64,
	upper: u64,
}

duckdb_decimal :: struct {
	width: u8,
	scale: u8,
	value: duckdb_hugeint,
}

duckdb_query_progress_type :: struct {
	percentage:            f64,
	rows_processed:        u64,
	total_rows_to_process: u64,
}

duckdb_list_entry :: struct {
	offset: u64,
	length: u64,
}

duckdb_column :: struct {
	deprecated_data:     rawptr,
	deprecated_nullmask: rawptr,
	deprecated_type:     duckdb_type,
	deprecated_name:     [^]byte,
	internal_data:       rawptr,
}

duckdb_string :: struct {
	data: [^]byte,
	size: idx_t,
}

duckdb_blob :: struct {
	data: rawptr,
	size: idx_t,
}

duckdb_bit :: struct {
	data: ^u8,
	size: idx_t,
}

duckdb_bignum :: struct {
	data:        ^u8,
	size:        idx_t,
	is_negative: bool,
}

duckdb_result :: struct {
	deprecated_column_count:  idx_t,
	deprecated_row_count:     idx_t,
	deprecated_rows_changed:  idx_t,
	deprecated_columns:       ^duckdb_column,
	deprecated_error_message: [^]byte,
	internal_data:            rawptr,
}

ArrowSchema :: struct {
	format:       cstring,
	name:         cstring,
	metadata:     cstring,
	flags:        i64,
	n_children:   i64,
	children:     [^]^ArrowSchema,
	dictionary:   ^ArrowSchema,
	release:      proc "c" (schema: ^ArrowSchema),
	private_data: rawptr,
}

ArrowArray :: struct {
	length:       i64,
	null_count:   i64,
	offset:       i64,
	n_buffers:    i64,
	n_children:   i64,
	buffers:      [^]rawptr,
	children:     [^]^ArrowArray,
	dictionary:   ^ArrowArray,
	release:      proc "c" (array: ^ArrowArray),
	private_data: rawptr,
}



//odinfmt: disable

idx_t :: distinct u64
sel_t :: distinct u32

duckdb_string_t :: struct #raw_union {
    pointer: struct {
        length: u32,
        prefix: [4]byte,
        ptr:    [^]byte,
    },
    inlined: struct {
        length:  u32,
        inlined: [12]byte,
    },
}


// common handles
duckdb_aggregate_function               :: distinct rawptr
duckdb_aggregate_function_set           :: distinct rawptr
duckdb_aggregate_state                  :: distinct rawptr
duckdb_appender                         :: distinct rawptr
duckdb_arrow                            :: distinct rawptr
duckdb_arrow_array                      :: distinct rawptr
duckdb_arrow_converted_schema           :: distinct rawptr
duckdb_arrow_options                    :: distinct rawptr
duckdb_arrow_schema                     :: distinct rawptr
duckdb_arrow_stream                     :: distinct rawptr
duckdb_bind_info                        :: distinct rawptr
duckdb_cast_function                    :: distinct rawptr
duckdb_catalog                          :: distinct rawptr
duckdb_catalog_entry                    :: distinct rawptr
duckdb_client_context                   :: distinct rawptr
duckdb_config                           :: distinct rawptr
duckdb_config_option                    :: distinct rawptr
duckdb_connection                       :: distinct rawptr
duckdb_copy_function                    :: distinct rawptr
duckdb_copy_function_bind_info          :: distinct rawptr
duckdb_copy_function_finalize_info      :: distinct rawptr
duckdb_copy_function_global_init_info   :: distinct rawptr
duckdb_copy_function_sink_info          :: distinct rawptr
duckdb_create_type_info                 :: distinct rawptr
duckdb_data_chunk                       :: distinct rawptr
duckdb_database                         :: distinct rawptr
duckdb_error_data                       :: distinct rawptr
duckdb_expression                       :: distinct rawptr
duckdb_extension_info                   :: distinct rawptr
duckdb_extracted_statements             :: distinct rawptr
duckdb_file_handle                      :: distinct rawptr
duckdb_file_open_options                :: distinct rawptr
duckdb_file_system                      :: distinct rawptr
duckdb_function_info                    :: distinct rawptr
duckdb_init_info                        :: distinct rawptr
duckdb_instance_cache                   :: distinct rawptr
duckdb_log_storage                      :: distinct rawptr
duckdb_logical_type                     :: distinct rawptr
duckdb_pending_result                   :: distinct rawptr
duckdb_prepared_statement               :: distinct rawptr
duckdb_profiling_info                   :: distinct rawptr
duckdb_replacement_scan_info            :: distinct rawptr
duckdb_scalar_function                  :: distinct rawptr
duckdb_scalar_function_set              :: distinct rawptr
duckdb_selection_vector                 :: distinct rawptr
duckdb_table_description                :: distinct rawptr
duckdb_table_function                   :: distinct rawptr
duckdb_task_state                       :: distinct rawptr
duckdb_value                            :: distinct rawptr
duckdb_vector                           :: distinct rawptr

duckdb_aggregate_combine_t              :: proc "c" (info: duckdb_function_info, source: [^]duckdb_aggregate_state, target: [^]duckdb_aggregate_state, count: idx_t)
duckdb_aggregate_destroy_t              :: proc "c" (states: [^]duckdb_aggregate_state, count: idx_t)
duckdb_aggregate_finalize_t             :: proc "c" (info: duckdb_function_info, source: [^]duckdb_aggregate_state, result: duckdb_vector, count: idx_t, offset: idx_t)
duckdb_aggregate_init_t                 :: proc "c" (info: duckdb_function_info, state: duckdb_aggregate_state)
duckdb_aggregate_state_size             :: proc "c" (info: duckdb_function_info) -> idx_t
duckdb_aggregate_update_t               :: proc "c" (info: duckdb_function_info, input: duckdb_data_chunk, states: [^]duckdb_aggregate_state)
duckdb_cast_function_t                  :: proc "c" (info: duckdb_function_info, count: idx_t, input: duckdb_vector, output: duckdb_vector) -> bool
duckdb_copy_callback_t                  :: proc "c" (data: rawptr) -> rawptr
duckdb_copy_function_bind_t             :: proc "c" (info: duckdb_copy_function_bind_info)
duckdb_copy_function_finalize_t         :: proc "c" (info: duckdb_copy_function_finalize_info)
duckdb_copy_function_global_init_t      :: proc "c" (info: duckdb_copy_function_global_init_info)
duckdb_copy_function_sink_t             :: proc "c" (info: duckdb_copy_function_sink_info, input: duckdb_data_chunk)
duckdb_delete_callback_t                :: proc "c" (data: rawptr)
duckdb_logger_write_log_entry_t         :: proc "c" (extra_data: rawptr, timestamp: ^duckdb_timestamp, level: cstring, log_type: cstring, log_message: cstring)
duckdb_replacement_callback_t           :: proc "c" (info: duckdb_replacement_scan_info, table_name: cstring, data: rawptr)
duckdb_scalar_function_bind_t           :: proc "c" (info: duckdb_bind_info)
duckdb_scalar_function_init_t           :: proc "c" (info: duckdb_init_info)
duckdb_scalar_function_t                :: proc "c" (info: duckdb_function_info, input: duckdb_data_chunk, output: duckdb_vector)
duckdb_table_function_bind_t            :: proc "c" (info: duckdb_bind_info)
duckdb_table_function_init_t            :: proc "c" (info: duckdb_init_info)
duckdb_table_function_t                 :: proc "c" (info: duckdb_function_info, output: duckdb_data_chunk)


@(default_calling_convention = "c")
foreign lib {

@(link_name = "duckdb_library_version")                         duckdb_library_version :: proc() -> cstring ---

@(link_name = "duckdb_create_instance_cache")                   duckdb_create_instance_cache :: proc() -> duckdb_instance_cache ---
@(link_name = "duckdb_get_or_create_from_cache")                duckdb_get_or_create_from_cache :: proc(instance_cache: duckdb_instance_cache, path: cstring, out_database: ^duckdb_database, config: duckdb_config, out_error: [^]cstring) -> duckdb_state ---
@(link_name = "duckdb_destroy_instance_cache")                  duckdb_destroy_instance_cache :: proc(instance_cache: ^duckdb_instance_cache) ---

@(link_name = "duckdb_open")                                    duckdb_open :: proc(path: cstring, out_database: ^duckdb_database) -> duckdb_state ---
@(link_name = "duckdb_open_ext")                                duckdb_open_ext :: proc(path: cstring, out_database: ^duckdb_database, config: duckdb_config, out_error: [^]cstring) -> duckdb_state ---
@(link_name = "duckdb_close")                                   duckdb_close :: proc(database: ^duckdb_database) ---

@(link_name = "duckdb_connect")                                 duckdb_connect :: proc(database: duckdb_database, out_connection: ^duckdb_connection) -> duckdb_state ---
@(link_name = "duckdb_connection_get_client_context")           duckdb_connection_get_client_context :: proc(connection: duckdb_connection, out_context: ^duckdb_client_context) ---
@(link_name = "duckdb_connection_get_arrow_options")            duckdb_connection_get_arrow_options :: proc(connection: duckdb_connection, out_arrow_options: ^duckdb_arrow_options) ---
@(link_name = "duckdb_disconnect")                              duckdb_disconnect :: proc(conection: ^duckdb_connection) ---


@(link_name = "duckdb_interrupt")                               duckdb_interrupt :: proc(connection: duckdb_connection) ---
@(link_name = "duckdb_query_progress")                          duckdb_query_progress :: proc(connection: duckdb_connection) -> duckdb_query_progress_type ---
@(link_name = "duckdb_client_context_get_connection_id")        duckdb_client_context_get_connection_id :: proc(ctx: duckdb_client_context) -> idx_t ---
@(link_name = "duckdb_destroy_client_context")                  duckdb_destroy_client_context :: proc(ctx: ^duckdb_client_context) ---
@(link_name = "duckdb_destroy_arrow_options")                   duckdb_destroy_arrow_options :: proc(arrow_options: ^duckdb_arrow_options) ---
@(link_name = "duckdb_get_table_names")                         duckdb_get_table_names :: proc(connection: duckdb_connection, query: cstring, qualified: bool) -> duckdb_value ---


// Configuration

@(link_name = "duckdb_create_config")                           duckdb_create_config :: proc(out_config: ^duckdb_config) -> duckdb_state ---
@(link_name = "duckdb_destroy_config")                          duckdb_destroy_config :: proc(config: ^duckdb_config) ---
@(link_name = "duckdb_get_config_flag")                         duckdb_get_config_flag :: proc(index: uint, out_name: ^cstring, out_description: ^cstring) -> duckdb_state ---
@(link_name = "duckdb_set_config")                              duckdb_set_config :: proc(config: duckdb_config, name: cstring, option: cstring) -> duckdb_state ---
@(link_name = "duckdb_config_count")                            duckdb_config_count :: proc() -> uint ---

// Error Data
@(link_name = "duckdb_create_error_data")                       duckdb_create_error_data :: proc(type: duckdb_error_type, message: cstring) -> duckdb_error_data ---
@(link_name = "duckdb_destroy_error_data")                      duckdb_destroy_error_data :: proc(error_data: ^duckdb_error_data) ---
@(link_name = "duckdb_error_data_error_type")                   duckdb_error_data_error_type :: proc(error_data: duckdb_error_data) -> duckdb_error_type ---
@(link_name = "duckdb_error_data_message")                      duckdb_error_data_message :: proc(error_data: duckdb_error_data) -> cstring ---
@(link_name = "duckdb_error_data_has_error")                    duckdb_error_data_has_error :: proc(error_data: duckdb_error_data) -> bool ---

// Query Execution
@(link_name = "duckdb_query")                                   duckdb_query :: proc(connection: duckdb_connection, query: cstring, out_result: ^duckdb_result) -> duckdb_state ---
@(link_name = "duckdb_destroy_result")                          duckdb_destroy_result :: proc(result: ^duckdb_result) ---
@(link_name = "duckdb_column_name")                             duckdb_column_name :: proc(result: ^duckdb_result, col: idx_t) -> cstring ---
@(link_name = "duckdb_column_type")                             duckdb_column_type :: proc(result: ^duckdb_result, col: idx_t) -> duckdb_type ---
@(link_name = "duckdb_result_statement_type")                   duckdb_result_statement_type :: proc(result: duckdb_result) -> duckdb_statement_type ---
@(link_name = "duckdb_column_logical_type")                     duckdb_column_logical_type :: proc(result: ^duckdb_result, col: idx_t) -> duckdb_logical_type ---
@(link_name = "duckdb_result_get_arrow_options")                duckdb_result_get_arrow_options :: proc(result: ^duckdb_result) -> duckdb_arrow_options ---
@(link_name = "duckdb_column_count")                            duckdb_column_count :: proc(result: ^duckdb_result) -> idx_t ---
@(link_name = "duckdb_row_count")                               duckdb_row_count :: proc(result: ^duckdb_result) -> idx_t ---
@(link_name = "duckdb_rows_changed")                            duckdb_rows_changed :: proc(result: ^duckdb_result) -> idx_t ---
@(link_name = "duckdb_column_data")                             duckdb_column_data :: proc(result: ^duckdb_result, col: idx_t) -> rawptr ---
@(link_name = "duckdb_nullmask_data")                           duckdb_nullmask_data :: proc(result: ^duckdb_result, col: idx_t) -> [^]bool ---
@(link_name = "duckdb_result_error")                            duckdb_result_error :: proc(result: ^duckdb_result) -> cstring ---
@(link_name = "duckdb_result_error_type")                       duckdb_result_error_type :: proc(result: ^duckdb_result) -> duckdb_error_type ---


// Result Functions
@(link_name = "duckdb_result_get_chunk")                        duckdb_result_get_chunk :: proc(result: duckdb_result, chunk_index: idx_t) -> duckdb_data_chunk ---
@(link_name = "duckdb_result_is_streaming")                     duckdb_result_is_streaming :: proc(result: duckdb_result) -> bool ---
@(link_name = "duckdb_result_chunk_count")                      duckdb_result_chunk_count :: proc(result: duckdb_result) -> idx_t ---
@(link_name = "duckdb_result_return_type")                      duckdb_result_return_type :: proc(result: duckdb_result) -> duckdb_result_type ---

// Safe Fetch Functions
@(link_name = "duckdb_value_boolean")                           duckdb_value_boolean :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> bool ---
@(link_name = "duckdb_value_int8")                              duckdb_value_int8 :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> i8 ---
@(link_name = "duckdb_value_int16")                             duckdb_value_int16 :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> i16 ---
@(link_name = "duckdb_value_int32")                             duckdb_value_int32 :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> i32 ---
@(link_name = "duckdb_value_int64")                             duckdb_value_int64 :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> i64 ---
@(link_name = "duckdb_value_hugeint")                           duckdb_value_hugeint :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> duckdb_hugeint ---
@(link_name = "duckdb_value_uhugeint")                          duckdb_value_uhugeint :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> duckdb_uhugeint ---
@(link_name = "duckdb_value_decimal")                           duckdb_value_decimal :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> duckdb_decimal ---
@(link_name = "duckdb_value_uint8")                             duckdb_value_uint8 :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> u8 ---
@(link_name = "duckdb_value_uint16")                            duckdb_value_uint16 :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> u16 ---
@(link_name = "duckdb_value_uint32")                            duckdb_value_uint32 :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> u32 ---
@(link_name = "duckdb_value_uint64")                            duckdb_value_uint64 :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> u64 ---
@(link_name = "duckdb_value_float")                             duckdb_value_float :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> f32 ---
@(link_name = "duckdb_value_double")                            duckdb_value_double :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> f64 ---
@(link_name = "duckdb_value_date")                              duckdb_value_date :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> duckdb_date ---
@(link_name = "duckdb_value_time")                              duckdb_value_time :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> duckdb_time ---
@(link_name = "duckdb_value_timestamp")                         duckdb_value_timestamp :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> duckdb_timestamp ---
@(link_name = "duckdb_value_interval")                          duckdb_value_interval :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> duckdb_interval ---
@(link_name = "duckdb_value_varchar")                           duckdb_value_varchar :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> cstring ---
@(link_name = "duckdb_value_string")                            duckdb_value_string :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> duckdb_string ---
@(link_name = "duckdb_value_varchar_internal")                  duckdb_value_varchar_internal :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> cstring ---
@(link_name = "duckdb_value_string_internal")                   duckdb_value_string_internal :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> duckdb_string ---
@(link_name = "duckdb_value_blob")                              duckdb_value_blob :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> duckdb_blob ---
@(link_name = "duckdb_value_is_null")                           duckdb_value_is_null :: proc(result: ^duckdb_result, col: idx_t, row: idx_t) -> bool ---


// Helpers
@(link_name = "duckdb_malloc")                                  duckdb_malloc :: proc(size: uint) -> rawptr ---
@(link_name = "duckdb_free")                                    duckdb_free :: proc(ptr: rawptr) ---
@(link_name = "duckdb_vector_size")                             duckdb_vector_size :: proc() -> idx_t ---
@(link_name = "duckdb_string_is_inlined")                       duckdb_string_is_inlined :: proc(string: duckdb_string_t) -> bool ---
@(link_name = "duckdb_string_t_length")                         duckdb_string_t_length :: proc(string: duckdb_string_t) -> u32 ---
@(link_name = "duckdb_string_t_data")                           duckdb_string_t_data :: proc(string: ^duckdb_string_t) -> cstring ---

// Date Time Timestamp Helpers
@(link_name = "duckdb_from_date")                               duckdb_from_date :: proc(date: duckdb_date) -> duckdb_date_struct ---
@(link_name = "duckdb_to_date")                                 duckdb_to_date :: proc(date: duckdb_date_struct) -> duckdb_date ---
@(link_name = "duckdb_is_finite_date")                          duckdb_is_finite_date :: proc(date: duckdb_date) -> bool ---
@(link_name = "duckdb_from_time")                               duckdb_from_time :: proc(time: duckdb_time) -> duckdb_time_struct ---
@(link_name = "duckdb_create_time_tz")                          duckdb_create_time_tz :: proc(micros: i64, offset: i32) -> duckdb_time_tz ---
@(link_name = "duckdb_from_time_tz")                            duckdb_from_time_tz :: proc(micros: duckdb_time_tz) -> duckdb_time_tz_struct ---
@(link_name = "duckdb_to_time")                                 duckdb_to_time :: proc(time: duckdb_time_struct) -> duckdb_time ---
@(link_name = "duckdb_from_timestamp")                          duckdb_from_timestamp :: proc(ts: duckdb_timestamp) -> duckdb_timestamp_struct ---
@(link_name = "duckdb_to_timestamp")                            duckdb_to_timestamp :: proc(ts: duckdb_timestamp_struct) -> duckdb_timestamp ---
@(link_name = "duckdb_is_finite_timestamp")                     duckdb_is_finite_timestamp :: proc(ts: duckdb_timestamp) -> bool ---
@(link_name = "duckdb_is_finite_timestamp_s")                   duckdb_is_finite_timestamp_s :: proc(ts: duckdb_timestamp_s) -> bool ---
@(link_name = "duckdb_is_finite_timestamp_ms")                  duckdb_is_finite_timestamp_ms :: proc(ts: duckdb_timestamp_ms) -> bool ---
@(link_name = "duckdb_is_finite_timestamp_ns")                  duckdb_is_finite_timestamp_ns :: proc(ts: duckdb_timestamp_ns) -> bool ---

// Hugeint Helpers
@(link_name = "duckdb_hugeint_to_double")                       duckdb_hugeint_to_double :: proc(val: duckdb_hugeint) -> f64 ---
@(link_name = "duckdb_double_to_hugeint")                       duckdb_double_to_hugeint :: proc(val: f64) -> duckdb_hugeint ---

// Unsigned Hugeint Helpers
@(link_name = "duckdb_uhugeint_to_double")                      duckdb_uhugeint_to_double :: proc(val: duckdb_uhugeint) -> f64 ---
@(link_name = "duckdb_double_to_uhugeint")                      duckdb_double_to_uhugeint :: proc(val: f64) -> duckdb_uhugeint ---

// Decimal Helpers
@(link_name = "duckdb_double_to_decimal")                       duckdb_double_to_decimal :: proc(val: f64, width: u8, scale: u8) -> duckdb_decimal ---
@(link_name = "duckdb_decimal_to_double")                       duckdb_decimal_to_double :: proc(val: duckdb_decimal) -> f64 ---

// Prepared Statements
@(link_name = "duckdb_prepare")                                 duckdb_prepare :: proc(connection: duckdb_connection, query: cstring, out_prepared_statement: ^duckdb_prepared_statement) -> duckdb_state ---
@(link_name = "duckdb_destroy_prepare")                         duckdb_destroy_prepare :: proc(prepared_statement: ^duckdb_prepared_statement) ---
@(link_name = "duckdb_prepare_error")                           duckdb_prepare_error :: proc(prepared_statement: duckdb_prepared_statement) -> cstring ---
@(link_name = "duckdb_nparams")                                 duckdb_nparams :: proc(prepared_statement: duckdb_prepared_statement) -> idx_t ---
@(link_name = "duckdb_parameter_name")                          duckdb_parameter_name :: proc(prepared_statement: duckdb_prepared_statement, index: idx_t) -> cstring ---
@(link_name = "duckdb_param_type")                              duckdb_param_type :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t) -> duckdb_type ---
@(link_name = "duckdb_param_logical_type")                      duckdb_param_logical_type :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t) -> duckdb_logical_type ---
@(link_name = "duckdb_clear_bindings")                          duckdb_clear_bindings :: proc(prepared_statement: duckdb_prepared_statement) -> duckdb_state ---
@(link_name = "duckdb_prepared_statement_type")                 duckdb_prepared_statement_type :: proc(statement: duckdb_prepared_statement) -> duckdb_statement_type ---
@(link_name = "duckdb_prepared_statement_column_count")         duckdb_prepared_statement_column_count :: proc(prepared_statement: duckdb_prepared_statement) -> idx_t ---
@(link_name = "duckdb_prepared_statement_column_name")          duckdb_prepared_statement_column_name :: proc(prepared_statement: duckdb_prepared_statement, col_idx: idx_t) -> cstring ---
@(link_name = "duckdb_prepared_statement_column_logical_type")  duckdb_prepared_statement_column_logical_type :: proc(prepared_statement: duckdb_prepared_statement, col_idx: idx_t) -> duckdb_logical_type ---
@(link_name = "duckdb_prepared_statement_column_type")          duckdb_prepared_statement_column_type :: proc(prepared_statement: duckdb_prepared_statement, col_idx: idx_t) -> duckdb_type ---

// Bind Values to Prepared Statements
@(link_name = "duckdb_bind_value")                              duckdb_bind_value :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: duckdb_value) -> duckdb_state ---
@(link_name = "duckdb_bind_parameter_index")                    duckdb_bind_parameter_index :: proc(prepared_statement: duckdb_prepared_statement, param_idx_out: ^idx_t, name: cstring) -> duckdb_state ---
@(link_name = "duckdb_bind_boolean")                            duckdb_bind_boolean :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: bool) -> duckdb_state ---
@(link_name = "duckdb_bind_int8")                               duckdb_bind_int8 :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: i8) -> duckdb_state ---
@(link_name = "duckdb_bind_int16")                              duckdb_bind_int16 :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: i16) -> duckdb_state ---
@(link_name = "duckdb_bind_int32")                              duckdb_bind_int32 :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: i32) -> duckdb_state ---
@(link_name = "duckdb_bind_int64")                              duckdb_bind_int64 :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: i64) -> duckdb_state ---
@(link_name = "duckdb_bind_hugeint")                            duckdb_bind_hugeint :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: duckdb_hugeint) -> duckdb_state ---
@(link_name = "duckdb_bind_uhugeint")                           duckdb_bind_uhugeint :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: duckdb_uhugeint) -> duckdb_state ---
@(link_name = "duckdb_bind_decimal")                            duckdb_bind_decimal :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: duckdb_decimal) -> duckdb_state ---
@(link_name = "duckdb_bind_uint8")                              duckdb_bind_uint8 :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: u8) -> duckdb_state ---
@(link_name = "duckdb_bind_uint16")                             duckdb_bind_uint16 :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: u16) -> duckdb_state ---
@(link_name = "duckdb_bind_uint32")                             duckdb_bind_uint32 :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: u32) -> duckdb_state ---
@(link_name = "duckdb_bind_uint64")                             duckdb_bind_uint64 :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: u64) -> duckdb_state ---
@(link_name = "duckdb_bind_float")                              duckdb_bind_float :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: f32) -> duckdb_state ---
@(link_name = "duckdb_bind_double")                             duckdb_bind_double :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: f64) -> duckdb_state ---
@(link_name = "duckdb_bind_date")                               duckdb_bind_date :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: duckdb_date) -> duckdb_state ---
@(link_name = "duckdb_bind_time")                               duckdb_bind_time :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: duckdb_time) -> duckdb_state ---
@(link_name = "duckdb_bind_timestamp")                          duckdb_bind_timestamp :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: duckdb_timestamp) -> duckdb_state ---
@(link_name = "duckdb_bind_timestamp_tz")                       duckdb_bind_timestamp_tz :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: duckdb_timestamp) -> duckdb_state ---
@(link_name = "duckdb_bind_interval")                           duckdb_bind_interval :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: duckdb_interval) -> duckdb_state ---
@(link_name = "duckdb_bind_varchar")                            duckdb_bind_varchar :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: cstring) -> duckdb_state ---
@(link_name = "duckdb_bind_varchar_length")                     duckdb_bind_varchar_length :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, val: cstring, length: idx_t) -> duckdb_state ---
@(link_name = "duckdb_bind_blob")                               duckdb_bind_blob :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t, data: rawptr, length: idx_t) -> duckdb_state ---
@(link_name = "duckdb_bind_null")                               duckdb_bind_null :: proc(prepared_statement: duckdb_prepared_statement, param_idx: idx_t) -> duckdb_state ---


// Execute Prepared Statements
@(link_name = "duckdb_execute_prepared")                        duckdb_execute_prepared :: proc(prepared_statement: duckdb_prepared_statement, out_result: ^duckdb_result) -> duckdb_state ---
@(link_name = "duckdb_execute_prepared_streaming")              duckdb_execute_prepared_streaming :: proc(prepared_statement: duckdb_prepared_statement, out_result: ^duckdb_result) -> duckdb_state ---

// Extract Statements
@(link_name = "duckdb_extract_statements")                      duckdb_extract_statements :: proc(connection: duckdb_connection, query: cstring, out_extracted_statements: ^duckdb_extracted_statements) -> idx_t ---
@(link_name = "duckdb_prepare_extracted_statement")             duckdb_prepare_extracted_statement :: proc(connection: duckdb_connection, extracted_statements: duckdb_extracted_statements, index: idx_t, out_prepared_statement: ^duckdb_prepared_statement) -> duckdb_state ---
@(link_name = "duckdb_extract_statements_error")                duckdb_extract_statements_error :: proc(extracted_statements: duckdb_extracted_statements) -> cstring ---
@(link_name = "duckdb_destroy_extracted")                       duckdb_destroy_extracted :: proc(extracted_statements: ^duckdb_extracted_statements) ---

// Pending Result Interface
@(link_name = "duckdb_pending_prepared")                        duckdb_pending_prepared :: proc(prepared_statement: duckdb_prepared_statement, out_result: ^duckdb_pending_result) -> duckdb_state ---
@(link_name = "duckdb_pending_prepared_streaming")              duckdb_pending_prepared_streaming :: proc(prepared_statement: duckdb_prepared_statement, out_result: ^duckdb_pending_result) -> duckdb_state ---
@(link_name = "duckdb_destroy_pending")                         duckdb_destroy_pending :: proc(pending_result: ^duckdb_pending_result) ---
@(link_name = "duckdb_pending_error")                           duckdb_pending_error :: proc(pending_result: duckdb_pending_result) -> cstring ---
@(link_name = "duckdb_pending_execute_task")                    duckdb_pending_execute_task :: proc(pending_result: duckdb_pending_result) -> duckdb_pending_state ---
@(link_name = "duckdb_pending_execute_check_state")             duckdb_pending_execute_check_state :: proc(pending_result: duckdb_pending_result) -> duckdb_pending_state ---
@(link_name = "duckdb_execute_pending")                         duckdb_execute_pending :: proc(pending_result: duckdb_pending_result, out_result: ^duckdb_result) -> duckdb_state ---
@(link_name = "duckdb_pending_execution_is_finished")           duckdb_pending_execution_is_finished :: proc(pending_state: duckdb_pending_state) -> bool ---

// Value Interface
@(link_name = "duckdb_destroy_value")                           duckdb_destroy_value :: proc(value: ^duckdb_value) ---
@(link_name = "duckdb_create_varchar")                          duckdb_create_varchar :: proc(text: cstring) -> duckdb_value ---
@(link_name = "duckdb_create_varchar_length")                   duckdb_create_varchar_length :: proc(text: cstring, length: idx_t) -> duckdb_value ---
@(link_name = "duckdb_create_bool")                             duckdb_create_bool :: proc(input: bool) -> duckdb_value ---
@(link_name = "duckdb_create_int8")                             duckdb_create_int8 :: proc(input: i8) -> duckdb_value ---
@(link_name = "duckdb_create_uint8")                            duckdb_create_uint8 :: proc(input: u8) -> duckdb_value ---
@(link_name = "duckdb_create_int16")                            duckdb_create_int16 :: proc(input: i16) -> duckdb_value ---
@(link_name = "duckdb_create_uint16")                           duckdb_create_uint16 :: proc(input: u16) -> duckdb_value ---
@(link_name = "duckdb_create_int32")                            duckdb_create_int32 :: proc(input: i32) -> duckdb_value ---
@(link_name = "duckdb_create_uint32")                           duckdb_create_uint32 :: proc(input: u32) -> duckdb_value ---
@(link_name = "duckdb_create_uint64")                           duckdb_create_uint64 :: proc(input: u64) -> duckdb_value ---
@(link_name = "duckdb_create_int64")                            duckdb_create_int64 :: proc(val: i64) -> duckdb_value ---
@(link_name = "duckdb_create_hugeint")                          duckdb_create_hugeint :: proc(input: duckdb_hugeint) -> duckdb_value ---
@(link_name = "duckdb_create_uhugeint")                         duckdb_create_uhugeint :: proc(input: duckdb_uhugeint) -> duckdb_value ---
@(link_name = "duckdb_create_bignum")                           duckdb_create_bignum :: proc(input: duckdb_bignum) -> duckdb_value ---
@(link_name = "duckdb_create_decimal")                          duckdb_create_decimal :: proc(input: duckdb_decimal) -> duckdb_value ---
@(link_name = "duckdb_create_float")                            duckdb_create_float :: proc(input: f32) -> duckdb_value ---
@(link_name = "duckdb_create_double")                           duckdb_create_double :: proc(input: f64) -> duckdb_value ---
@(link_name = "duckdb_create_date")                             duckdb_create_date :: proc(input: duckdb_date) -> duckdb_value ---
@(link_name = "duckdb_create_time")                             duckdb_create_time :: proc(input: duckdb_time) -> duckdb_value ---
@(link_name = "duckdb_create_time_ns")                          duckdb_create_time_ns :: proc(input: duckdb_time_ns) -> duckdb_value ---
@(link_name = "duckdb_create_time_tz_value")                    duckdb_create_time_tz_value :: proc(value: duckdb_time_tz) -> duckdb_value ---
@(link_name = "duckdb_create_timestamp")                        duckdb_create_timestamp :: proc(input: duckdb_timestamp) -> duckdb_value ---
@(link_name = "duckdb_create_timestamp_tz")                     duckdb_create_timestamp_tz :: proc(input: duckdb_timestamp) -> duckdb_value ---
@(link_name = "duckdb_create_timestamp_s")                      duckdb_create_timestamp_s :: proc(input: duckdb_timestamp_s) -> duckdb_value ---
@(link_name = "duckdb_create_timestamp_ms")                     duckdb_create_timestamp_ms :: proc(input: duckdb_timestamp_ms) -> duckdb_value ---
@(link_name = "duckdb_create_timestamp_ns")                     duckdb_create_timestamp_ns :: proc(input: duckdb_timestamp_ns) -> duckdb_value ---
@(link_name = "duckdb_create_interval")                         duckdb_create_interval :: proc(input: duckdb_interval) -> duckdb_value ---
@(link_name = "duckdb_create_blob")                             duckdb_create_blob :: proc(data: [^]u8, length: idx_t) -> duckdb_value ---
@(link_name = "duckdb_create_bit")                              duckdb_create_bit :: proc(input: duckdb_bit) -> duckdb_value ---
@(link_name = "duckdb_create_uuid")                             duckdb_create_uuid :: proc(input: duckdb_uhugeint) -> duckdb_value ---
@(link_name = "duckdb_get_bool")                                duckdb_get_bool :: proc(val: duckdb_value) -> bool ---
@(link_name = "duckdb_get_int8")                                duckdb_get_int8 :: proc(val: duckdb_value) -> i8 ---
@(link_name = "duckdb_get_uint8")                               duckdb_get_uint8 :: proc(val: duckdb_value) -> u8 ---
@(link_name = "duckdb_get_int16")                               duckdb_get_int16 :: proc(val: duckdb_value) -> i16 ---
@(link_name = "duckdb_get_uint16")                              duckdb_get_uint16 :: proc(val: duckdb_value) -> u16 ---
@(link_name = "duckdb_get_int32")                               duckdb_get_int32 :: proc(val: duckdb_value) -> i32 ---
@(link_name = "duckdb_get_uint32")                              duckdb_get_uint32 :: proc(val: duckdb_value) -> u32 ---
@(link_name = "duckdb_get_int64")                               duckdb_get_int64 :: proc(val: duckdb_value) -> i64 ---
@(link_name = "duckdb_get_uint64")                              duckdb_get_uint64 :: proc(val: duckdb_value) -> u64 ---
@(link_name = "duckdb_get_hugeint")                             duckdb_get_hugeint :: proc(val: duckdb_value) -> duckdb_hugeint ---
@(link_name = "duckdb_get_uhugeint")                            duckdb_get_uhugeint :: proc(val: duckdb_value) -> duckdb_uhugeint ---
@(link_name = "duckdb_get_bignum")                              duckdb_get_bignum :: proc(val: duckdb_value) -> duckdb_bignum ---
@(link_name = "duckdb_get_decimal")                             duckdb_get_decimal :: proc(val: duckdb_value) -> duckdb_decimal ---
@(link_name = "duckdb_get_float")                               duckdb_get_float :: proc(val: duckdb_value) -> f32 ---
@(link_name = "duckdb_get_double")                              duckdb_get_double :: proc(val: duckdb_value) -> f64 ---
@(link_name = "duckdb_get_date")                                duckdb_get_date :: proc(val: duckdb_value) -> duckdb_date ---
@(link_name = "duckdb_get_time")                                duckdb_get_time :: proc(val: duckdb_value) -> duckdb_time ---
@(link_name = "duckdb_get_time_ns")                             duckdb_get_time_ns :: proc(val: duckdb_value) -> duckdb_time_ns ---
@(link_name = "duckdb_get_time_tz")                             duckdb_get_time_tz :: proc(val: duckdb_value) -> duckdb_time_tz ---
@(link_name = "duckdb_get_timestamp")                           duckdb_get_timestamp :: proc(val: duckdb_value) -> duckdb_timestamp ---
@(link_name = "duckdb_get_timestamp_tz")                        duckdb_get_timestamp_tz :: proc(val: duckdb_value) -> duckdb_timestamp ---
@(link_name = "duckdb_get_timestamp_s")                         duckdb_get_timestamp_s :: proc(val: duckdb_value) -> duckdb_timestamp_s ---
@(link_name = "duckdb_get_timestamp_ms")                        duckdb_get_timestamp_ms :: proc(val: duckdb_value) -> duckdb_timestamp_ms ---
@(link_name = "duckdb_get_timestamp_ns")                        duckdb_get_timestamp_ns :: proc(val: duckdb_value) -> duckdb_timestamp_ns ---
@(link_name = "duckdb_get_interval")                            duckdb_get_interval :: proc(val: duckdb_value) -> duckdb_interval ---
@(link_name = "duckdb_get_value_type")                          duckdb_get_value_type :: proc(val: duckdb_value) -> duckdb_logical_type ---
@(link_name = "duckdb_get_blob")                                duckdb_get_blob :: proc(val: duckdb_value) -> duckdb_blob ---
@(link_name = "duckdb_get_bit")                                 duckdb_get_bit :: proc(val: duckdb_value) -> duckdb_bit ---
@(link_name = "duckdb_get_uuid")                                duckdb_get_uuid :: proc(val: duckdb_value) -> duckdb_uhugeint ---
@(link_name = "duckdb_get_varchar")                             duckdb_get_varchar :: proc(value: duckdb_value) -> cstring ---
@(link_name = "duckdb_create_struct_value")                     duckdb_create_struct_value :: proc(type: duckdb_logical_type, values: [^]duckdb_value) -> duckdb_value ---
@(link_name = "duckdb_create_list_value")                       duckdb_create_list_value :: proc(type: duckdb_logical_type, values: [^]duckdb_value, value_count: idx_t) -> duckdb_value ---
@(link_name = "duckdb_create_array_value")                      duckdb_create_array_value :: proc(type: duckdb_logical_type, values: [^]duckdb_value, value_count: idx_t) -> duckdb_value ---
@(link_name = "duckdb_create_map_value")                        duckdb_create_map_value :: proc(map_type: duckdb_logical_type, keys: [^]duckdb_value, values: [^]duckdb_value, entry_count: idx_t) -> duckdb_value ---
@(link_name = "duckdb_create_union_value")                      duckdb_create_union_value :: proc(union_type: duckdb_logical_type, tag_index: idx_t, value: duckdb_value) -> duckdb_value ---
@(link_name = "duckdb_get_map_size")                            duckdb_get_map_size :: proc(value: duckdb_value) -> idx_t ---
@(link_name = "duckdb_get_map_key")                             duckdb_get_map_key :: proc(value: duckdb_value, index: idx_t) -> duckdb_value ---
@(link_name = "duckdb_get_map_value")                           duckdb_get_map_value :: proc(value: duckdb_value, index: idx_t) -> duckdb_value ---
@(link_name = "duckdb_is_null_value")                           duckdb_is_null_value :: proc(value: duckdb_value) -> bool ---
@(link_name = "duckdb_create_null_value")                       duckdb_create_null_value :: proc() -> duckdb_value ---
@(link_name = "duckdb_get_list_size")                           duckdb_get_list_size :: proc(value: duckdb_value) -> idx_t ---
@(link_name = "duckdb_get_list_child")                          duckdb_get_list_child :: proc(value: duckdb_value, index: idx_t) -> duckdb_value ---
@(link_name = "duckdb_create_enum_value")                       duckdb_create_enum_value :: proc(type: duckdb_logical_type, value: u64) -> duckdb_value ---
@(link_name = "duckdb_get_enum_value")                          duckdb_get_enum_value :: proc(value: duckdb_value) -> u64 ---
@(link_name = "duckdb_get_struct_child")                        duckdb_get_struct_child :: proc(value: duckdb_value, index: idx_t) -> duckdb_value ---
@(link_name = "duckdb_value_to_string")                         duckdb_value_to_string :: proc(value: duckdb_value) -> cstring ---

// Logical Type Interface
@(link_name = "duckdb_create_logical_type")                     duckdb_create_logical_type :: proc(type: duckdb_type) -> duckdb_logical_type ---
@(link_name = "duckdb_logical_type_get_alias")                  duckdb_logical_type_get_alias :: proc(type: duckdb_logical_type) -> cstring ---
@(link_name = "duckdb_logical_type_set_alias")                  duckdb_logical_type_set_alias :: proc(type: duckdb_logical_type, alias: cstring) ---
@(link_name = "duckdb_create_list_type")                        duckdb_create_list_type :: proc(type: duckdb_logical_type) -> duckdb_logical_type ---
@(link_name = "duckdb_create_array_type")                       duckdb_create_array_type :: proc(type: duckdb_logical_type, array_size: idx_t) -> duckdb_logical_type ---
@(link_name = "duckdb_create_map_type")                         duckdb_create_map_type :: proc(key_type: duckdb_logical_type, value_type: duckdb_logical_type) -> duckdb_logical_type ---
@(link_name = "duckdb_create_union_type")                       duckdb_create_union_type :: proc(member_types: [^]duckdb_logical_type, member_names: [^]cstring, member_count: idx_t) -> duckdb_logical_type ---
@(link_name = "duckdb_create_struct_type")                      duckdb_create_struct_type :: proc(member_types: [^]duckdb_logical_type, member_names: [^]cstring, member_count: idx_t) -> duckdb_logical_type ---
@(link_name = "duckdb_create_enum_type")                        duckdb_create_enum_type :: proc(member_names: [^]cstring, member_count: idx_t) -> duckdb_logical_type ---
@(link_name = "duckdb_create_decimal_type")                     duckdb_create_decimal_type :: proc(width: u8, scale: u8) -> duckdb_logical_type ---
@(link_name = "duckdb_get_type_id")                             duckdb_get_type_id :: proc(type: duckdb_logical_type) -> duckdb_type ---
@(link_name = "duckdb_decimal_width")                           duckdb_decimal_width :: proc(type: duckdb_logical_type) -> u8 ---
@(link_name = "duckdb_decimal_scale")                           duckdb_decimal_scale :: proc(type: duckdb_logical_type) -> u8 ---
@(link_name = "duckdb_decimal_internal_type")                   duckdb_decimal_internal_type :: proc(type: duckdb_logical_type) -> duckdb_type ---
@(link_name = "duckdb_enum_internal_type")                      duckdb_enum_internal_type :: proc(type: duckdb_logical_type) -> duckdb_type ---
@(link_name = "duckdb_enum_dictionary_size")                    duckdb_enum_dictionary_size :: proc(type: duckdb_logical_type) -> u32 ---
@(link_name = "duckdb_enum_dictionary_value")                   duckdb_enum_dictionary_value :: proc(type: duckdb_logical_type, index: idx_t) -> cstring ---
@(link_name = "duckdb_list_type_child_type")                    duckdb_list_type_child_type :: proc(type: duckdb_logical_type) -> duckdb_logical_type ---
@(link_name = "duckdb_array_type_child_type")                   duckdb_array_type_child_type :: proc(type: duckdb_logical_type) -> duckdb_logical_type ---
@(link_name = "duckdb_array_type_array_size")                   duckdb_array_type_array_size :: proc(type: duckdb_logical_type) -> idx_t ---
@(link_name = "duckdb_map_type_key_type")                       duckdb_map_type_key_type :: proc(type: duckdb_logical_type) -> duckdb_logical_type ---
@(link_name = "duckdb_map_type_value_type")                     duckdb_map_type_value_type :: proc(type: duckdb_logical_type) -> duckdb_logical_type ---
@(link_name = "duckdb_struct_type_child_count")                 duckdb_struct_type_child_count :: proc(type: duckdb_logical_type) -> idx_t ---
@(link_name = "duckdb_struct_type_child_name")                  duckdb_struct_type_child_name :: proc(type: duckdb_logical_type, index: idx_t) -> cstring ---
@(link_name = "duckdb_struct_type_child_type")                  duckdb_struct_type_child_type :: proc(type: duckdb_logical_type, index: idx_t) -> duckdb_logical_type ---
@(link_name = "duckdb_union_type_member_count")                 duckdb_union_type_member_count :: proc(type: duckdb_logical_type) -> idx_t ---
@(link_name = "duckdb_union_type_member_name")                  duckdb_union_type_member_name :: proc(type: duckdb_logical_type, index: idx_t) -> cstring ---
@(link_name = "duckdb_union_type_member_type")                  duckdb_union_type_member_type :: proc(type: duckdb_logical_type, index: idx_t) -> duckdb_logical_type ---
@(link_name = "duckdb_destroy_logical_type")                    duckdb_destroy_logical_type :: proc(type: ^duckdb_logical_type) ---
@(link_name = "duckdb_register_logical_type")                   duckdb_register_logical_type :: proc(con: duckdb_connection, type: duckdb_logical_type, info: duckdb_create_type_info) -> duckdb_state ---

// Data Chunk Interface
@(link_name = "duckdb_create_data_chunk")                       duckdb_create_data_chunk :: proc(types: [^]duckdb_logical_type, column_count: idx_t) -> duckdb_data_chunk ---
@(link_name = "duckdb_destroy_data_chunk")                      duckdb_destroy_data_chunk :: proc(chunk: ^duckdb_data_chunk) ---
@(link_name = "duckdb_data_chunk_reset")                        duckdb_data_chunk_reset :: proc(chunk: duckdb_data_chunk) ---
@(link_name = "duckdb_data_chunk_get_column_count")             duckdb_data_chunk_get_column_count :: proc(chunk: duckdb_data_chunk) -> idx_t ---
@(link_name = "duckdb_data_chunk_get_vector")                   duckdb_data_chunk_get_vector :: proc(chunk: duckdb_data_chunk, col_idx: idx_t) -> duckdb_vector ---
@(link_name = "duckdb_data_chunk_get_size")                     duckdb_data_chunk_get_size :: proc(chunk: duckdb_data_chunk) -> idx_t ---
@(link_name = "duckdb_data_chunk_set_size")                     duckdb_data_chunk_set_size :: proc(chunk: duckdb_data_chunk, size: idx_t) ---


// Vector Interface
@(link_name = "duckdb_create_vector")                           duckdb_create_vector :: proc(type: duckdb_logical_type, capacity: idx_t) -> duckdb_vector ---
@(link_name = "duckdb_destroy_vector")                          duckdb_destroy_vector :: proc(vector: ^duckdb_vector) ---
@(link_name = "duckdb_vector_get_column_type")                  duckdb_vector_get_column_type :: proc(vector: duckdb_vector) -> duckdb_logical_type ---
@(link_name = "duckdb_vector_get_data")                         duckdb_vector_get_data :: proc(vector: duckdb_vector) -> rawptr ---
@(link_name = "duckdb_vector_get_validity")                     duckdb_vector_get_validity :: proc(vector: duckdb_vector) -> [^]u64 ---
@(link_name = "duckdb_vector_ensure_validity_writable")         duckdb_vector_ensure_validity_writable :: proc(vector: duckdb_vector) ---
@(link_name = "duckdb_vector_assign_string_element")            duckdb_vector_assign_string_element :: proc(vector: duckdb_vector, index: idx_t, str: cstring) ---
@(link_name = "duckdb_vector_assign_string_element_len")        duckdb_vector_assign_string_element_len :: proc(vector: duckdb_vector, index: idx_t, str: cstring, str_len: idx_t) ---
@(link_name = "duckdb_list_vector_get_child")                   duckdb_list_vector_get_child :: proc(vector: duckdb_vector) -> duckdb_vector ---
@(link_name = "duckdb_list_vector_get_size")                    duckdb_list_vector_get_size :: proc(vector: duckdb_vector) -> idx_t ---
@(link_name = "duckdb_list_vector_set_size")                    duckdb_list_vector_set_size :: proc(vector: duckdb_vector, size: idx_t) -> duckdb_state ---
@(link_name = "duckdb_list_vector_reserve")                     duckdb_list_vector_reserve :: proc(vector: duckdb_vector, required_capacity: idx_t) -> duckdb_state ---
@(link_name = "duckdb_struct_vector_get_child")                 duckdb_struct_vector_get_child :: proc(vector: duckdb_vector, index: idx_t) -> duckdb_vector ---
@(link_name = "duckdb_array_vector_get_child")                  duckdb_array_vector_get_child :: proc(vector: duckdb_vector) -> duckdb_vector ---
@(link_name = "duckdb_slice_vector")                            duckdb_slice_vector :: proc(vector: duckdb_vector, sel: duckdb_selection_vector, len: idx_t) ---
@(link_name = "duckdb_vector_copy_sel")                         duckdb_vector_copy_sel :: proc(src: duckdb_vector, dst: duckdb_vector, sel: duckdb_selection_vector, src_count: idx_t, src_offset: idx_t, dst_offset: idx_t) ---
@(link_name = "duckdb_vector_reference_value")                  duckdb_vector_reference_value :: proc(vector: duckdb_vector, value: duckdb_value) ---
@(link_name = "duckdb_vector_reference_vector")                 duckdb_vector_reference_vector :: proc(to_vector: duckdb_vector, from_vector: duckdb_vector) ---

// Scalar Functions
@(link_name = "duckdb_create_scalar_function")                  duckdb_create_scalar_function :: proc() -> duckdb_scalar_function ---
@(link_name = "duckdb_destroy_scalar_function")                 duckdb_destroy_scalar_function :: proc(scalar_function: ^duckdb_scalar_function) ---
@(link_name = "duckdb_scalar_function_set_name")                duckdb_scalar_function_set_name :: proc(scalar_function: duckdb_scalar_function, name: cstring) ---
@(link_name = "duckdb_scalar_function_set_varargs")             duckdb_scalar_function_set_varargs :: proc(scalar_function: duckdb_scalar_function, type: duckdb_logical_type) ---
@(link_name = "duckdb_scalar_function_set_special_handling")    duckdb_scalar_function_set_special_handling :: proc(scalar_function: duckdb_scalar_function) ---
@(link_name = "duckdb_scalar_function_set_volatile")            duckdb_scalar_function_set_volatile :: proc(scalar_function: duckdb_scalar_function) ---
@(link_name = "duckdb_scalar_function_add_parameter")           duckdb_scalar_function_add_parameter :: proc(scalar_function: duckdb_scalar_function, type: duckdb_logical_type) ---
@(link_name = "duckdb_scalar_function_set_return_type")         duckdb_scalar_function_set_return_type :: proc(scalar_function: duckdb_scalar_function, type: duckdb_logical_type) ---
@(link_name = "duckdb_scalar_function_set_extra_info")          duckdb_scalar_function_set_extra_info :: proc(scalar_function: duckdb_scalar_function, extra_info: rawptr, destroy: duckdb_delete_callback_t) ---
@(link_name = "duckdb_scalar_function_set_bind")                duckdb_scalar_function_set_bind :: proc(scalar_function: duckdb_scalar_function, bind: duckdb_scalar_function_bind_t) ---
@(link_name = "duckdb_scalar_function_set_bind_data")           duckdb_scalar_function_set_bind_data :: proc(info: duckdb_bind_info, bind_data: rawptr, destroy: duckdb_delete_callback_t) ---
@(link_name = "duckdb_scalar_function_set_bind_data_copy")      duckdb_scalar_function_set_bind_data_copy :: proc(info: duckdb_bind_info, copy: duckdb_copy_callback_t) ---
@(link_name = "duckdb_scalar_function_bind_set_error")          duckdb_scalar_function_bind_set_error :: proc(info: duckdb_bind_info, error: cstring) ---
@(link_name = "duckdb_scalar_function_set_function")            duckdb_scalar_function_set_function :: proc(scalar_function: duckdb_scalar_function, function: duckdb_scalar_function_t) ---
@(link_name = "duckdb_register_scalar_function")                duckdb_register_scalar_function :: proc(con: duckdb_connection, scalar_function: duckdb_scalar_function) -> duckdb_state ---
@(link_name = "duckdb_scalar_function_get_extra_info")          duckdb_scalar_function_get_extra_info :: proc(info: duckdb_function_info) -> rawptr ---
@(link_name = "duckdb_scalar_function_bind_get_extra_info")     duckdb_scalar_function_bind_get_extra_info :: proc(info: duckdb_bind_info) -> rawptr ---
@(link_name = "duckdb_scalar_function_get_bind_data")           duckdb_scalar_function_get_bind_data :: proc(info: duckdb_function_info) -> rawptr ---
@(link_name = "duckdb_scalar_function_get_client_context")      duckdb_scalar_function_get_client_context :: proc(info: duckdb_bind_info, out_context: ^duckdb_client_context) ---
@(link_name = "duckdb_scalar_function_set_error")               duckdb_scalar_function_set_error :: proc(info: duckdb_function_info, error: cstring) ---
@(link_name = "duckdb_create_scalar_function_set")              duckdb_create_scalar_function_set :: proc(name: cstring) -> duckdb_scalar_function_set ---
@(link_name = "duckdb_destroy_scalar_function_set")             duckdb_destroy_scalar_function_set :: proc(scalar_function_set: ^duckdb_scalar_function_set) ---
@(link_name = "duckdb_add_scalar_function_to_set")              duckdb_add_scalar_function_to_set :: proc(set: duckdb_scalar_function_set, function: duckdb_scalar_function) -> duckdb_state ---
@(link_name = "duckdb_register_scalar_function_set")            duckdb_register_scalar_function_set :: proc(con: duckdb_connection, set: duckdb_scalar_function_set) -> duckdb_state ---
@(link_name = "duckdb_scalar_function_bind_get_argument_count") duckdb_scalar_function_bind_get_argument_count :: proc(info: duckdb_bind_info) -> idx_t ---
@(link_name = "duckdb_scalar_function_bind_get_argument")       duckdb_scalar_function_bind_get_argument :: proc(info: duckdb_bind_info, index: idx_t) -> duckdb_expression ---

// Selection Vector Interface
@(link_name = "duckdb_create_selection_vector")                 duckdb_create_selection_vector :: proc(size: idx_t) -> duckdb_selection_vector ---
@(link_name = "duckdb_destroy_selection_vector")                duckdb_destroy_selection_vector :: proc(sel: duckdb_selection_vector) ---
@(link_name = "duckdb_selection_vector_get_data_ptr")           duckdb_selection_vector_get_data_ptr :: proc(sel: duckdb_selection_vector) -> [^]sel_t ---

// Aggregate Functions
@(link_name = "duckdb_create_aggregate_function")               duckdb_create_aggregate_function :: proc() -> duckdb_aggregate_function ---
@(link_name = "duckdb_destroy_aggregate_function")              duckdb_destroy_aggregate_function :: proc(aggregate_function: ^duckdb_aggregate_function) ---
@(link_name = "duckdb_aggregate_function_set_name")             duckdb_aggregate_function_set_name :: proc(aggregate_function: duckdb_aggregate_function, name: cstring) ---
@(link_name = "duckdb_aggregate_function_add_parameter")        duckdb_aggregate_function_add_parameter :: proc(aggregate_function: duckdb_aggregate_function, type: duckdb_logical_type) ---
@(link_name = "duckdb_aggregate_function_set_return_type")      duckdb_aggregate_function_set_return_type :: proc(aggregate_function: duckdb_aggregate_function, type: duckdb_logical_type) ---
@(link_name = "duckdb_aggregate_function_set_functions")        duckdb_aggregate_function_set_functions :: proc(aggregate_function: duckdb_aggregate_function, state_size: duckdb_aggregate_state_size, state_init: duckdb_aggregate_init_t, update: duckdb_aggregate_update_t, combine: duckdb_aggregate_combine_t, finalize: duckdb_aggregate_finalize_t) ---
@(link_name = "duckdb_aggregate_function_set_destructor")       duckdb_aggregate_function_set_destructor :: proc(aggregate_function: duckdb_aggregate_function, destroy: duckdb_aggregate_destroy_t) ---
@(link_name = "duckdb_register_aggregate_function")             duckdb_register_aggregate_function :: proc(con: duckdb_connection, aggregate_function: duckdb_aggregate_function) -> duckdb_state ---
@(link_name = "duckdb_aggregate_function_set_special_handling") duckdb_aggregate_function_set_special_handling :: proc(aggregate_function: duckdb_aggregate_function) ---
@(link_name = "duckdb_aggregate_function_set_extra_info")       duckdb_aggregate_function_set_extra_info :: proc(aggregate_function: duckdb_aggregate_function, extra_info: rawptr, destroy: duckdb_delete_callback_t) ---
@(link_name = "duckdb_aggregate_function_get_extra_info")       duckdb_aggregate_function_get_extra_info :: proc(info: duckdb_function_info) -> rawptr ---
@(link_name = "duckdb_aggregate_function_set_error")            duckdb_aggregate_function_set_error :: proc(info: duckdb_function_info, error: cstring) ---
@(link_name = "duckdb_create_aggregate_function_set")           duckdb_create_aggregate_function_set :: proc(name: cstring) -> duckdb_aggregate_function_set ---
@(link_name = "duckdb_destroy_aggregate_function_set")          duckdb_destroy_aggregate_function_set :: proc(aggregate_function_set: ^duckdb_aggregate_function_set) ---
@(link_name = "duckdb_add_aggregate_function_to_set")           duckdb_add_aggregate_function_to_set :: proc(set: duckdb_aggregate_function_set, function: duckdb_aggregate_function) -> duckdb_state ---
@(link_name = "duckdb_register_aggregate_function_set")         duckdb_register_aggregate_function_set :: proc(con: duckdb_connection, set: duckdb_aggregate_function_set) -> duckdb_state ---


// Table Functions
@(link_name = "duckdb_create_table_function")                   duckdb_create_table_function :: proc() -> duckdb_table_function ---
@(link_name = "duckdb_destroy_table_function")                  duckdb_destroy_table_function :: proc(table_function: ^duckdb_table_function) ---
@(link_name = "duckdb_table_function_set_name")                 duckdb_table_function_set_name :: proc(table_function: duckdb_table_function, name: cstring) ---
@(link_name = "duckdb_table_function_add_parameter")            duckdb_table_function_add_parameter :: proc(table_function: duckdb_table_function, type: duckdb_logical_type) ---
@(link_name = "duckdb_table_function_add_named_parameter")      duckdb_table_function_add_named_parameter :: proc(table_function: duckdb_table_function, name: cstring, type: duckdb_logical_type) ---
@(link_name = "duckdb_table_function_set_extra_info")           duckdb_table_function_set_extra_info :: proc(table_function: duckdb_table_function, extra_info: rawptr, destroy: duckdb_delete_callback_t) ---
@(link_name = "duckdb_table_function_set_bind")                 duckdb_table_function_set_bind :: proc(table_function: duckdb_table_function, bind: duckdb_table_function_bind_t) ---
@(link_name = "duckdb_table_function_set_init")                 duckdb_table_function_set_init :: proc(table_function: duckdb_table_function, init: duckdb_table_function_init_t) ---
@(link_name = "duckdb_table_function_set_local_init")           duckdb_table_function_set_local_init :: proc(table_function: duckdb_table_function, init: duckdb_table_function_init_t) ---
@(link_name = "duckdb_table_function_set_function")             duckdb_table_function_set_function :: proc(table_function: duckdb_table_function, function: duckdb_table_function_t) ---
@(link_name = "duckdb_table_function_supports_projection_pushdown") duckdb_table_function_supports_projection_pushdown :: proc(table_function: duckdb_table_function, pushdown: bool) ---
@(link_name = "duckdb_register_table_function")                 duckdb_register_table_function :: proc(con: duckdb_connection, function: duckdb_table_function) -> duckdb_state ---

// Table Function Bind
@(link_name = "duckdb_bind_get_extra_info")                     duckdb_bind_get_extra_info :: proc(info: duckdb_bind_info) -> rawptr ---
@(link_name = "duckdb_table_function_get_client_context")       duckdb_table_function_get_client_context :: proc(info: duckdb_bind_info, out_context: ^duckdb_client_context) ---
@(link_name = "duckdb_bind_add_result_column")                  duckdb_bind_add_result_column :: proc(info: duckdb_bind_info, name: cstring, type: duckdb_logical_type) ---
@(link_name = "duckdb_bind_get_parameter_count")                duckdb_bind_get_parameter_count :: proc(info: duckdb_bind_info) -> idx_t ---
@(link_name = "duckdb_bind_get_parameter")                      duckdb_bind_get_parameter :: proc(info: duckdb_bind_info, index: idx_t) -> duckdb_value ---
@(link_name = "duckdb_bind_get_named_parameter")                duckdb_bind_get_named_parameter :: proc(info: duckdb_bind_info, name: cstring) -> duckdb_value ---
@(link_name = "duckdb_bind_set_bind_data")                      duckdb_bind_set_bind_data :: proc(info: duckdb_bind_info, bind_data: rawptr, destroy: duckdb_delete_callback_t) ---
@(link_name = "duckdb_bind_set_cardinality")                    duckdb_bind_set_cardinality :: proc(info: duckdb_bind_info, cardinality: idx_t, is_exact: bool) ---
@(link_name = "duckdb_bind_set_error")                          duckdb_bind_set_error :: proc(info: duckdb_bind_info, error: cstring) ---

// Table Function Init
@(link_name = "duckdb_init_get_extra_info")                     duckdb_init_get_extra_info :: proc(info: duckdb_init_info) -> rawptr ---
@(link_name = "duckdb_init_get_bind_data")                      duckdb_init_get_bind_data :: proc(info: duckdb_init_info) -> rawptr ---
@(link_name = "duckdb_init_set_init_data")                      duckdb_init_set_init_data :: proc(info: duckdb_init_info, init_data: rawptr, destroy: duckdb_delete_callback_t) ---
@(link_name = "duckdb_init_get_column_count")                   duckdb_init_get_column_count :: proc(info: duckdb_init_info) -> idx_t ---
@(link_name = "duckdb_init_get_column_index")                   duckdb_init_get_column_index :: proc(info: duckdb_init_info, column_index: idx_t) -> idx_t ---
@(link_name = "duckdb_init_set_max_threads")                    duckdb_init_set_max_threads :: proc(info: duckdb_init_info, max_threads: idx_t) ---
@(link_name = "duckdb_init_set_error")                          duckdb_init_set_error :: proc(info: duckdb_init_info, error: cstring) ---

// Table Function
@(link_name = "duckdb_function_get_extra_info")                 duckdb_function_get_extra_info :: proc(info: duckdb_function_info) -> rawptr ---
@(link_name = "duckdb_function_get_bind_data")                  duckdb_function_get_bind_data :: proc(info: duckdb_function_info) -> rawptr ---
@(link_name = "duckdb_function_get_init_data")                  duckdb_function_get_init_data :: proc(info: duckdb_function_info) -> rawptr ---
@(link_name = "duckdb_function_get_local_init_data")            duckdb_function_get_local_init_data :: proc(info: duckdb_function_info) -> rawptr ---
@(link_name = "duckdb_function_set_error")                      duckdb_function_set_error :: proc(info: duckdb_function_info, error: cstring) ---

// Replacement Scans
@(link_name = "duckdb_add_replacement_scan")                    duckdb_add_replacement_scan :: proc(db: duckdb_database, replacement: duckdb_replacement_callback_t, extra_data: rawptr, delete_callback: duckdb_delete_callback_t) ---
@(link_name = "duckdb_replacement_scan_set_function_name")      duckdb_replacement_scan_set_function_name :: proc(info: duckdb_replacement_scan_info, function_name: cstring) ---
@(link_name = "duckdb_replacement_scan_add_parameter")          duckdb_replacement_scan_add_parameter :: proc(info: duckdb_replacement_scan_info, parameter: duckdb_value) ---
@(link_name = "duckdb_replacement_scan_set_error")              duckdb_replacement_scan_set_error :: proc(info: duckdb_replacement_scan_info, error: cstring) ---

// Profiling Info
@(link_name = "duckdb_get_profiling_info")                      duckdb_get_profiling_info :: proc(connection: duckdb_connection) -> duckdb_profiling_info ---
@(link_name = "duckdb_profiling_info_get_value")                duckdb_profiling_info_get_value :: proc(info: duckdb_profiling_info, key: cstring) -> duckdb_value ---
@(link_name = "duckdb_profiling_info_get_metrics")              duckdb_profiling_info_get_metrics :: proc(info: duckdb_profiling_info) -> duckdb_value ---
@(link_name = "duckdb_profiling_info_get_child_count")          duckdb_profiling_info_get_child_count :: proc(info: duckdb_profiling_info) -> idx_t ---
@(link_name = "duckdb_profiling_info_get_child")                duckdb_profiling_info_get_child :: proc(info: duckdb_profiling_info, index: idx_t) -> duckdb_profiling_info ---

// Appender
@(link_name = "duckdb_appender_create")                         duckdb_appender_create :: proc(connection: duckdb_connection, schema: cstring, table: cstring, out_appender: ^duckdb_appender) -> duckdb_state ---
@(link_name = "duckdb_appender_create_ext")                     duckdb_appender_create_ext :: proc(connection: duckdb_connection, catalog: cstring, schema: cstring, table: cstring, out_appender: ^duckdb_appender) -> duckdb_state ---
@(link_name = "duckdb_appender_create_query")                   duckdb_appender_create_query :: proc(connection: duckdb_connection, query: cstring, column_count: idx_t, types: [^]duckdb_logical_type, table_name: cstring, column_names: [^]cstring, out_appender: ^duckdb_appender) -> duckdb_state ---
@(link_name = "duckdb_appender_column_count")                   duckdb_appender_column_count :: proc(appender: duckdb_appender) -> idx_t ---
@(link_name = "duckdb_appender_column_type")                    duckdb_appender_column_type :: proc(appender: duckdb_appender, col_idx: idx_t) -> duckdb_logical_type ---
@(link_name = "duckdb_appender_error")                          duckdb_appender_error :: proc(appender: duckdb_appender) -> cstring ---
@(link_name = "duckdb_appender_error_data")                     duckdb_appender_error_data :: proc(appender: duckdb_appender) -> duckdb_error_data ---
@(link_name = "duckdb_appender_flush")                          duckdb_appender_flush :: proc(appender: duckdb_appender) -> duckdb_state ---
@(link_name = "duckdb_appender_close")                          duckdb_appender_close :: proc(appender: duckdb_appender) -> duckdb_state ---
@(link_name = "duckdb_appender_destroy")                        duckdb_appender_destroy :: proc(appender: ^duckdb_appender) -> duckdb_state ---
@(link_name = "duckdb_appender_add_column")                     duckdb_appender_add_column :: proc(appender: duckdb_appender, name: cstring) -> duckdb_state ---
@(link_name = "duckdb_appender_clear_columns")                  duckdb_appender_clear_columns :: proc(appender: duckdb_appender) -> duckdb_state ---
@(link_name = "duckdb_appender_begin_row")                      duckdb_appender_begin_row :: proc(appender: duckdb_appender) -> duckdb_state ---
@(link_name = "duckdb_appender_end_row")                        duckdb_appender_end_row :: proc(appender: duckdb_appender) -> duckdb_state ---
@(link_name = "duckdb_append_default")                          duckdb_append_default :: proc(appender: duckdb_appender) -> duckdb_state ---
@(link_name = "duckdb_append_default_to_chunk")                 duckdb_append_default_to_chunk :: proc(appender: duckdb_appender, chunk: duckdb_data_chunk, col: idx_t, row: idx_t) -> duckdb_state ---
@(link_name = "duckdb_append_bool")                             duckdb_append_bool :: proc(appender: duckdb_appender, value: bool) -> duckdb_state ---
@(link_name = "duckdb_append_int8")                             duckdb_append_int8 :: proc(appender: duckdb_appender, value: i8) -> duckdb_state ---
@(link_name = "duckdb_append_int16")                            duckdb_append_int16 :: proc(appender: duckdb_appender, value: i16) -> duckdb_state ---
@(link_name = "duckdb_append_int32")                            duckdb_append_int32 :: proc(appender: duckdb_appender, value: i32) -> duckdb_state ---
@(link_name = "duckdb_append_int64")                            duckdb_append_int64 :: proc(appender: duckdb_appender, value: i64) -> duckdb_state ---
@(link_name = "duckdb_append_hugeint")                          duckdb_append_hugeint :: proc(appender: duckdb_appender, value: duckdb_hugeint) -> duckdb_state ---
@(link_name = "duckdb_append_uint8")                            duckdb_append_uint8 :: proc(appender: duckdb_appender, value: u8) -> duckdb_state ---
@(link_name = "duckdb_append_uint16")                           duckdb_append_uint16 :: proc(appender: duckdb_appender, value: u16) -> duckdb_state ---
@(link_name = "duckdb_append_uint32")                           duckdb_append_uint32 :: proc(appender: duckdb_appender, value: u32) -> duckdb_state ---
@(link_name = "duckdb_append_uint64")                           duckdb_append_uint64 :: proc(appender: duckdb_appender, value: u64) -> duckdb_state ---
@(link_name = "duckdb_append_uhugeint")                         duckdb_append_uhugeint :: proc(appender: duckdb_appender, value: duckdb_uhugeint) -> duckdb_state ---
@(link_name = "duckdb_append_float")                            duckdb_append_float :: proc(appender: duckdb_appender, value: f32) -> duckdb_state ---
@(link_name = "duckdb_append_double")                           duckdb_append_double :: proc(appender: duckdb_appender, value: f64) -> duckdb_state ---
@(link_name = "duckdb_append_date")                             duckdb_append_date :: proc(appender: duckdb_appender, value: duckdb_date) -> duckdb_state ---
@(link_name = "duckdb_append_time")                             duckdb_append_time :: proc(appender: duckdb_appender, value: duckdb_time) -> duckdb_state ---
@(link_name = "duckdb_append_timestamp")                        duckdb_append_timestamp :: proc(appender: duckdb_appender, value: duckdb_timestamp) -> duckdb_state ---
@(link_name = "duckdb_append_interval")                         duckdb_append_interval :: proc(appender: duckdb_appender, value: duckdb_interval) -> duckdb_state ---
@(link_name = "duckdb_append_varchar")                          duckdb_append_varchar :: proc(appender: duckdb_appender, val: cstring) -> duckdb_state ---
@(link_name = "duckdb_append_varchar_length")                   duckdb_append_varchar_length :: proc(appender: duckdb_appender, val: cstring, length: idx_t) -> duckdb_state ---
@(link_name = "duckdb_append_blob")                             duckdb_append_blob :: proc(appender: duckdb_appender, data: rawptr, length: idx_t) -> duckdb_state ---
@(link_name = "duckdb_append_null")                             duckdb_append_null :: proc(appender: duckdb_appender) -> duckdb_state ---
@(link_name = "duckdb_append_value")                            duckdb_append_value :: proc(appender: duckdb_appender, value: duckdb_value) -> duckdb_state ---
@(link_name = "duckdb_append_data_chunk")                       duckdb_append_data_chunk :: proc(appender: duckdb_appender, chunk: duckdb_data_chunk) -> duckdb_state ---

// Table Description
@(link_name = "duckdb_table_description_create")                duckdb_table_description_create :: proc(connection: duckdb_connection, schema: cstring, table: cstring, out: ^duckdb_table_description) -> duckdb_state ---
@(link_name = "duckdb_table_description_create_ext")            duckdb_table_description_create_ext :: proc(connection: duckdb_connection, catalog: cstring, schema: cstring, table: cstring, out: ^duckdb_table_description) -> duckdb_state ---
@(link_name = "duckdb_table_description_destroy")               duckdb_table_description_destroy :: proc(table_description: ^duckdb_table_description) ---
@(link_name = "duckdb_table_description_error")                 duckdb_table_description_error :: proc(table_description: duckdb_table_description) -> cstring ---
@(link_name = "duckdb_column_has_default")                      duckdb_column_has_default :: proc(table_description: duckdb_table_description, index: idx_t, out: ^bool) -> duckdb_state ---
@(link_name = "duckdb_table_description_get_column_name")       duckdb_table_description_get_column_name :: proc(table_description: duckdb_table_description, index: idx_t) -> cstring ---

// Arrow Interface
@(link_name = "duckdb_to_arrow_schema")                         duckdb_to_arrow_schema :: proc(arrow_options: duckdb_arrow_options, types: [^]duckdb_logical_type, names: [^]cstring, column_count: idx_t, out_schema: ^ArrowSchema) -> duckdb_error_data ---
@(link_name = "duckdb_data_chunk_to_arrow")                     duckdb_data_chunk_to_arrow :: proc(arrow_options: duckdb_arrow_options, chunk: duckdb_data_chunk, out_arrow_array: ^ArrowArray) -> duckdb_error_data ---
@(link_name = "duckdb_schema_from_arrow")                       duckdb_schema_from_arrow :: proc(connection: duckdb_connection, schema: ^ArrowSchema, out_types: ^duckdb_arrow_converted_schema) -> duckdb_error_data ---
@(link_name = "duckdb_data_chunk_from_arrow")                   duckdb_data_chunk_from_arrow :: proc(connection: duckdb_connection, arrow_array: ^ArrowArray, converted_schema: duckdb_arrow_converted_schema, out_chunk: ^duckdb_data_chunk) -> duckdb_error_data ---
@(link_name = "duckdb_destroy_arrow_converted_schema")          duckdb_destroy_arrow_converted_schema :: proc(arrow_converted_schema: ^duckdb_arrow_converted_schema) ---
@(link_name = "duckdb_query_arrow")                             duckdb_query_arrow :: proc(connection: duckdb_connection, query: cstring, out_result: ^duckdb_arrow) -> duckdb_state ---
@(link_name = "duckdb_query_arrow_schema")                      duckdb_query_arrow_schema :: proc(result: duckdb_arrow, out_schema: ^duckdb_arrow_schema) -> duckdb_state ---
@(link_name = "duckdb_prepared_arrow_schema")                   duckdb_prepared_arrow_schema :: proc(prepared: duckdb_prepared_statement, out_schema: ^duckdb_arrow_schema) -> duckdb_state ---
@(link_name = "duckdb_result_arrow_array")                      duckdb_result_arrow_array :: proc(result: duckdb_result, chunk: duckdb_data_chunk, out_array: ^duckdb_arrow_array) ---
@(link_name = "duckdb_query_arrow_array")                       duckdb_query_arrow_array :: proc(result: duckdb_arrow, out_array: ^duckdb_arrow_array) -> duckdb_state ---
@(link_name = "duckdb_arrow_column_count")                      duckdb_arrow_column_count :: proc(result: duckdb_arrow) -> idx_t ---
@(link_name = "duckdb_arrow_row_count")                         duckdb_arrow_row_count :: proc(result: duckdb_arrow) -> idx_t ---
@(link_name = "duckdb_arrow_rows_changed")                      duckdb_arrow_rows_changed :: proc(result: duckdb_arrow) -> idx_t ---
@(link_name = "duckdb_query_arrow_error")                       duckdb_query_arrow_error :: proc(result: duckdb_arrow) -> cstring ---
@(link_name = "duckdb_destroy_arrow")                           duckdb_destroy_arrow :: proc(result: ^duckdb_arrow) ---
@(link_name = "duckdb_destroy_arrow_stream")                    duckdb_destroy_arrow_stream :: proc(stream_p: ^duckdb_arrow_stream) ---
@(link_name = "duckdb_execute_prepared_arrow")                  duckdb_execute_prepared_arrow :: proc(prepared_statement: duckdb_prepared_statement, out_result: ^duckdb_arrow) -> duckdb_state ---
@(link_name = "duckdb_arrow_scan")                              duckdb_arrow_scan :: proc(connection: duckdb_connection, table_name: cstring, arrow: duckdb_arrow_stream) -> duckdb_state ---
@(link_name = "duckdb_arrow_array_scan")                        duckdb_arrow_array_scan :: proc(connection: duckdb_connection, table_name: cstring, arrow_schema: duckdb_arrow_schema, arrow_array: duckdb_arrow_array, out_stream: ^duckdb_arrow_stream) -> duckdb_state ---

// Threading Information
@(link_name = "duckdb_execute_tasks")                           duckdb_execute_tasks :: proc(database: duckdb_database, max_tasks: idx_t) ---
@(link_name = "duckdb_create_task_state")                       duckdb_create_task_state :: proc(database: duckdb_database) -> duckdb_task_state ---
@(link_name = "duckdb_execute_tasks_state")                     duckdb_execute_tasks_state :: proc(state: duckdb_task_state) ---
@(link_name = "duckdb_execute_n_tasks_state")                   duckdb_execute_n_tasks_state :: proc(state: duckdb_task_state, max_tasks: idx_t) -> idx_t ---
@(link_name = "duckdb_finish_execution")                        duckdb_finish_execution :: proc(state: duckdb_task_state) ---
@(link_name = "duckdb_task_state_is_finished")                  duckdb_task_state_is_finished :: proc(state: duckdb_task_state) -> bool ---
@(link_name = "duckdb_destroy_task_state")                      duckdb_destroy_task_state :: proc(state: duckdb_task_state) ---
@(link_name = "duckdb_execution_is_finished")                   duckdb_execution_is_finished :: proc(con: duckdb_connection) -> bool ---

// Streaming Result Interface
@(link_name = "duckdb_stream_fetch_chunk")                      duckdb_stream_fetch_chunk :: proc(result: duckdb_result) -> duckdb_data_chunk ---
@(link_name = "duckdb_fetch_chunk")                             duckdb_fetch_chunk :: proc(result: duckdb_result) -> duckdb_data_chunk ---

// Cast Functions
@(link_name = "duckdb_create_cast_function")                    duckdb_create_cast_function :: proc() -> duckdb_cast_function ---
@(link_name = "duckdb_cast_function_set_source_type")           duckdb_cast_function_set_source_type :: proc(cast_function: duckdb_cast_function, source_type: duckdb_logical_type) ---
@(link_name = "duckdb_cast_function_set_target_type")           duckdb_cast_function_set_target_type :: proc(cast_function: duckdb_cast_function, target_type: duckdb_logical_type) ---
@(link_name = "duckdb_cast_function_set_implicit_cast_cost")    duckdb_cast_function_set_implicit_cast_cost :: proc(cast_function: duckdb_cast_function, cost: i64) ---
@(link_name = "duckdb_cast_function_set_function")              duckdb_cast_function_set_function :: proc(cast_function: duckdb_cast_function, function: duckdb_cast_function_t) ---
@(link_name = "duckdb_cast_function_set_extra_info")            duckdb_cast_function_set_extra_info :: proc(cast_function: duckdb_cast_function, extra_info: rawptr, destroy: duckdb_delete_callback_t) ---
@(link_name = "duckdb_cast_function_get_extra_info")            duckdb_cast_function_get_extra_info :: proc(info: duckdb_function_info) -> rawptr ---
@(link_name = "duckdb_cast_function_get_cast_mode")             duckdb_cast_function_get_cast_mode :: proc(info: duckdb_function_info) -> duckdb_cast_mode ---
@(link_name = "duckdb_cast_function_set_error")                 duckdb_cast_function_set_error :: proc(info: duckdb_function_info, error: cstring) ---
@(link_name = "duckdb_cast_function_set_row_error")             duckdb_cast_function_set_row_error :: proc(info: duckdb_function_info, error: cstring, row: idx_t, output: duckdb_vector) ---
@(link_name = "duckdb_register_cast_function")                  duckdb_register_cast_function :: proc(con: duckdb_connection, cast_function: duckdb_cast_function) -> duckdb_state ---
@(link_name = "duckdb_destroy_cast_function")                   duckdb_destroy_cast_function :: proc(cast_function: ^duckdb_cast_function) ---


// Expression Interface
@(link_name = "duckdb_destroy_expression")                      duckdb_destroy_expression :: proc(expr: ^duckdb_expression) ---
@(link_name = "duckdb_expression_return_type")                  duckdb_expression_return_type :: proc(expr: duckdb_expression) -> duckdb_logical_type ---
@(link_name = "duckdb_expression_is_foldable")                  duckdb_expression_is_foldable :: proc(expr: duckdb_expression) -> bool ---
@(link_name = "duckdb_expression_fold")                         duckdb_expression_fold :: proc(ctx: duckdb_client_context, expr: duckdb_expression, out_value: ^duckdb_value) -> duckdb_error_data ---

}


//odinfmt: enable
