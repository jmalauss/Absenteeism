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

This data set had originally had 8335 rows and 13 columns before we began cleaning the data.
![alt text](https://raw.githubusercontent.com/jmalauss/Absenteeism/machine_learning/Changes%20to%20data%20file.png)

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

This linear model did not feature any extra preprocessing beyond the general data cleaning discussed earlier. In this model, we had denoted the tenure (or "LengthService") as the x-variable and "AbsentHours" as the y-variable. We had chosen linear regression to facilitate this analysis given both variables were continuous, and for the theoretical simplicity of a linear prediction. However, it quickly becomes apparent that this model has difficulty properly analyzing relationships that are not approximately lines, as would be expected for *linear* regression, nor does it fair well with data that is too varied. The X and Y variable werre then split into training and testing sets using the test_train_split function from the sklearn library. In our analysis, we had trained the model using the data as is and then the data after scaling it using StandardScaler (both resulting in a regression score of around 0.045%). From there, we had tried to find if there was a relationship amongst "Short-Term" employees (meaning a tenure of less than 10 years) and "long-Term" employees (meaning a tenure of at least 10 years). "Short-Term" employees had a regression score of around -660%, while "Long-Term" employees had a regression score of around -8.24%. Added all together, this means that there was no statistically significant linear relationship between tenure at this company and absent hours for employees.

### Linear Regression: Age and Absences

We did not need to preprocess the data further than creating the people table, which was discussed in a prior section.  
Feature selection/engineering: While looking at the data, we chose to make "Age" the x variable and "Absent Hours" the y variables because we wanted to know if age had any effect on absent hours. To split the data between training and testing, we used 20 percent of the data. We chose the linear regression method because age and absent hours are continuous. The limit to a linear model is that we are trying to make a vast number of instances fit into a narrow line which may be difficult. After we ran this model, we saw that the R-squared (R2)is  0.6922064772368998, which is fairly high. However, the mean squared error (MSE) is 707.9718410428652, which means the regression line is slightly off. To rectify this, we will have to remove some outliers. Afterward, I also did a regular regression line which was much more in tune with the data.

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

Tableau Dashboard Link:
[Tableau Dashboard Link](https://public.tableau.com/views/Absenteeism_Final/AbsenteeismDash?:language=en-US&:display_count=n&:origin=viz_share_link)

![Map Picture](https://github.com/jmalauss/Absenteeism/blob/main/map.png)

## Lessons Learned

Future iterations of this analysis could seek the use of:

- Polynomial regressions for more complicated datasets
- Developing these models over a longer period of time to better work out kinks
- Potentially finding and include more data of a similar nature to provide more material for the model to make predictions with

## Links

- Presentation Link:
[Google Slides Presentation](https://docs.google.com/presentation/d/1FpSnqludv_uRUOL-mWzRSvVawIkKticF0kY8_Bl397w/edit#slide=id.p "Google Slides Presentation")

- Kaggle Data Set:
[Kaggle Absenteeism Dataset](https://www.kaggle.com/datasets/HRAnalyticRepository/absenteeism-dataset "Kaggle Absenteeism Dataset") 

- Where We Found Our Dataset:
[HR Data Sets](https://www.aihr.com/blog/hr-data-sets-people-analytics/ "HR Data Sets")

- Tableau Dashboard Link:
[Tableau Dashboard Link](https://public.tableau.com/views/Absenteeism_Final/AbsenteeismDash?:language=en-US&:display_count=n&:origin=viz_share_link)
