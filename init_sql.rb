#!/usr/bin/env ruby

require 'io/console'
require 'sqlite3'
require 'CSV'

def get_schema(field, type)
  "pairwise concat the field and type array to form schema"
  decl = []
  field.flatten!
  type.flatten!
  while (not field.empty?) and (not type.empty?)
    name = field.shift
    kind = type.shift
    column = name + " " + kind
    decl.push column
  end
  schema = decl.join ", "
  # puts schema
  return schema
end

def get_csv(table, suffix)
  "get the csv file into an array"
  file = "#{table}.#{suffix}"
  data = CSV.read file
  field = ["ID"]
  type = ["integer"]
  field << data.shift
  type << data.shift
  schema = get_schema field, type
  return [schema, data]
end

def get_sqlite3(database, table, schema)
  "make the sqlite3 from the create table statement"
  stmt = "create table #{table} (#{schema})"
  puts stmt
  db = SQLite3::Database.new "#{database}"
  db.execute stmt
  db
end

def make_table(database, table, suffix)
  "make the sqlite3 table from the given csv file name"

  schema, data = get_csv table, suffix
  db = get_sqlite3 database, table, schema

  data.each_with_index do |row, index|
    data = ["\"#{index}\""]
    data << row.collect { |r| "\"#{r}\"" }
    row = data.join ", "
    stmt = "INSERT INTO #{table} values (#{row})"
    db.execute stmt
  end
end

def build_database(database, files)
  "build a database with all the given tables"
  files.each do |file|
    table, suffix = file.split /\./
    make_table database, table, suffix
  end
end

build_database ARGV[0], ARGV[1..-1]
