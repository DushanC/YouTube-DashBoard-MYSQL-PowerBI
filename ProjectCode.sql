-- #YOUTUBE TOP PLAYERS
--  Question Number 1( Top continets in the YT space; Uploads, views, earnings and Subs)

 SELECT
  case    
      when Country in ("Algeria","Angola","Benin","Botswana","Burkina Faso","Burundi","Cabo Verde","Cameroon","Central African Republic",
           "Chad","Comoros","Congo, Dem. Rep", "Congo, Rep.","Cote d'Ivoire","Djibouti","Egypt","Equatorial Guinea","Eritrea",
           "Eswatini (formerly Swaziland)","Ethiopia","Gabon","Gambia","Ghana","Guinea","Guinea-Bissau","Kenya", "Lesotho",
           "Liberia",'Libya',"Madagascar","Malawi","Mali","Mauritania","Mauritius","Morocco","Mozambique","Namibia",
           "Niger","Nigeria","Rwanda","Sao Tome and Principe","Senegal","Seychelles","Sierra Leone","Somalia","South Africa",
           "South Sudan","Sudan","Tanzania""Togo","Tunisia","Uganda","Zambia","Zimbabwe") then 'Africa'

      when Country in ("Albania","Andorra", "Armenia","Austria","Azerbaijan","Belarus","Belgium","Bosnia and Herzegovina",
           "Bulgaria","Croatia","Cyprus","Czechia","Denmark","Estonia","Finland","France","Georgia","Germany",
           "Greece","Hungary","Iceland","Ireland","Italy","Kazakhstan","Kosovo","Latvia","Liechtenstein","Lithuania",
           "Luxembourg","Malta","Moldova","Monaco","Montenegro","Netherlands","Macedonia, FYR","Norway","Poland","Portugal",
           "Romania","Russia","San Marino","Serbia","Slovakia","Slovenia","Spain","Sweden","Switzerland","Turkey",
          "Ukraine","United Kingdom","Vatican City") then 'Europe'

      when Country in ("Afghanistan","Armenia","Azerbaijan","Bahrain","Bangladesh", "Bhutan","Brunei","Cambodia","China","Cyprus",
         "Georgia","India","Indonesia","Iran","Iraq","Israel","Japan","Jordan","Kazakhstan","Kuwait","Kyrgyzstan","Laos",
         "Lebanon","Malaysia","Maldives","Mongolia","Myanmar","Nepal","North Korea","Oman","Pakistan","Palestine","Philippines",
         "Qatar","Russia","Saudi Arabia","Singapore","South Korea","Sri Lanka","Syria","Taiwan","Tajikistan","Thailand",
         "Timor-Leste","Turkey","Turkmenistan","United Arab Emirates","Uzbekistan","Vietnam","Yemen") then 'Asia'

      when Country in ("Antigua and Barbuda","Bahamas","Barbados","Belize","Canada","Costa Rica","Cuba","Dominica",
          "Dominican Republic","El Salvador","Grenada","Guatemala","Haiti","Honduras","Jamaica","Mexico",
         "Nicaragua","Panama","Saint Vincent and the Grenadines","United States") then 'North_America'

      when Country in ("Argentina","Bolivia","Brazil","Chile","Colombia","Ecuador","Guyana","Paraguay","Peru","Suriname",
         "Uruguay","Venezuela") then 'South_America'

      when Country in ("Australia","Fiji","Kiribati","Marshall Islands","Micronesia","Nauru","New Zealand","Palau",
          "Papua New Guinea","Samoa","Solomon Islands","Tonga","Tuvalu","Vanuatu") then 'Australia_and_Oceania '
 	end as continents,

   sum(subscribers) as total_subs,
   sum(uploads) as total_uploads,
   sum(`video views`) as total_views,
   round(sum(highest_yearly_earnings),0) as total_earnings,
   count(Youtuber) as num_of_youtubers

 FROM youtube_statistics
 Group by continents
 Order by total_earnings desc;

 -- Question Number 2  (Number of you tubers in each continents)

 SELECT
  case
      when Country in ("Algeria","Angola","Benin","Botswana","Burkina Faso","Burundi","Cabo Verde","Cameroon","Central African Republic",
           "Chad","Comoros","Congo, Dem. Rep", "Congo, Rep.","Cote d'Ivoire","Djibouti","Egypt","Equatorial Guinea","Eritrea",
           "Eswatini (formerly Swaziland)","Ethiopia","Gabon","Gambia","Ghana","Guinea","Guinea-Bissau","Kenya", "Lesotho",
           "Liberia",'Libya',"Madagascar","Malawi","Mali","Mauritania","Mauritius","Morocco","Mozambique","Namibia",
           "Niger","Nigeria","Rwanda","Sao Tome and Principe","Senegal","Seychelles","Sierra Leone","Somalia","South Africa",
           "South Sudan","Sudan","Tanzania""Togo","Tunisia","Uganda","Zambia","Zimbabwe") then 'Africa'

      when Country in ("Albania","Andorra", "Armenia","Austria","Azerbaijan","Belarus","Belgium","Bosnia and Herzegovina",
           "Bulgaria","Croatia","Cyprus","Czechia","Denmark","Estonia","Finland","France","Georgia","Germany",
           "Greece","Hungary","Iceland","Ireland","Italy","Kazakhstan","Kosovo","Latvia","Liechtenstein","Lithuania",
           "Luxembourg","Malta","Moldova","Monaco","Montenegro","Netherlands","Macedonia, FYR","Norway","Poland","Portugal",
           "Romania","Russia","San Marino","Serbia","Slovakia","Slovenia","Spain","Sweden","Switzerland","Turkey",
          "Ukraine","United Kingdom","Vatican City") then 'Europe'

      when Country in ("Afghanistan","Armenia","Azerbaijan","Bahrain","Bangladesh", "Bhutan","Brunei","Cambodia","China","Cyprus",
         "Georgia","India","Indonesia","Iran","Iraq","Israel","Japan","Jordan","Kazakhstan","Kuwait","Kyrgyzstan","Laos",
         "Lebanon","Malaysia","Maldives","Mongolia","Myanmar","Nepal","North Korea","Oman","Pakistan","Palestine","Philippines",
         "Qatar","Russia","Saudi Arabia","Singapore","South Korea","Sri Lanka","Syria","Taiwan","Tajikistan","Thailand",
         "Timor-Leste","Turkey","Turkmenistan","United Arab Emirates","Uzbekistan","Vietnam","Yemen") then 'Asia'

      when Country in ("Antigua and Barbuda","Bahamas","Barbados","Belize","Canada","Costa Rica","Cuba","Dominica",
          "Dominican Republic","El Salvador","Grenada","Guatemala","Haiti","Honduras","Jamaica","Mexico",
         "Nicaragua","Panama","Saint Vincent and the Grenadines","United States") then 'North_America'

      when Country in ("Argentina","Bolivia","Brazil","Chile","Colombia","Ecuador","Guyana","Paraguay","Peru","Suriname",
          "Uruguay","Venezuela") then 'South_America'

      when Country in ("Australia","Fiji","Kiribati","Marshall Islands","Micronesia","Nauru","New Zealand","Palau",
          "Papua New Guinea","Samoa","Solomon Islands","Tonga","Tuvalu","Vanuatu") then 'Australia_and_Oceania '
 	end as continents,
     count(Youtuber) as num_of_youtubers
     from youtube_statistics
     group by continents
     order by num_of_youtubers desc;

 -- question Number 3  (Pct of pay per continent)
