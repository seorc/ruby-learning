require "mysql"

begin
	conn = Mysql.new "localhost", "seorc", "hola123!", 'ruby_tests'
	conn.set_server_option Mysql::OPTION_MULTI_STATEMENTS_ON

	conn.list_dbs.each do |base|
		puts base
	end

	conn.query("create table if not exists alumno(\
		id_alumno integer not null primary key,
		nombre varchar(50) not null,
		numero_cuenta varchar(9) not null);")
	#conn.query("insert into alumno values(6, 'Daniel', '99887766');\
	#	insert into alumno values(7, 'Daniel', '99887766');\
	#	insert into alumno values(5, 'Daniel', '99887766');")

	results = conn.query("select * from alumno")
	results.each_hash do |r|
		p r
	end
	
	# It's necessary to re-run the query to use another results extracting method.
	results = conn.query("select * from alumno")
	results.num_rows.times do
		puts results.fetch_row.join(" ")
	end




rescue Mysql::Error=>error
	puts "Error #{error.errno}: #{error.error}"

ensure
	conn.close if conn

end