1. Find `customer_id` for AI Company
```
SELECT customer_id 
FROM Customers 
WHERE name = 'A1 Company';
```

Output should be: `customer_id='9ca4743f-5c9e-46e3-a2db-1d484405d5ad'`

2. Get the invoice for AI Company for the month of March with finalized status
```
SELECT id 
FROM Invoice 
WHERE customer_id = '9ca4743f-5c9e-46e3-a2db-1d484405d5ad'
  AND end_timestamp = '2024-03-01 0:00:00'
  AND status = 'finalized';

```

Output should be `id =  'f3094297-6789-48bc-b0e3-eb344d1fef00'`

3. Use `id` from Invoice to get the line item id from the LineItem table
```
SELECT id
FROM LineItem
WHERE invoice_id = 'f3094297-6789-48bc-b0e3-eb344d1fef00';
```

Output should be `id = 'b733bf37-a38f-41f7-85a3-e33d86103a70', '69b65346-7a9e-479f-a9b2-6c6fae0f697f'`

4. Use `id` from LineItem table to get the subline item `name`, `quantity`, and `subtotal` from SubLineItem table
```
SELECT name, quantity, subtotal
FROM SubLineItem
WHERE line_item_id = 'b733bf37-a38f-41f7-85a3-e33d86103a70'
   OR line_item_id = '69b65346-7a9e-479f-a9b2-6c6fae0f697f'
ORDER BY name;
```

Output should be:
| id | line_item_id | name | quantity | subtotal | charge_id | billable_metric_id | billable_metric_name | tiers | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 28076867-3ff1-506b-92c9-8db470357a7c | b733bf37-a38f-4417-85a3-e33d86103a70 | Storage GB-Hours (us-east-1) | 6347.25 | 6347.25 | ac29f9fd-2279-4909-864d-96b31ffa40 | 53427126-db33-4db1-b2a5-ad1f-0e7000298 | Storage GB-Hours (us-east-1) | [] | 4/2/24 16:04 |
| ccc4eab5-fd1e-59cf-b313-4097002a7a2 | 69b65346-7a9e-479f-a9b2-6c6fae0f697f | CPU hours (r5.2xlarge) | 94 | 2068 | 8d7c397a-07ca-4368-9c78-6302ab2896e | b38a970-7ca8-4084-1593-dd4ca38a09b4 | CPU hours (r5.2xlarge) | [] | 4/2/24 16:04 |
| 5ef1413b-f0b3-575f-a6f3-a8fb-0ff5460 | 69b65346-7a9e-479f-a9b2-6c6fae0f697f | CPU hours (c5.8xlarge) | 32 | 57.6 | 2370c1d6-5704-45d0-8b4d-025258ece1c | b33b889-9104-47a3-8c9b-fdd8d01920c | CPU hours (c5.8xlarge) | [] | 4/2/24 16:04 |
| 22a305ad-9f2a-595f-aace-21f62be04880 | 69b65346-7a9e-479f-a9b2-6c6fae0f697f | CPU hours (r5.8xlarge) | 42 | 58.8 | 0b4e967f-2fba-4cd9-903d-02baf73fc7dc | 3575885f-5426-45a9-a1fb-99ce33ab1bb6 | CPU hours (r5.8xlarge) | [] | 4/2/24 16:04 |
| 8ad940cd-fe93-55c6-a2df-14d3f99e301f | b733bf37-a38f-4417-85a3-e33d86103a70 | Storage GB-Hours (ca-central-1) | 7575.75 | 1136.3625 | 3e42471c-8065-493e-9c12-6e17bb0099c2 | 509ec90-b09d-4c99-b6c2-06b742626d2f | Storage GB-Hours (ca-central-1) | [] | 4/2/24 16:04 |
| 6ed7df3b-9829-52cd-a9ab-df99916336e4 | 69b65346-7a9e-479f-a9b2-6c6fae0f697f | CPU hours (m5.12xlarge) | 33 | 59.4 | 8304c200-bc15-433-b84d-4012af2bb1c | cf7283c5-cfd4-45b9-9f19-46e61dbb5c | CPU hours (m5.12xlarge) | [] | 4/2/24 16:04 |
| 48a753fb-3336-5f63-91c9-609ec7e431ef | 69b65346-7a9e-479f-a9b2-6c6fae0f697f | CPU hours (c5.4xlarge) | 25 | 25 | 252466bf-5811-4678-9177-41e35dbcc7c | b089ac11-1dcc-472d-a82-19fcf33a6c6a | CPU hours (c5.4xlarge) | [] | 4/2/24 16:04 |
| 7b3adfe6-d117-5695-9803-4639e9b1bef | 69b65346-7a9e-479f-a9b2-6c6fae0f697f | CPU hours (m5.16xlarge) | 68 | 238 | 7f88d537-aa42-4aca-ae99-793ab87d2819 | 624e835-5d70-4f01-a9e6-61cdd96fd549 | CPU hours (m5.16xlarge) | [] | 4/2/24 16:04 |
| a745cf19-c70a-5ce8-ae71-df5d386a71cb | b733bf37-a38f-4417-85a3-e33d86103a70 | Storage GB-Hours (us-east-2) | 18430 | 2027.3 | 101ac02c-86b0-4462-97f-9927bd4a14c | 6cbb610b-ffe0-451-90e8-573b9344d0a8 | Storage GB-Hours (us-east-2) | [] | 4/2/24 16:04 |
| 2f48aeeb-a747-557e-be94-38679527c4f | 69b65346-7a9e-479f-a9b2-6c6fae0f697f | CPU hours (m5.4xlarge) | 42 | 92.4 | 609998ae-f5b0-460f-9a7a-410b7356c87 | 256fa5bb-c9d3-4397-a883-9784d011100 | CPU hours (m5.4xlarge) | [] | 4/2/24 16:04 |


_Note: The instructions asked to include `unit_price` in the output. However, `unit_price` was not available in the provided `sub_line_item.csv` file (nor in any of the sample egress datasets provided), despite being listed as a column in the [`line_item` schema](https://docs.metronome.com/developer-resources/export-metronome-data/#line_item)._