With pct_pay as(
SELECT
  Country,
  case
      when Country in ("Algeria","Angola","Benin","Botswana","Burkina Faso","Burundi","Cabo Verde","Cameroon","Central African Republic",
          "Chad","Comoros","Congo, Dem. Rep", "Congo, Rep.","Cote d'Ivoire","Djibouti","Egypt","Equatorial Guinea","Eritrea",
          "Eswatini (formerly Swaziland)","Ethiopia","Gabon","Gambia","Ghana","Guinea","Guinea-Bissau","Kenya", "Lesotho",
          "Liberia",'Libya',"Madagascar","Malawi","Mali","Mauritania","Mauritius","Morocco","Mozambique","Namibia",
          "Niger","Nigeria","Rwanda","Sao Tome and Principe","Senegal","Seychelles","Sierra Leone","Somalia","South Africa",
          "South Sudan","Sudan","Tanzania""Togo","Tunisia","Uganda","Zambia","Zimbabwe") then 'Africa'

     when Country in ("Albania","Andorra", "Armenia","Austria","Azerbaijan","Belarus","Belgium","Bosnia and Herzegovina",
          "Bulgaria","Croatia","Cyprus","Czechia","Denmark","Estonia","Finland","France","Georgia","Germany",
          "Greece","Hungary","Iceland","Ireland","Italy","Kazakhstan","Kosovo","Latvia","Liechtenstein","Lithuania",
          "Luxembourg","Malta","Moldova","Monaco","Montenegro","Netherlands","Macedonia, FYR","Norway","Poland","Portugal",
          "Romania","Russia","San Marino","Serbia","Slovakia","Slovenia","Spain","Sweden","Switzerland","Turkey",
          "Ukraine","United Kingdom","Vatican City") then 'Europe'

      when Country in ("Afghanistan","Armenia","Azerbaijan","Bahrain","Bangladesh", "Bhutan","Brunei","Cambodia","China","Cyprus",
        "Georgia","India","Indonesia","Iran","Iraq","Israel","Japan","Jordan","Kazakhstan","Kuwait","Kyrgyzstan","Laos",
        "Lebanon","Malaysia","Maldives","Mongolia","Myanmar","Nepal","North Korea","Oman","Pakistan","Palestine","Philippines",
        "Qatar","Russia","Saudi Arabia","Singapore","South Korea","Sri Lanka","Syria","Taiwan","Tajikistan","Thailand",
        "Timor-Leste","Turkey","Turkmenistan","United Arab Emirates","Uzbekistan","Vietnam","Yemen") then 'Asia'

     when Country in ("Antigua and Barbuda","Bahamas","Barbados","Belize","Canada","Costa Rica","Cuba","Dominica",
         "Dominican Republic","El Salvador","Grenada","Guatemala","Haiti","Honduras","Jamaica","Mexico",
         "Nicaragua","Panama","Saint Vincent and the Grenadines","United States") then 'North_America'

     when Country in ("Argentina","Bolivia","Brazil","Chile","Colombia","Ecuador","Guyana","Paraguay","Peru","Suriname",
                  "Uruguay","Venezuela") then 'South_America'

     when Country in ("Australia","Fiji","Kiribati","Marshall Islands","Micronesia","Nauru","New Zealand","Palau",
                   "Papua New Guinea","Samoa","Solomon Islands","Tonga","Tuvalu","Vanuatu") then 'Australia_and_Oceania'
 	end as continents,

    round(sum(highest_yearly_earnings),0) as total_earnings

FROM youtube_statistics
Group by 1
Order by 2 desc
)

