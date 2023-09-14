
**Overview:**

You can leverage Amazon Data Lifecycle Manager to automate the process of creating, maintaining and removing EBS snapshots and EBS backed AMIs. Automating snapshot and AMI management offers benefits;
-	Ensuring the protection of data by enforcing a regular backup schedule.
-	Generating standardized AMIs that can be regularly refreshed.
-	Retaining backups as required by auditors or internal compliance standards.
-	Reducing storage costs, by deleting outdated backups.
-	Establishing disaster recovery backup policies that back up data to accounts.
When combined with the monitoring capabilities of Amazon CloudWatch Events and AWS CloudTrail, Amazon Data Lifecycle Manager provides a backup solution, for Amazon EC2 instances and individual EBS volumes at no cost.
![WhatsApp Image 2023-09-13 at 15 15 13](https://github.com/vivek2431/EBS-DLM/assets/137812531/88f2e8e7-49f9-453a-b15a-58585ba47be8)


**Prerequisites:**

- AWS management console navigation.
- An Amazon EC2 instance.
- AWS Elastic Block Storage (EBS).
- Knowledge of Amazon Data Lifecycle Manager.



**Steps:**

1. Launch an EC2 instance named "myec2server" with Amazon Linux and a t2.micro instance type, proceeding without a key pair.

 ![Screenshot (90)](https://github.com/vivek2431/EBS-DLM/assets/137812531/e8a6223b-4163-4ad9-92af-4bf2ae03427d)
 
 ![Screenshot (92)](https://github.com/vivek2431/EBS-DLM/assets/137812531/6e152e22-c805-423f-bd87-ae2244e60e12)
 
 ![Screenshot (108)](https://github.com/vivek2431/EBS-DLM/assets/137812531/9c6583e4-2e6d-4756-8376-2b5b9c1850f7)


 
3. After creating the EC2 instance, a volume is automatically created with it.

  ![Screenshot (94)](https://github.com/vivek2431/EBS-DLM/assets/137812531/39ad380e-816e-48e1-a41f-79f6a256d11b)


5. In the AWS Management Console, use the search bar to find "Lifecycle Manager."
   
   ![Screenshot (95)](https://github.com/vivek2431/EBS-DLM/assets/137812531/dfdc4751-5521-400a-8d9e-2d0c0e532930)
   
7. Select the "EBS Snapshot Policy" option.
   
  ![Screenshot (96)](https://github.com/vivek2431/EBS-DLM/assets/137812531/2d2c3786-dd15-4e70-a7e1-7cf04539e5d5)

9. Configure the policy:
   - Target Resource Type: Volume
   - Target Resource Tags: Name: myec2server
   - Policy Description: Lifecycle Policy
   - Policy Status: Enable
   - Keep other settings as default and click "Next."
     
    ![Screenshot (97)](https://github.com/vivek2431/EBS-DLM/assets/137812531/ed93f957-1af1-4539-adc5-291d29edcec5)
   
    ![Screenshot (98)](https://github.com/vivek2431/EBS-DLM/assets/137812531/4e63778f-e706-40dc-809d-046c9568821f)
   
    ![Screenshot (100)](https://github.com/vivek2431/EBS-DLM/assets/137812531/df3791aa-4e23-4b4c-991b-9134bab6264c)


11. Configure the schedule:
   - Schedule Name: Daily Backup
   - Frequency: Daily
   - Every: 12 hrs
   - Starting at: 9:00 UTC (2:30 ITC)
   - Count: 1 (Count can be set between 1-1000; Age is for the last 100 years.)
     
     ![Screenshot (102)](https://github.com/vivek2431/EBS-DLM/assets/137812531/20d27b6d-a175-475c-9cf4-e7af56d7b105)
     
     ![Screenshot (103)](https://github.com/vivek2431/EBS-DLM/assets/137812531/fa311854-56b4-4166-a760-1e793cb51099)

11. Review the policy settings and create the policy.
    
  ![Screenshot (104)](https://github.com/vivek2431/EBS-DLM/assets/137812531/1173e908-2c74-4586-b234-3f4cb8f9a212)
  
  ![Screenshot (105)](https://github.com/vivek2431/EBS-DLM/assets/137812531/419f3b93-ecbf-45f8-940b-9532c8a092c1)

13. Check the Lifecycle Manager.

   ![Screenshot (106)](https://github.com/vivek2431/EBS-DLM/assets/137812531/2b63276a-8d9d-4437-a2ad-cb37e6b312e0)

15. Snapshot: You have to wait for sometimes for the snapshots.
    
  ![Screenshot (109)](https://github.com/vivek2431/EBS-DLM/assets/137812531/e8c552a7-ba0f-4e86-9c84-862d3a7ceee8)
  
  ![Screenshot (110)](https://github.com/vivek2431/EBS-DLM/assets/137812531/dc9a1f37-7b62-4214-bab7-0ccc5b95232e)




Please note that this setup will create daily EBS snapshots of your EC2 instance as per the configured schedule. These snapshots can be useful for data recovery, compliance, and ensuring data durability. Be mindful of storage costs associated with EBS snapshots, and consider setting up policies to manage outdated snapshots to reduce costs further.
