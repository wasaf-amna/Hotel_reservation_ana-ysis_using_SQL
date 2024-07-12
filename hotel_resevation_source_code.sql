create database hotel_resevation 
use hotel_resevation
select *
from Hotel_Reservations;
    
	           -- 1. What is the total number of reservations in the dataset?--

select COUNT( DISTINCT Booking_ID ) as total_number_of_reservation
from Hotel_Reservations;
    

	            -- 2. Which meal plan is the most popular among guests? --

 select  type_of_meal_plan, count(type_of_meal_plan) as most_popular_popular
 from Hotel_Reservations
 group by  type_of_meal_plan
 ORDER BY type_of_meal_plan DESC;


            --3. What is the average price per room for reservations involving children?--

select round (avg(avg_price_per_room),2) as average_price
from Hotel_Reservations
where no_of_children > 0;
 

                --4. How many reservations were made for the year 20XX (replace XX with the desired year)? --

select  year ,count(Booking_ID) as resevation_in_year 
from Hotel_Reservations
group by year
having year = 2017;


            --5. What is the most commonly booked room type? --

select room_type_reserved, count (room_type_reserved) as no_of_room_most_commonly_used
from Hotel_Reservations
group by room_type_reserved
order by room_type_reserved;
            
			--6. How many reservations fall on a weekend (no_of_weekend_nights > 0)? --


select count(no_of_weekend_nights) as total_resevation_weekend
from Hotel_Reservations
where no_of_weekend_nights > 0;


             --7. What is the highest and lowest lead time for reservations? --

			 --for max--
select max(lead_time) as max_lead_time
from Hotel_Reservations;

          --for min--
select min(lead_time) as min_lead_time
from Hotel_Reservations;
 

               --8. What is the most common market segment type for reservations? --

select market_segment_type, count(market_segment_type) as most_common_market_segment
from Hotel_Reservations
group by  market_segment_type
order by market_segment_type desc;

              --9. How many reservations have a booking status of "Confirmed"?--

 select booking_status, count(booking_status) as no_of_booking_status_condirmed
 from Hotel_Reservations
 group by booking_status
 order by booking_status desc;
  
            --10. What is the total number of adults and children across all reservations?--

             -- for adults 
  select  sum(no_of_adults) as total_adults_resevation
   from Hotel_Reservations;
    -- for children

	select  sum(no_of_children) as total_children_resevation
   from Hotel_Reservations;
   
           --11. What is the average number of weekend nights for reservations involving children?--

    select no_of_children, AVG(no_of_weekend_nights) as avg_of_weekend_nights
	from Hotel_Reservations
	group by no_of_children
	having no_of_children !=0;

	              --12. How many reservations were made in each month of the year?--
 
 select count(Booking_ID), month
 from Hotel_Reservations
 group by month;
 
       

    --13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?--
	  
	  --  for no_of_weekend_nights--

	select  count(Booking_ID) as count_of_person , room_type_reserved, avg (no_of_weekend_nights) as avg_of_weekend_nights
	from Hotel_Reservations
	group by  room_type_reserved;

	--  for no_of_week_nights--
	select  count(Booking_ID) as count_of_person , room_type_reserved, avg (no_of_week_nights) as avg_of_week_nights
	from Hotel_Reservations
	group by  room_type_reserved;
	
	
--14. For reservations involving children, what is the most common room type, and what is the average price for that room type?--
  

    select count(no_of_children) as count_of_every_children , room_type_reserved, round(avg(avg_price_per_room),1) as avg_price_of_room
    from Hotel_Reservations
	group by  room_type_reserved;

	    
		--15. Find the market segment type that generates the highest average price per room--


    select  market_segment_type, round(max(avg_price_per_room),0) as highest_market_segmentation
    from Hotel_Reservations
	group by  market_segment_type
	order by highest_market_segmentation desc;


	