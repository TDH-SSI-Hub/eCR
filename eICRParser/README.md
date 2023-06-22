# Tennessee eICR Parser

## Description
These programs create relational tables in a database using the SQL code and populate those tables with data from eICR records stored a CDA compliant XML. The parser program uses Python and SAX parsing to extract information from the XML.

Some of the biggest challenges faced include differences in the XML between electronic health record providers and health care organizations.

## Table of Contents
### 1. [eICRMissingDataDashGrabber.py](python/eICRMissingDataDashGrabber.py)
This file is for daily grabbing of the previous day's data.

### 2. [eICRMissingDataDashGrabberBackfiller2.py](python/eICRMissingDataDashGrabberBackfiller.py)
This file is for backfilling data and dates need to be manually supplied.

### 3. [TableCreation.sql](SQL/TableCreation.sql)
This file creates the tables where the parser data is stored.

## Running the program
### Required software -
1. Python with the following packages
  1. xml.sax
  2. sys
  3. pyodbc
  4. os
  5. re
  6. pandas
  7. numpy
  8. zipfile
  9. datetime
  10. time
  11. [usefulFunctions](python/usefulFunctions)
2. SQL software and database with table creation permissions

### Steps
1. Fork the project
2. Create tables in the database of choice, by running the [SQL code](SQL/TableCreation.sql) in your SQL software connected to the database where you want to create the tables.
3. Open the Python script [eICRMissingDataGrabber.py](python/eICRMissingDataGrabber.py) and change the following lines to point to the correct locations
  * 1381, 1382, 1383 - point these to your database
  * 1385, 1387 - point these to a location where you have zipped files stored if you have zip files
  * 1409-1470 - Remove or comment these out if you don't have a folder with zipped eICR messages
  * 1477-1546 - Remove or comment these out if you don't have or don't want to use an NBS staging database for parsing
  * 1550-1614 - Remove or comment these out if you don't have or don't want to use an NBS production database for parsing
  * 1624 - Change for the database location where you will be putting the parsed data
4. Run the program and trouble shoot as required
5. If using the [backfilling script](python/eICRMissingDataGrabberBackfiller.py) update the corresponding 




