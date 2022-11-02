## Absenteeism - Project Outline

- [Team](https://github.com/jmalauss/Absenteeism#team "Team")
- [Why Absenteeism?](https://github.com/jmalauss/Absenteeism#why-absenteeism "Why Absenteeism?")
- [Questions about Absenteeism](https://github.com/jmalauss/Absenteeism#questions-about-absenteeism "Questions About Absenteeism")
- [Factors](https://github.com/jmalauss/Absenteeism#factors "Factors")
- [Datasource](https://github.com/jmalauss/Absenteeism#datasource "Datasource") 
- [ERD - Entity Relationship Diagram](https://github.com/jmalauss/Absenteeism#erd---entity-relationship-diagram "ERD")
- [Data Cleaning](https://github.com/jmalauss/Absenteeism#data-cleaning "Data Cleaning")
- [Database](https://github.com/jmalauss/Absenteeism#database "Database")
- [Machine Learning](https://github.com/jmalauss/Absenteeism#machine-learning "Machine Learning")
- [Data Visualization](https://github.com/jmalauss/Absenteeism#data-visualization "Data Visualization")
- [Lessons Learned](https://github.com/jmalauss/Absenteeism#lessons-learned "Lessons Learned")

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
  - We did a linear regression model to see if there is a correlation with age and got this 
![alt text](https://raw.githubusercontent.com/jmalauss/Absenteeism/machine_learning/Fig4.png)

- Gender

- Tenure
  - After performing a linear regression model on Employee Age versus Tenure (left model) and then again after scaling the data with StandardScaler.fit_transform() (right model), the following models were generated

<img src="https://github.com/jmalauss/Absenteeism/blob/machine_learning/Resources/Images/LRTenure1.png" width="400"> <img src="https://github.com/jmalauss/Absenteeism/blob/machine_learning/Resources/Images/LRTenure2.png" width="410">

  - The linear regression models generated after analyzing Employee Age versus Short-Term Tenure (left model) and with Long-Term Tenure (right model)
  
  <img src="https://github.com/jmalauss/Absenteeism/blob/machine_learning/Resources/Images/LRShortTenure.png" width="400"> <img src="https://github.com/jmalauss/Absenteeism/blob/machine_learning/Resources/Images/LRLongTenure.png" width="415">

- Department
  - Looking at a bar graph to show relationship between absent hours
  ![alt text](https://raw.githubusercontent.com/jmalauss/Absenteeism/visualization/Average%20Absent%20Hours%20Per%20Department.png)

- Job Title
  - This is a bar graph showing the relationship between job titles and absent hours
  ![alt text](https://raw.githubusercontent.com/jmalauss/Absenteeism/visualization/Average%20Absent%20Hours%20Per%20Job%20Title.png)

- Store Location

## Data Source

This data comes from [this Kaggle dataset](https://www.kaggle.com/datasets/HRAnalyticRepository/absenteeism-dataset "Absenteeism").  This is fictious data with hr information about absent hours.  Our current data source has 8335 rows and 13 columns. Within the 13 columns, there are Employee number, Surname, GivenName, Gender, City, JobTitle, DepartmentName, StoreLocation, Division, Age, LengthService, AbsentHours, and BusinessUnit.

## ERD - Entity Relationship Diagram

Below is an ERD depicting our tables and the relationships between them

<img src="https://github.com/jmalauss/Absenteeism/blob/Database-files/Resources/Images/Absenteeism_ERD.png">

## Data Cleaning
## Database
In our analysis there were multiple tables created to help us with visualizations:
Absentism and data about people
 ![alt text](https://raw.githubusercontent.com/jmalauss/Absenteeism/visualization/people.png)
 Absentism and data about Location
 ![alt text](https://raw.githubusercontent.com/jmalauss/Absenteeism/visualization/location%20table.png)
 Absentism and coordinates of cities
 ![alt text](https://raw.githubusercontent.com/jmalauss/Absenteeism/visualization/coordinates%20table.png)

 You can find all tables here: [Group Project Absenteeism.sql](https://github.com/jmalauss/Absenteeism/blob/Database-files/Group%20Project%20Absenteeism.sql "Group Project Absenteeism.sql")

## Machine Learning
## Data Visualization
## Lessons Learned
## Links

- Presentation Link:
[Google Slides Presentation](https://docs.google.com/presentation/d/1FpSnqludv_uRUOL-mWzRSvVawIkKticF0kY8_Bl397w/edit#slide=id.p "Google Slides Presentation")

## Why Absenteeism?


## Where did we get our data?
Our data came from: 
[Kaggle Absenteeism Dataset](https://www.kaggle.com/datasets/HRAnalyticRepository/absenteeism-dataset "Kaggle Absenteeism Dataset")

We found our inspiration for this dataset from this source:
[HR Data Sets](https://www.aihr.com/blog/hr-data-sets-people-analytics/ "HR Data Sets")

## What are we looking for?
- Is there a difference in absent hours between males and females? - Justin
- Is there a difference in absent hours based on age? - Samantha
  - Using a linear regression we looked at the relationship between age and absent hours
- Is there a difference in absent hours based on tenure? - Bradley
- Is there a difference in absent hours based on job title? - Frederick

## Machine Learning Models

### Linear Regression

This model was chosen to explore the relationship between a continuous input data column and a continuous target data column. The linear regression model would then attempt to fit itself to the data and predict the line of best fit for the data, therey illustrating the relationship between the two variables. This allows us to clearly illustrate the strength of the relationship, if any, between the variables. Unfortunately, the regression is limited to straight lines, and as such fails to capture more complex relationships between variables that could be found using a polynomial regression, for example.



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
