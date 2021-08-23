STEP1 : (Manual)

a) anomaly_detection.py zipped into anomaly_detection.zip and uploaded to an S3 bucket s3m3p2.
This will be used by cloudformation json template to create lambda

b) Roles for EC2 and Lambda already created from outside and referenced in the template file (json_template folder has the ReadMe.txt file)

STEP2: (Automated)

Run the EC2_kinesis_dd_sns.json via cloudformation using below command :

aws cloudformation create-stack --stack-name myteststacktest --template-body file://EC2_kinesis_dd_sns.json --capabilities CAPABILITY_IAM


Observed that S3, EC2, DynamoDb, S3 (m03p02_raw_data_stream), Kinesis, SNS are created
Observed that EC2 has code deployment agent running

STEP3: (Manual)

Upload the s3.zip into S3 (m03p02_raw_data_stream)

STEP4: (Automated)

Created codedeploy -> Application -> Created deployment Groups -> Create deployment

Observed that EC2 has run the application
Observed that DynamoDB has populated anomoly values
Observed that SNS has sent emails

PLEASE NOTE THAT "python raw_data.py" is a long running operation so the deployment will timeout after "timeout" mentioned in the appspec.xml

s3 folder has the appspec, raw_data files. s3/scripts folder has all the shell scripts referenced by appspec.

