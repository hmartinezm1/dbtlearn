select *
from {{ref('fct_reviews')}} f
where exists(
              select 1
              from {{ref('dim_listings_cleansed')}} d
              where f.LISTING_ID = d.LISTING_ID
                and d.CREATED_AT
                  > f.REVIEW_DATE
          )
limit 1