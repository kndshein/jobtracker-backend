# Job Tracker (API)
Job Tracker is a REST API built using Ruby on Rails and PostgreSQL.   
## Getting Your Development Environment Started
Job Tracker's API uses a docker container to run the development environment. Follow the instrustions below to get started:
- Step 1: If not completed already, create a Job Tracker workspace locally on your computer.
    - The workspace will provide a space to clone the client and API repos.
- Step 2: Clone the API [Repo](https://github.com/kndshein/jobtracker-backend) into your respective workspace.
- Step 3: Install Docker Desktop.
    - You can dowload Docker Desktop for [Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac), [Linux](https://hub.docker.com/search?offering=community&q=&type=edition&operating_system=linux&platform=server), [PC](https://hub.docker.com/editions/community/docker-ce-desktop-windows) by clicking on the link. 
    - For Linux users select the engine for your specific linux environment. 
- Step 4: Open Docker Desktop.
- Step 5: Open a terminal inside the Job Tracker API.
- Step 6: Run the following commands:
    - ```$ docker compose build```
        - This command will build the Job Tracker images in preparation for creating the container. 
        - It will take a few minutes to bundle install and create the image on your computer. 
    - ```$ docker compose run web rails db:migrate```
        - This command will create the  container with web server and database, if not already created, and then migrate the active record. 
        - Once completed check your Docker Desktop, there will be a docker container, titled Job Tracker with the web server and database inside. 
    - ```$ docker compose up```
        - This command will start the container. 
        - Go to localhost:3000 to see if it is running. You should see "Yay Rails is working" message.
    - ```$ docker compose down```
        - This command will stop the container. 
- Your dev environment is setup. To start and stop the contianer during coidng session, run the ```$ docker compose up``` to start or ```$ docker compose down``` to stop.

#### Links

- Frontend - [Repo](https://github.com/kndshein/jobtracker-frontend) // [Deployed](https://jobtracker-frontend.netlify.app)
- API - [Repo](https://github.com/kndshein/jobtracker-backend) // Deployed

## Helpful Links

- [Rails master key and credentials](https://medium.com/cedarcode/rails-5-2-credentials-9b3324851336#:~:text=The%20RAILS_MASTER_KEY%20is%20the%20key,into%20your%20source%20control%20tool)
