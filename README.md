# Puchumaldito

Puchumaldito is a Ruby on Rails application using **Rails 4.2.1** and **Ruby 2.2.1**, previously deployed on **Heroku**.

## Prerequisites

Ensure you have the following installed:

- **Ruby 2.2.1**  
  ```bash
  ruby -v
  ```
  Install using [RVM](https://rvm.io/) or [rbenv](https://github.com/rbenv/rbenv).  

- **Rails 4.2.1**  
  ```bash
  rails -v
  ```
  Install using:  
  ```bash
  gem install rails -v 4.2.1
  ```

- **Bundler**  
  ```bash
  gem install bundler -v 1.17.3
  ```

- **PostgreSQL** (Required for Heroku compatibility)  
  ```bash
  psql --version
  ```

## Installation

1. **Clone the repository**  
   ```bash
   git clone <repository_url>
   cd puchumaldito
   ```

2. **Install dependencies**  
   ```bash
   bundle install
   ```

3. **Configure the database**  
   Edit `config/database.yml` and ensure PostgreSQL is configured correctly.  

4. **Set up the database**  
   ```bash
   rake db:create db:migrate db:seed
   ```

## Running Locally

Start the Rails server:  
```bash
rails server -b 0.0.0.0 -p 3000
```
Visit `http://localhost:3000` in your browser.  

## Deploying to Heroku

1. **Login to Heroku**  
   ```bash
   heroku login
   ```

2. **Create a Heroku app** (if not already created)  
   ```bash
   heroku create puchumaldito
   ```

3. **Set the buildpack for Ruby**  
   ```bash
   heroku buildpacks:set heroku/ruby
   ```

4. **Deploy the app**  
   ```bash
   git push heroku main
   ```

5. **Run database migrations on Heroku**  
   ```bash
   heroku run rake db:migrate
   ```

6. **Open the app in a browser**  
   ```bash
   heroku open
   ```

## Troubleshooting

- **If Bundler fails due to old dependencies:**  
  ```bash
  bundle update
  ```

- **If PostgreSQL connection fails:**  
  Ensure the Heroku database is set up correctly:  
  ```bash
  heroku addons:create heroku-postgresql:hobby-dev
  ```

---

Let me know if you need further refinements! 🚀

