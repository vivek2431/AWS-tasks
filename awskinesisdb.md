# Amazon Kinesis Data Firehose delivery stream be configured to transmit real-time analytics data to an Amazon DynamoDB table
## Introduction
In today's data-driven world, businesses increasingly rely on real-time analytics to gain valuable insights and make informed decisions. Amazon Web Services (AWS) provides powerful tools to enable this, including Amazon Kinesis Data Firehose and Amazon DynamoDB. This research report outlines the process of configuring Amazon Kinesis Data Firehose to transmit real-time analytics data to an Amazon DynamoDB table.

## Amazon Kinesis Data Firehose
Amazon Kinesis Data Firehose is a crucial service in AWS that simplifies the ingestion, transformation, and loading of streaming data. It collects data from various sources, including IoT devices, application logs, and clickstreams, and efficiently captures and forwards it for further processing. Firehose's standout feature is data transformation, allowing users to apply real-time transformations to incoming data, such as format conversion, compression, and encryption, optimizing it for downstream analytics and storage.

The service integrates with various AWS services, such as Amazon S3, Redshift, Elasticsearch, and OpenSearch, allowing users to route data to the most suitable AWS resource for their specific use cases. It also offers automatic scaling, adjusting its processing capacity to accommodate fluctuations in data volume, eliminating the need for manual intervention.

Furthermore, Firehose supports data compression and encryption, enhancing security and cost management. Its integration with AWS Glue simplifies data cataloging, making it easier to discover and query data.

Amazon Kinesis Data Firehose is an indispensable tool for businesses seeking to harness the power of streaming data, enabling them to build robust real-time data pipelines for various applications, from log analytics to data warehousing.
![WhatsApp Image 2023-09-27 at 12 07 43](https://github.com/vivek2431/AWS-tasks/assets/137812531/9cc283d2-35dd-4c08-94df-5e9413564dd9)


# Steps to Create AWS Kinesis Data Firehose
- Create a S3 Bucket (i.e. same region as the Kinesis data stream).
  
  ![Screenshot (170)](https://github.com/vivek2431/AWS-tasks/assets/137812531/23f79701-77ac-4037-bc89-29effa3b44d4)
  
- Goto Amazon Kinesis Dashboard --> Select Kinesis Data Firehose --> Create delivery stream

   ![2](https://github.com/vivek2431/AWS-tasks/assets/137812531/44216f35-ffec-4e5b-8834-164a976f06d0)
  
- Under Choose source and destination,
- Source: Choose Direct PUT
- Destination: Choose Amazon S3
- Delivery stream name, give a name of your choice.
- select the S3 Bucket you created earlier,
-  S3 bucket prefix: give-name/
-  S3 bucket error output prefix: give-name/
    
   ![3](https://github.com/vivek2431/AWS-tasks/assets/137812531/c97f653c-fa2e-415d-b5cb-de10975cb5e8)
  
   ![4](https://github.com/vivek2431/AWS-tasks/assets/137812531/7f8200c0-86c3-4952-8504-d319d4e2cbec)
  
   ![5](https://github.com/vivek2431/AWS-tasks/assets/137812531/ee33f917-d41c-4fd8-8808-703310d00cd8)

# Testing Firehose
- Expand the Test with demo data --> Start sending demo data.
  
  ![269194775-b421f6c6-744e-4aa4-a762-e9ef4bd8cc4e](https://github.com/vivek2431/AWS-tasks/assets/137812531/9b1f9b9f-06c9-4bf3-9380-aeeb18f7d72c)
  
 - Now open your bucket and verify the data

   ![6](https://github.com/vivek2431/AWS-tasks/assets/137812531/9b5c27e4-23eb-4e90-90ec-978b84e570b5)

# AWS Dynamodb
Amazon DynamoDB is a fully managed NoSQL database service offered by Amazon Web Services (AWS), designed for flexibility, scalability, and high availability across various applications. It is serverless, allowing users to focus on application development without managing the underlying infrastructure. DynamoDB accommodates diverse data models without requiring a fixed schema, automatically scales to meet varying workloads, and offers high availability by replicating data across multiple Availability Zones within an AWS region. It prioritizes security with encryption features and fine-grained access control through AWS IAM. DynamoDB supports global tables for global access and disaster recovery, and enables event-driven programming with DynamoDB Streams for real-time data capture and response. It integrates smoothly with AWS services like Lambda, S3, and AppSync, and supports a wide range of data types.

# Configure table in Dynamodb
- DynamoDB Dashboard --> Create table
- Table name: give a name of your choice.
- Partition key: give a name and type related to your table
- Create Table
- Explore table items --> Create item
- Enter table data if you want to add an Attribute name
- click Add a new attribute
- Select Type enter details
  
 ![7](https://github.com/vivek2431/AWS-tasks/assets/137812531/3352f2e2-ff09-4f59-9afd-f6a4f8bb5510)

 ![44](https://github.com/vivek2431/AWS-tasks/assets/137812531/1e34c2cb-ff64-446b-8871-2c9dd9be26f4)

 ![14](https://github.com/vivek2431/AWS-tasks/assets/137812531/266a3950-b06b-4fbc-a18b-db06bbaae4a6)

  ![8](https://github.com/vivek2431/AWS-tasks/assets/137812531/3f3ba804-0cfc-4347-a2a8-931b1ed62525)

 ![9](https://github.com/vivek2431/AWS-tasks/assets/137812531/ce115030-39e8-4a04-a433-470ac42fc166)

 ![13](https://github.com/vivek2431/AWS-tasks/assets/137812531/293af8f7-b269-46e0-9ac3-e3e3cd62df53)








