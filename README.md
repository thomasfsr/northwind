# northwind  
  
Steps with postgres in docker-compose:  
  
```bash
docker-compose build  
docker-compose up -d 
```  
  
For default the postgres create a db called postgres as a maintainance db, but you can ignore it and use the northwind db.  
  
Steps with dbt-core:  

```bash
dbt init
  
#hostname must be localhost 
```
  
host name is 'db' if the postgres database is from the docker-compose.  
  
```bash
cd northwind_dbt  
```
  
```bash
dbt debug  
```
  
If you are using harlequin:  
harlequin -a postgres -h localhost -p 5432 -U postgres --password postgres -d northwind  
