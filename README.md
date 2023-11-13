# Importing-Excel-csv-in-MYSQL
Using Anaconda Prompt to import excel doc in MYSQL

Step 1 - Open Anaconda Prompt which is available with Anaconda Navigator 
Step 2 - Type ("pip install csvkit") this will install all the necessary Libraries 
Step 3 - Go to the Path in cmd prompt where the csv file is located using cd "folder name"
Step 4 - Type ("CSVSQL --dialect mysql --snifflimit 100000 order.csv > output_folder.sql")

Step 5 - Go to My computer Location = "C:\ProgramData\MySQL\MySQL Server 8.0\my.ini" open the file My.ini 
          with as administrator with Notepad++ if installed and in 168 line of code clear the Location given in "Secure prev"
          
          Now 
Step 6 - Loading Data 
          type in mysql query by opening the output folder below the create table query 
         (" load data infile 'File Location'
         into table `order`
         fields terminated by ','
         optionally enclosed by "'"
         lines Terminated by '\r\n'
         ignore 1 rows;")

Step 7 - Execute all the queries in sql 