Select
sum(total_earnings) as Total_earnings,
round(1.0 * (sum(case when continents = "Africa" then total_earnings else 0 end)/ nullif(sum(total_earnings),0))*100,2) as pct_earnings_Africa,
round(1.0 * (sum(case when continents = "Europe" then total_earnings else 0 end) / nullif(sum(total_earnings),0))*100,2) as pct_earnings_Europe,
round(1.0 * (sum(case when continents = "Asia" then total_earnings else 0 end) / nullif(sum(total_earnings),0))*100,2) as pct_earnings_Asia,
round(1.0 *(sum(case when continents = "North_America" then total_earnings else 0 end) / nullif(sum(total_earnings),0))*100,2) as pct_earnings_North_America,
round(1.0 *(sum(case when continents = "South_America" then total_earnings else 0 end) / nullif(sum(total_earnings),0))*100,2)as pct_earnings_South_America,
round(1.0 *(sum(case when continents = "Australia_and_Oceania" then total_earnings else 0 end) / nullif(sum(total_earnings),0))*100,2) as pct_earnings_Australia_and_Oceania
    
from pct_pay
; 

 -- question Number 4  (Top 8 Countries, pct pay)

with country_pct as 
(
Select
Country,
round(sum(highest_yearly_earnings),0) as total_earnings
From youtube_statistics
Group by Country
Order by total_earnings desc

)

