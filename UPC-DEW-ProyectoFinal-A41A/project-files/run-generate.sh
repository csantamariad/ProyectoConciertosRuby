touch output.log
echo "== Running Model: Distrito == " >> output.log
rails g resource distrito name:string >> output.log
echo "== Running Model: Distrito == " >> output.log
rails g resource concertstatus name:string >> output.log
echo "== Running Model: Distrito == " >> output.log
rails g resource score value:integer comment:string >> output.log
echo "== Running Model: Distrito == " >> output.log
rails g resource ticket user_id:integer concert_id:integer >> output.log
echo "== Running Model: Distrito == " >> output.log
rails g resource user_band user_id:integer band_id:integer >> output.log
echo "== Running Model: Distrito == " >> output.log
rails g resource usertype name:string administrator:boolean >> output.log
echo "== Running Model: Distrito == " >> output.log
rails g scaffold lounge name:string direction:string geolocation:string phone:string distrito:references>> output.log
echo "== Running Model: Distrito == " >> output.log
rails g scaffold band name:string genre:string >> output.log
echo "== Running Model: Distrito == " >> output.log
rails g scaffold user username:string email:string password:string dni:string tui:string gender:string givenname:string lastname1:string lastname2:string usertype:references >> output.log
echo "== Running Model: Distrito == " >> output.log
rails g resource booking description:string start:datetime end:datetime year:integer month:integer day:integer dayofweek:integer lounge:references>> output.log
echo "== Running Model: Distrito == " >> output.log
rails g scaffold concert name:string score:references owner:references band:references lounge:references booking:references status:references >> output.log
echo "== Running Model: Distrito == " >> output.log
rails g resource comment content:string ordinal:string author:references >> output.log



# echo "== db:migrate ====================== " >> output.log
# rake db:migrate >> output.log
echo "== Model Generated Completed == " >> output.log


# rails d scaffold user   
# rails d scaffold type_people   
# rails d scaffold locals   
# rails d scaffold groups   
# rails d resource concert   
# rails d resource group_member   
# rails d resource assistance   
# rails d resource comments


rails g resource user_type name:string isadmin:boolean
rails g scaffold user givenname:string lastname1:string lastname2:string gender:string email:string user_type:references documentnumber:string documenttype:string 
rails g scaffold group name:string genre:string biography:text picture:string 
rails g resource group_user group_id:integer user_id:integer 

rails g scaffold local name:string description:text district:string address:string geolocation:string phone:string  
rails g scaffold concert headline:string description:text datestart:datetime dateend:datetime totalscore:integer local:references group:references
rails g resource comment content:text user:references concert:references
