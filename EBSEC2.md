# Introduction
Amazon Elastic Block Store (EBS) volumes provide block-level storage that can be attached to Amazon Elastic Compute Cloud (EC2) instances. This guide explains how to attach multiple EBS volumes to a single EC2 instance using the AWS Management Console. 
Attaching multiple volumes is useful when you require additional storage capacity for your EC2 instance or when you want to separate data for different purposes.

![EBS-EC22](https://github.com/vivek2431/AWS-tasks/assets/137812531/17f39f13-6c20-4cfb-9002-cb5d59836f8a)


# Prerequisites
- AWS Account: You must have an AWS account with the necessary permissions to create and manage EBS volumes and EC2 instances.
- Availability Zone: The EBS volumes and the EC2 instance must be in the same AWS Availability Zone.
- EC2 Instance: You should have an existing EC2 instance running that you want to attach the EBS volumes to. Ensure that the instance is in a running state.
- EBS Volumes: Create the EBS volumes you intend to attach. Make note of their volume IDs.
- Putty: For terminal emulator.

# Steps
- Create an EC2 instance: ec2demo
- click amazon linux os
- Instance type: t2.micro with a availability zone: us-east-1c
- proceed with keypair and keep everything at default

  ![Screenshot (119)](https://github.com/vivek2431/AWS-tasks/assets/137812531/11281a91-3fca-43ed-ad0f-d2044aadbde7)

- An EBS volume is automatically created with the instance: demo1

    ![Screenshot (120)](https://github.com/vivek2431/AWS-tasks/assets/137812531/825ccf90-8461-4fa9-8623-6788497c4848)

- Create a new volume: demo2
- Volume Type: General Purpose SSD(gp2)
- Size: 5GB 
- Choose the same availability zone: us-east-1c

    ![Screenshot (122)](https://github.com/vivek2431/AWS-tasks/assets/137812531/bde02526-52bd-4743-b40e-2a7a95b89b0e)

    ![Screenshot (126)](https://github.com/vivek2431/AWS-tasks/assets/137812531/dba49f4a-0227-4849-b892-8c668aa4aea5)

  
 - Attach Additional EBS Volumes
 - Click the "Actions" button at the top, hover over "Instance Settings," and select "Add/Remove Volumes."

   ![Screenshot (127)](https://github.com/vivek2431/AWS-tasks/assets/137812531/8456cce0-7295-4e58-be1e-61d601eb0aba)

   ![Screenshot (128)](https://github.com/vivek2431/AWS-tasks/assets/137812531/f74abf9f-958d-47cc-8acf-532b4659f9fb)

- Copy your ec2demo instance public ip.
- open putty and paste your public ip in the Host Name(or IP address) section
- Click on SSH, Go to Authentication and click the Credential
- In the Credential browse your keypair and select it, Then click Open.
- Then Select Accept option

  ![Screenshot (130)](https://github.com/vivek2431/AWS-tasks/assets/137812531/a0688b3d-a06e-43d6-893c-80d0b6808299)

  ![Screenshot (131)](https://github.com/vivek2431/AWS-tasks/assets/137812531/7bb83ba5-772c-4c21-a441-bb71477f1d0f)

  ![Screenshot (132)](https://github.com/vivek2431/AWS-tasks/assets/137812531/2508c378-21f3-4c1f-a6cd-0880fc738a6e)

  ![Screenshot (134)](https://github.com/vivek2431/AWS-tasks/assets/137812531/ca37ec38-1af2-4551-a730-bdc0cbf3885a)

- Type: ec2-user, Run Enter
- sudo su : For root User
- lsblk: This command will list the disk you attached to your instance.

  ![Screenshot (136)](https://github.com/vivek2431/AWS-tasks/assets/137812531/187cee3b-e2b8-4cee-ac28-15abcca58c7c)
- sudo file -s /dev/xvdf: it means your volume is empty.
  ![Screenshot (144)](https://github.com/vivek2431/AWS-tasks/assets/137812531/5bd12685-ded7-4ea4-9ce9-3b69baf57127)
- sudo mkfs -t ext4 /dev/xvdf:  command is used to create a new ext4 file system on the specified block device
  ![Screenshot (145)](https://github.com/vivek2431/AWS-tasks/assets/137812531/b6912b73-0a62-4654-bf10-824b1fc07ea0)
- sudo mkdir /newvolume: To create a new directory
   ![Screenshot (152)](https://github.com/vivek2431/AWS-tasks/assets/137812531/b6cc0621-77a1-44cc-b09b-3eda45fa5324)
- sudo mount /dev/xvdf /newvolume/: To mount the volume
- cd /newvolume df -h: This command show the free space in the newvolume directory.
   ![Screenshot (151)](https://github.com/vivek2431/AWS-tasks/assets/137812531/2da029b8-0af3-4387-988c-faa04a0c7d05)
- Set Permissions: In permission root user only have full permission others with no permission.
  Decide on the appropriate permissions for the directory. The 'chmod' command is used to change permissions. Common permissions include read (4), write (2), 
  and execute (1). You can add these values to set permissions. For example, to give read and write permissions to the owner.
  ![Screenshot (157)](https://github.com/vivek2431/AWS-tasks/assets/137812531/3938962e-c4b0-4f8e-a538-b43922f85401)
  ![Screenshot (156)](https://github.com/vivek2431/AWS-tasks/assets/137812531/d49a8c07-c6a5-40db-8b9d-71d7815c09f2)
- Set Ownership: In ownership ec2-user haveing ownership
  Use the 'chown' command to set the ownership.
  ![Screenshot (158)](https://github.com/vivek2431/AWS-tasks/assets/137812531/6cb7168b-e5d4-4aa5-9030-ac46e9387800)
  ![Screenshot (159)](https://github.com/vivek2431/AWS-tasks/assets/137812531/a4f1cb6c-9a51-4a06-bf4e-3723b9077a5b)
  ![Screenshot (160)](https://github.com/vivek2431/AWS-tasks/assets/137812531/0ea53920-d65e-4044-bdaa-01d8ec39d86f)

# Importance of setting permissions and ownership for newly mounted volumes:
- Security: Properly configured permissions ensure that only authorized users or processes can access the data on the mounted volume. Without the right permissions, sensitive data can be exposed to unauthorized users or malicious actors, leading to security breaches.
- Data Integrity: Correct ownership and permissions help maintain data integrity. When files and directories have the appropriate ownership, it's easier to track changes and troubleshoot issues. Incorrect permissions can lead to data corruption or unintended modifications.
- Isolation: By setting permissions and ownership, you can isolate different users or services from each other. This is crucial in multi-user or multi-application environments where you want to prevent one user or application from inadvertently interfering with or accessing another's data.
- Compliance: Many industries and organizations have regulatory requirements that mandate proper access control and data protection. Failure to set permissions and ownership in compliance with these regulations can result in legal and financial consequences.
- Auditability: Properly configured permissions allow for better auditability. You can track who has accessed or modified data by examining the ownership and permission settings. This is valuable for troubleshooting and security investigations.






  
  


    








  
   




    


   
  
