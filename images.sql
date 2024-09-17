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