For Task 1, the data required was available in the Events table (`events.csv`). In order to obtain the relevant columns, the following filters were required:
- `event_type = 'image_modeler'` - get the events corresponding to image generation
-  `timestamp >= '2024-03-10 00:00:00'` AND `timestamp < '2024-03-26 00:00:00'` - get only the events generated within the month of March

In addition, the number of images (`num_image`) and image size (`image_size`) was stored as a JSON within the `properties` column. To read/manipulate this data, I would use the JSON_EXTRACT() function.

The query results are then grouped and ordered by `image_size` for readability.

The entire query is below.


```
SELECT 
    JSON_EXTRACT(properties, '$.image_size') AS image_size,
    SUM(CAST(JSON_EXTRACT(properties, '$.num_images') AS INTEGER)) AS total_images
FROM 
    events
WHERE 
    event_type = 'image_modeler'
    AND timestamp >= '2024-03-10 00:00:00'
    AND timestamp < '2024-03-26 00:00:00'
GROUP BY 
    JSON_EXTRACT(properties, '$.image_size')
ORDER BY 
    image_size
```