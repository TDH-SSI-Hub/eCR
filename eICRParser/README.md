# Tennessee eICR Parser

## Description
These programs create relational tables in a database using the SQL code and populate those tables with data from eICR records stored a CDA compliant XML. The parser program uses Python and SAX parsing to extract information from the XML.

Some of the biggest challenges faced include differences in the XML between electronic health record providers and health care organizations.

## Table of Contents
### 1. [eICRMissingDataDashGrabber.py](eICRMissingDataDashGrabber.py)
This file is for daily grabbing of the previous day's data.

### 2. [eICRMissingDataDashGrabberBackfiller2.py](eICRMissingDataDashGrabberBackfiller2.py)
This file is for backfilling data and dates need to be manually supplied.

### 3. [TableCreation.sql](tableCreation.sql)
This file creates the tables where the parser data is stored.


