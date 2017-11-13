To clone and run this application properly:-

1. Pleae make sure you have the below ruby and rails version
    Ruby version : ruby 2.4.2p198 (2017-09-14 revision 59899) [x86_64-linux]
    
    OR if you already have RVM create a gemset(rvm gemset create color_palette) using the above mentioned ruby version.

2. I have used MySql as database. So make sure its installed. Otherwise change database.yml as per your 
   database selection after getting the app from github.

3. Clone & cd to application
	a) git clone https://github.com/ArunVerma/ColorPalette.git OR download the zip version

	b) cd ColorPalette

4. run bundle install - will install all the gems needed

5. rails db:create

6. rails db:migrate

7. rails db:seed

8. Now you should be good to see the app running after starting the server using command rails s

Some of the gems that I have used 

gem 'activerecord-import'
gem 'jquery-rails'
gem 'ffaker'
gem "database_cleaner"
gem "rspec-rails"
gem 'factory_girl_rails'
