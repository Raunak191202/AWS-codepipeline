# codepipeline

AWS CodePipeline is a continuous integration and continuous delivery (CI/CD) AWS service that allows you to automate the release process for your application or service. Every time you commit a code change to your source(GitHub, AWS CodeCommit, etc), CodePipeline automatically builds, tests, and deploys your code based on the release process models you define while initializing your CodePipeline. This enables you to rapidly and reliably deliver features and updates.


![photo_6325490588325101561_y](https://github.com/user-attachments/assets/54af8d13-d263-4f36-97a5-d466ff730274)

# Steps to follow:

1. Create IAM Role for EC2 & AWS CodeDeploy
2. Launch an EC2 instance & then will attach that EC2 Role.
3. Create a CodePipeline using Github, CodeBuild and CodeDeploy

 

# Step 1) Create IAM Role for EC2 and AWS CodeDeploy

1.Create a new role for EC2 and attach AmazonS3ReadOnlyAccess policy which will allow our EC2 instance to access stored artifacts from the Amazon S3 bucket.
2.Create a new service role for CodeDeploy and attach AWSCodeDeployRole policy which will provide the permissions for our service role to read tags of our EC2 instance, publish information to Amazon SNS topics and much more task.

![Screenshot (394)](https://github.com/user-attachments/assets/da62a29b-00fa-4823-9e67-738f02e74007)

![Screenshot (395)](https://github.com/user-attachments/assets/c1f3b9d9-5259-412b-9fbe-625b927ab144)

![Screenshot (396)](https://github.com/user-attachments/assets/d89aa23b-2639-4813-b694-ed785f19e868)

# Step 2) Launch an Linux EC2 instance 

Install code depoloy agent by follwing commands on terminal.

1. sudo yum update
2. sudo yum install ruby
3. sudo yum install wget
4. wget https://aws-codedeploy-ap-south-1.s3.amazonaws.com/latest/install
5. chmod +x ./install
6. sudo ./install auto
7. sudo service codedeploy-agent status


![Screenshot (398)](https://github.com/user-attachments/assets/aceb05ad-3447-428d-ab59-65f61dee45a3)

![Screenshot (399)](https://github.com/user-attachments/assets/4f280903-9e26-4c9d-a3e2-82e9468caf0a)

# Attach that EC2 Role with it.

![Screenshot (400)](https://github.com/user-attachments/assets/71f5b92c-7519-4076-af89-c5762de81423)

# Make a Github Repository and download the source code and push on it.

![Screenshot (401)](https://github.com/user-attachments/assets/fad47f0d-d1bd-465e-af06-6616c44f1419)

![Screenshot (402)](https://github.com/user-attachments/assets/7ab6d469-25ea-4edb-a903-31d1b8004c0c)

![Screenshot (403)](https://github.com/user-attachments/assets/5d5f3747-b308-4783-8c50-d72dbc4bce9f)

![Screenshot (404)](https://github.com/user-attachments/assets/c5a312b7-b215-4189-ac54-d9f83c7fde79)

![Screenshot (405)](https://github.com/user-attachments/assets/40a0b749-d743-44e6-87fb-ee1487e1661c)

# Step 3) Create a CodePipeline using Github, CodeBuild and CodeDeploy

a) Create CodePipeline

Let’s navigate to CodePipeline via AWS Management Console and click on Create pipeline

b) Choose Github in Code Source

After selecting GitHub as the source provider, click on the Connect to GitHub button. You’ll then be prompt to enter your GitHub login credentials
Once you grant AWS CodePipeline access to your GitHub repository, you can select a repository and branch for CodePipeline to upload commits to this repository to your pipeline

c) Configure CodeBuild (Optional)

If you haven’t created a project prior to creating your pipeline,then you can create a project directly from here by clicking Create project button.

Note: Buildspec file is a collection of build commands and related settings, in YAML format, that CodeBuild uses to run a build. For my project, I created a buildspec.yaml file and added it in the root of my project directory:

 

d) Add Depoly Stage

Note : Before going to configure Add Depoly Stage, Let's make duplicate tab of current tab.
and then go to code deploy in the nevigation, Select Application, then add create a deployment group.
In deployment group Select EC2 instances and select Tag and Value
Finally Come on Add Deploy Stage and select that created Application name & Deployment group
At the end, just review and create.

# If You will Get below error in pipeline then follow further instruction to resolve it.


Error : CodeDeploy agent was not able to receive the lifecycle event. Check the CodeDeploy agent logs on your host and make sure the agent is running and can connect to the CodeDeploy server.


Conclusion: Its happening Because we installed codedeployment-agent before attaching ec2role to EC2 Instance, and error will be resolve when you will first attach ec2role and then install codedeployment-agent on EC2.



# Run the following commands.

1. sudo systemctl stop codedeploy-agent
2. sudo yum erase codedeploy-agent -y
3. sudo rm -rf /opt/codedeploy-agent
4. cd /home/ec2-user/server
5. sudo ./install auto
6. sudo systemctl status codedeploy-agent

![Screenshot (406)](https://github.com/user-attachments/assets/76ad48d1-5942-4968-9a44-e4c320ecf208)

![Screenshot (407)](https://github.com/user-attachments/assets/4eb6f38e-43ca-490f-949f-cf8471eb442d)
![Screenshot (408)](https://github.com/user-attachments/assets/7844d98e-5ff7-4297-9362-c6d879fe552a)
![Screenshot (409)](https://github.com/user-attachments/assets/06b3559c-c341-48b4-a0a9-d342767f7765)
![Screenshot (410)](https://github.com/user-attachments/assets/ff2f4bd1-c9fd-4f98-8b34-b185f1400fc2)
![Screenshot (411)](https://github.com/user-attachments/assets/b5933445-112d-4b1e-a550-10828866ec78)
![Screenshot (412)](https://github.com/user-attachments/assets/310cf643-efa3-4f03-9c0c-964764d87589)
![Screenshot (413)](https://github.com/user-attachments/assets/e56de887-3ec1-458d-a29d-0adb7a695eba)
![Screenshot (414)](https://github.com/user-attachments/assets/f2675710-fe21-42a6-9f0b-2de9d44ca98a)
![Screenshot (415)](https://github.com/user-attachments/assets/0a49cb56-5dd5-4b8a-ad92-28d35205ac50)
![Screenshot (416)](https://github.com/user-attachments/assets/25acd908-ed53-4dcb-b5de-7470c15ef9bf)
![Screenshot (417)](https://github.com/user-attachments/assets/364910ab-e099-477b-add3-4f30ef417307)

![Screenshot (418)](https://github.com/user-attachments/assets/22f059eb-1f28-4237-b281-c7de9a1d6f9a)
![Screenshot (419)](https://github.com/user-attachments/assets/2fb1b305-fc7a-47be-8af0-afc8442472fc)
![Screenshot (420)](https://github.com/user-attachments/assets/919e338b-1a4e-4e34-8755-d083ac7491aa)


# output 
![Screenshot (425)](https://github.com/user-attachments/assets/9a986b82-e2ba-40ad-a837-860959c3d072)