select 
sum(total_earnings) as Total_earnings,
round(1.0 * (sum(case when Country = "United States" then total_earnings else 0 end) / nullif(sum(total_earnings),0))*100,2) as pct_United_States,
round(1.0 * (sum(case when Country = "India" then total_earnings else 0 end) / nullif(sum(total_earnings),0))*100,2) as pct_India,
round(1.0 * (sum(case when Country = "Brazil" then total_earnings else 0 end) / nullif(sum(total_earnings),0))*100,2) as pct_Brazil,
round(1.0 * (sum(case when Country = "South Korea" then total_earnings else 0 end) / nullif(sum(total_earnings),0))*100,2) as pct_South_Korea,
round(1.0 * (sum(case when Country = "United Kingdom" then total_earnings else 0 end) / nullif(sum(total_earnings),0))*100,2) as pct_United_Kingdom,
round(1.0 * (sum(case when Country = "Pakistan" then total_earnings else 0 end) / nullif(sum(total_earnings),0))*100,2) as pct_Pakistan,
round(1.0 * (sum(case when Country = "Argentina" then total_earnings else 0 end) / nullif(sum(total_earnings),0))*100,2) as pct_Argentina,
round(1.0 * (sum(case when Country = "Russia" then total_earnings else 0 end) / nullif(sum(total_earnings),0))*100,2) as pct_Russia
from country_pct;

 -- question Number 5  (Top 8 Channel types, count views)
select 
channel_type,
sum(`video views`) as Total_views
from youtube_statistics
group by channel_type
order by Total_views desc
limit 8;

-- question Number 6  (Most oldest 8 channels)
select
Youtuber,
concat(created_year, '-' , created_month, '-' , created_date) as Created_date
from youtube_statistics
order by created_year,CASE created_month
    WHEN 'Jan' THEN 1
    WHEN 'Feb' THEN 2
    WHEN 'Mar' THEN 3
    WHEN 'Apr' THEN 4
    WHEN 'May' THEN 5
    WHEN 'Jun' THEN 6
    WHEN 'Jul' THEN 7
    WHEN 'Aug' THEN 8
    WHEN 'Sep' THEN 9
    WHEN 'Oct' THEN 10
    WHEN 'Nov' THEN 11
    WHEN 'Dec' THEN 12
  END,created_date
limit 8 ;

-- question Number 7  (Highest Earnings 8 channels)
select 
Youtuber,
highest_yearly_earnings
from youtube_statistics
order by highest_yearly_earnings desc
limit 8;

-- question Number 8  (Subscribers , video uploads, video views vs youtubers)
select
Youtuber,
subscribers,
`video views`,
uploads as video_uploads
from youtube_statistics
order by subscribers
limit 8;

-- question 9 ( Relationship Between "subscribers" and "video views" )
with subs as (select
Youtuber,
subscribers,
`video views`,
uploads as video_uploads
from youtube_statistics
order by subscribers
)

select 
subscribers,
`video views` 
from subs;







