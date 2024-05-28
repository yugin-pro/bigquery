  select
    user_pseudo_id uid, device.category device, geo.country country,
    event_timestamp,
    event_date,
    traffic_source.medium,
    platform,
    (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'page_location')  event_page,
    case
      when event_name = 'view_item' then 1 -- product view step
      when event_name = 'add_to_cart' then 2 -- add to cart step
      when event_name = 'purchase' then 3 -- purchase step
      else 0
    end as step_order
  from
    `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  where _table_suffix between '20210131' and '20210131' 
  and  event_name in ('page_view','view_item', 'add_to_cart', 'purchase') 