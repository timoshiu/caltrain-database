#!/usr/bin/env ruby

class MkSqlite3

      require 'fileutils'
      include FileUtils

      def MkSqlite3.mk_col (file, output)
          src = "#{file}.txt"
	  sch = "#{file}.sch"
	  %x(head -1 #{src} > #{sch})

      	  field = File.open sch, 'r'
	  columns = field.gets.chomp.split(',')
	  columns.each do |col|
	        output.puts "#{col} char(50),"	  
	  end
	  File.delete sch
      end

      def MkSqlite3.mk_sql (file)
          src = "#{file}.txt"
	  sql = "#{file}.sql"

	  File.open(sql, 'w') do |f|
	  	f.puts "create table #{file} ("
		MkSqlite3.mk_col file, f
		f.puts ");"
	  end
      end

      def MkSqlite3.mk_dat (file)
          src = "#{file}.txt"
	  tmp = "#{file}.tmp"
	  dat = "#{file}.dat"

	  puts "mk_dat #{src}, #{tmp}, #{dat}"
      	  %x(cp #{src} #{tmp})
	  %x(tail +2 #{tmp} > #{dat})
	  File.delete tmp
      end

      def MkSqlite3.mk_all
      	  files = ['agency', 'calendar', 'calendar_dates', 
          'fare_attributes', 'fare_rules', 'routes', 
          'shapes', 'stop_times', 'stops', 'trips']

	  files.each do |file|
	     MkSqlite3.mk_dat file
	     MkSqlite3.mk_sql file
	  end
      end

end

MkSqlite3.mk_all
