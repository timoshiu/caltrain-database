
create table agency 
(
   agency_id char(50),
   agency_name char(50),
   agency_url char(50),
   agency_timezone char(50),
   agency_phone char(50),
   agency_lang char(50)
);

create table calendar
(
   service_id char(50),
   monday char(50),
   tuesday char(50),
   wednesday char(50),
   thursday char(50),
   friday char(50),
   saturday char(50),
   sunday char(50),
   start_date char(50),
   end_date char(50)
);

create table calendar_dates
(
   service_id char(50),
   date char(50),
   exception_type char(50)
);

create table fare_attributes
(
   fare_id char(50),
   price float,
   currency_type char(50),
   payment_method char(50),
   transfers char(50),
   transfer_duration char(50)
);

create table fare_rules
(
   fare_id char(50),
   route_id char(50),
   origin_id char(50),
   destination_id char(50),
   contains_id char(50)
);

create table routes
(
   route_id char(50),
   route_short_name char(50),
   route_long_name char(50),
   route_desc char(50),
   route_type int,
   route_url char(50),
   route_color char(50),
   route_text_color char(50)
);

create table shapes
(
   shape_id char(50),
   shape_pt_lat char(20),
   shape_pt_lon char(20),
   shape_pt_sequence int,
   shape_dist_traveled char(50)
);

create table stop_times
(
   trip_id char(50),
   arrival_time char(50),
   departure_time char(50),
   stop_id char(50),
   stop_sequence int,
   pickup_type char(50),
   drop_off_type char(50),
   shape_dist_traveled char(50)
);

create table stops
(
   stop_id char(50),
   stop_name char(50),
   stop_desc char(100),
   stop_lat char(20),
   stop_lon char(20),
   zone_id char(20),
   stop_url char(50)
);

create table trips
(
   trip_id char(50),
   route_id char(50), 
   service_id char(50), 
   trip_headsign char(50),
   direction_id char(50),
   block_id char(50),
   shape_id char(50)
);

