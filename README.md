## Absenteeism - Project Outline
- Team
- Why Absenteeism?
- Questions about Absenteeism
- Factors
- Datasource
- ERD - Entity Relationship Diagram
- Data Cleaning
- Database
- Machine Learning
- Data Visualization
- Lessons Learned

## Team
- Bradley
- Frederick
- Justin
- Samantha

# Why Absenteeism?
Our group gravitated towards this because we all wanted to focus on employment data. The idea of exploring relationships within data related to the workplace was relevant for all of us! Absenteeism seemed like a great place to begin because there are many factors that contribute to an individual's attendance at work.
- What factors influence Absenteeism? 
- What trends exist within attendance?

## Questions about Absenteeism
- The question we would like to explore is whether age, gender, tenure, department, job title, or store locaation have any significant relationship with absent hours.
## Factors
- Age
  We did a linear regression model to see if there is a correlation with age and got this 
https://raw.githubusercontent.com/samnougues/PyBer_Analysis/d6181c96844d1f05a818218b2a0d26e48c64baa2/PyBer_Analysis/Analysis/Fig2.png
- Gender
- Tenure
- Department
- Job Title
- Store Location

## ERD - Entity Relationship Diagram
## Data Cleaning
## Database
## Machine Learning
## Data Visualization
## Lessons Learned
## Links
- Presentation Link
https://docs.google.com/presentation/d/1FpSnqludv_uRUOL-mWzRSvVawIkKticF0kY8_Bl397w/edit#slide=id.p

## Why Absenteeism?


## Where did we get our data?
Our data came from: 
https://www.kaggle.com/datasets/HRAnalyticRepository/absenteeism-dataset

We found our inspiration for this dataset from this source:
https://www.aihr.com/blog/hr-data-sets-people-analytics/

After looking through the available datasets on the AIHR site, we chose to use the dataset we did because there were two available datasets for absenteeism. The one we didn't use only had 740 rows and 21 columns. Our current dataset has 8335 rows and 13 columns. We made this decision because we wanted more raw data to work with, to increase the amount of analyses we could potentially perform.

## What are we looking for?
- Is there a difference in absent hours between males and females? - Justin
- Is there a difference in absent hours based on age? - Samantha
  - Using a linear regression we looked at the relationship between age and absent hours
- Is there a difference in absent hours based on tenure? - Bradley
- Is there a difference in absent hours based on job title? - Frederick

## Machine Learning Models

### Linear Regression

This model was chosen to explore the relationship between a continuous input data column and a continuous target data column. The linear regression model would then attempt to fit itself to the data and predict the line of best fit for the data, therey illustrating the relationship between the two variables. This allows us to clearly illustrate the strength of the relationship, if any, between the variables. Unfortunately, the regression is limited to straight lines, and as such fails to capture more complex relationships between variables that could be found using a polynomial regression, for example.


## Columns
- Employee number
- Surname
- GivenName
- Gender
- City
- JobTitle
- DepartmentName
- StoreLocation
- Division
- Age
- LengthService
- AbsentHours
- BusinessUnit

## Group Approach
1. clean the data through EDA with pandas
2. cleaned data to pgadmin
3. join/combine tables in pgadmin
4. export back to notebook - what story do we want to tell?
5. develop unsupervised/supervised ML model in the notebook
6. develop visualizations - they can be in the notebook or JS/tableau

## Branches:
- ETL branch
- database branch: pgadmin files; .sql files; module 7 for reference
- machine learning model branch
- visualization branch

## Preliminary Data Preprocessing
- After reading in the csv, we needed to round the Age column to a whole number
- we also needed to drop some columns: `absenteeism_df.drop(["Surname", "GivenName", "BusinessUnit"], axis=1)`
- Then we rounded LengthService and AbsentHours to 2 decimal places
- Given the columns and the type of information we have about each employee, we decided to split our dataframe into two separate tables. The primary key relating these tables is the employee ID. We have one DF for People, and one for Location. People DF shares info about the individual's characteristics while Location DF shares info about WHERE they work. Both of these DFs contain the column AbsentHours, the variable we are looking to understand.


## ML Models:
- K-Means Clustering Algorithm used to find trends amongst the following factors:
    - Age
    - Gender
    - LengthService (Tenure in Years)
    - AbsentHours (Worked hours missed)
- As we added clusters and performed the elbow curve test, we noticed that reducing a dimension would be beneficial to the model and its use.
- 2 Clusters were ideal for this analysis, but was also performed with 3 and visualized with a 2 and 3D scatter.
