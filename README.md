# Metronome Query Egress Project
This project includes queries and descriptions of how to produce customer data reports using the [Metronome Data Export](https://docs.metronome.com/developer-resources/export-metronome-data/).

The original sample egress data provided in available in [/sample-egress-data](/sample-egress-data/), and there is a subdirectory and corresponding file for the query tasks.

## Approach to project
- My first attempt to complete the assingnment involved writing a Python script to extract and combine the data from the csv files. However, it occurred to me that this would not accomplish the goal of demonstrating basic SQL knowledge.
- I then decided to leverage Amazon S3, AWS Glue, and Amazon Athena for storage, data discovery/extraction, and querying. I was able to successfully load the data into an S3 bucket and use Glue to identify the columns and their types, but the tables created were empty.
- I then decided to pivot to using Hex, but Hex does not appear to allow `JSON_EXTRACT()`, which I had planned to use for Task 1. At that point, I decided to just write the queries as I would have executed them. However, this meant that I could not test the output.

## Assignment

### Task 1: Images by size
Task: Write a query that calculates the total number of images that were generated for each size between March 10th and March 25th (inclusive).

Query and approach is included in [/queries/query1.md](/queries/query1.md)

### Task 2: March invoice for customer A1 Company
Task: Write a query that returns a list of all the charges (description, quantity, unit price, total) for the finalized March invoice for customer A1 Company.

Query and approach is included in [/queries/query2.md](/queries/query2.md)

### Task 3: Report of billings by plan for March 2024
Task: Write a query that contains a report of billings by plan for the month of March 2024.

I did not complete this part of the assignment.

## Challenges
- The primary challenge of this assignment was getting the data into a datastore in a queryable format. I spent significant time on this part of the process and eventually decided to forgo it. This meant I could not test my queries against the sample egress data.
- Another challenge was that Task 2 asks for the results to include the `unit_price` for each line item in the invoice generated. However, `unit_price` does not appear in any of the sample egress datasets provided, despite being listed as a column in the [`line_item` schema](https://docs.metronome.com/developer-resources/export-metronome-data/#line_item).
- I received feedback from the Metronome team that the assignment is intentionally vague/open to interpretation. It would be helpful to have this stated in the instructions. In my case, I had originally started using Python to parse/extract the data, but this does not involve writing any SQL, the stated goal of the assignment. I then pivoted to loading the data into a database so I could execute SQL queries against it, which is a more complex process than writing simple SQL queries. Because the instructions state that the purpose is to demonstrate fundamental understanding of SQL and relational databases, I became worried that I was overcomplicating the assignment.