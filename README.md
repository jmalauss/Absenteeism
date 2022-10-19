## Topic: Absenteeism
Attendance (Absenteeism): 
- What factors influence Absenteeism? 
- What trends exist within attendance?

## Why Absenteeism?
Our group gravitated towards this because we all wanted to focus on employment data. The idea of exploring relationships within data related to the workplace was relevant for all of us! Absenteeism seemed like a great place to begin because there are many factors that contribute to an individual's attendance at work.

## Where did we get our data?
Our data came from: 
https://www.kaggle.com/datasets/HRAnalyticRepository/absenteeism-dataset

We found our inspiration for this dataset from this source:
https://www.aihr.com/blog/hr-data-sets-people-analytics/

After looking through the available datasets on the AIHR site, we chose to use the dataset we did because there were two available datasets for absenteeism. The one we didn't use only had 740 rows and 21 columns. Our current dataset has 8335 rows and 13 columns. We made this decision because we wanted more raw data to work with, to increase the amount of analyses we could potentially perform.

## What are we looking for?
Generally, we would like to understand factors that influence absenteeism. We began by splitting our raw data into two tables: One table contains people data (EX: Tenure), while the other table contains job data (EX: department). This transformation of our raw data will allow us to categorize our findings in a way that is intuitive given what we understand about the workplace. In other words, is there a relationship between gender and absenteeism? Or, is absenteeism related to the department an individual works in? Are some departments more demanding than others? These are some of the questions we will ask of our dataset.

## Columns
Data includes
Employee number
Surname
GivenName
Gender
City
JobTitle
DepartmentName
StoreLocation
Division
Age
LengthService
AbsentHours
BusinessUnit

## Communication protocols:
- slack group for 24/7 communication
- using class time to delegate work and share barriers/help each other work through issues

## Group Approach
1. clean the data through EDA with pandas
2. cleaned data to pgadmin
3. join/combine tables in pgadmin
4. export back to notebook - what story do we want to tell?
5. develop unsupervised ML model in the notebook
6. develop visualizations - they can be in the notebook or JS/tableau

## Branches:
- ETL branch
- database branch: pgadmin files; .sql files; module 7 for reference
- machine learning model branch
- visualization branch



