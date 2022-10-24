# currencyconverter_clean_arch

A clean architecture currency converter Flutter project.

## Getting Started

A- This project is a build in clean architecture pattern (data -domain- presentation layers)
for each feature started from domain layer specifically entity like Currency then use cases then repository and bloc and finish with data source and UI .


B- Used Singleton Design Pattern with local Database to let one database connection over application (project)

C- /// Not Used image loader but it use for caching network image for facilitate future usage.


D- Use Sqflite Database to store data locally (Caching) with structured format after first API request and read data from local database in future
   to facilitate get data.
