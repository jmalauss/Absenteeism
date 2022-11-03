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

## Why Absenteeism?
Our group gravitated towards this because we all wanted to focus on employment data. The idea of exploring relationships within data related to the workplace was relevant for all of us! Absenteeism seemed like a great place to begin because there are many factors that contribute to an individual's attendance at work.
- What factors influence Absenteeism? 
- What trends exist within attendance?

## Questions about Absenteeism
- The question we would like to explore is whether age, gender, tenure, department, job title, or store location have any significant relationship with absent hours.

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

For the data cleaning, we used Jupyter Notebook and associated libraries to clean and reformat the data.
After loading the CSV file, we had dropped rows with null values, then we had round down the "Age" column values to better reflect how people self-report their age.
The "AbsentHours" and "LengthService" were rounded to two decimal places to make the data cleaner and keep the significant figures of these columns the same given that they're both units of time (though LengthService is presumed to be years and AbsentHours is presumed to be in Hours).
Any unneeded columns were dropped from the dataframe; namely the "Surname", "GivenName", "City", and "BusinessUnit" columns.
The "Gender" column was also encoded in this stage.

Given the columns and the type of information we have about each employee, we decided to split our dataframe into two separate tables. The primary key relating these tables is the employee ID. We have one DF for People, and one for Location. People DF shares info about the individual's characteristics while Location DF shares info about WHERE they work. Both of these DFs contain the column AbsentHours, the variable we are looking to understand. We then also added in the Latitude and Longitude into our Location Dataframe for certain visualizations by joining our dataframe with a new dataframe from a different data source.

Depending on the analysis and machine learning model, further cleaning was done.
For example, in some models employees with a LengthService of 0 (meaning they just started) were dropped, or if an employee had no absent hours they may have been dropped.
In some models, the EmployeeNumber was set as the Index to keep track of predictions or clusters.
Other models also had binned job titles to allow for more accurate analyses.

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

### Initial Unsupervised Model

For our initial model, we attempted to create an unsupervised machine learning model that would be able to predict and visualize the relationship between absent hours from work and other variables from our dataset. In our attempts to make this initial model work, we created dummy featurs for text variables to be used in K-means Clustering (with and without Principal Component Analysis) and scaled the data using StandardScaler, and then tried to normalize the data for use in dendrograms for Hierarchical Clustering. These initial attempts did not see the use of splitting the data into training and testing sets. The benefits of this model would have involved being able to quickly predict and visualize different relationships with ease, as well as allow our model to be used for other companies and locations. However, preprocessing the data for machine learning and creating the model can be very involved both in terms of time and coding proficieny. Our data was not immediately compatible with this type of machine learning, and as such would require far more massaging than would have been capable in our allotted time frame. The highest accuracy score was around 25%, which is what lead to our group's decision to create new models. To explain any potential relationships between factors in our dataset, we had decided to create smaller models that could be applied to different relationships so as to facilitate the analysis given the time frame. 

### Linear Regression: Tenure and Absences

Prepros: general
Feature selection/engineering:
How TTS?:
Why Model? Limits and Benefits:
Explain why diff models:
Explain current training, additional training:
Accuracy Score/equivalent:

This model was chosen to explore the relationship between a continuous input data column and a continuous target data column. The linear regression model would then attempt to fit itself to the data and predict the line of best fit for the data, therey illustrating the relationship between the two variables. This allows us to clearly illustrate the strength of the relationship, if any, between the variables. Unfortunately, the regression is limited to straight lines, and as such fails to capture more complex relationships between variables that could be found using a polynomial regression, for example.

### Linear Regression: Age and Absences

Prepros: general
Feature selection/engineering:
How TTS?:
Why Model? Limits and Benefits:
Explain why diff models:
Explain current training, additional training:
Accuracy Score/equivalent:

### Unsupervised Model

Prepros: general
Feature selection/engineering:
How TTS?:
Why Model? Limits and Benefits:
Explain why diff models:
Explain current training, additional training:
Accuracy Score/equivalent:

- K-Means Clustering Algorithm used to find trends amongst the following factors:
    - Age
    - Gender
    - LengthService (Tenure in Years)
    - AbsentHours (Worked hours missed)
- As we added clusters and performed the elbow curve test, we noticed that reducing a dimension would be beneficial to the model and its use.
- 2 Clusters were ideal for this analysis, but was also performed with 3 and visualized with a 2 and 3D scatter.


## Data Visualization
## Lessons Learned
## Links

- Presentation Link:
[Google Slides Presentation](https://docs.google.com/presentation/d/1FpSnqludv_uRUOL-mWzRSvVawIkKticF0kY8_Bl397w/edit#slide=id.p "Google Slides Presentation")

- Kaggle Data Set:
[Kaggle Absenteeism Dataset](https://www.kaggle.com/datasets/HRAnalyticRepository/absenteeism-dataset "Kaggle Absenteeism Dataset") 

- Where We Found Our Dataset:
[HR Data Sets](https://www.aihr.com/blog/hr-data-sets-people-analytics/ "HR Data Sets")
