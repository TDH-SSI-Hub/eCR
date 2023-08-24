"""
Title: Useful Functions
Author: Nathan Williams
Date: 30 June 2022
Last Update: 30 June 2022
Purpose: A place to keep useful functions
"""

import os
import sys
import xml.dom.minidom
    
# This function is an adaptation from https://www.geeksforgeeks.org/change-current-working-directory-with-python/
def set_wdir(wdir):
    
    cwd = os.getcwd()

    try:     
        os.chdir(wdir)
        print('Working directory change was successful')
    except:
        print("Something went wrong")
        print(sys.exc_info())
    finally:
        print(f'Your current working directory is: {os.getcwd()}')
        
def prettyXML(inFile, outFile):
    dom = xml.dom.minidom.parse(inFile)
    pretty_xml_as_string = dom.toprettyxml()
    
    with open(outFile, 'w') as f:
        f.write(pretty_xml_as_string)
    
    print(pretty_xml_as_string)