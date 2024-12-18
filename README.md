# Employee Survey System

This system allows importing CSV files containing employee data and survey responses. The application processes the data and provides meaningful insights.

---

## Table of Contents

1. [Requirements](#requirements)
2. [Setup](#setup)
   - [Clone the Repository](#clone-the-repository)
   - [Install Dependencies](#install-dependencies)
   - [Database Setup](#database-setup)
3. [Running the Project](#running-the-project)
4. [Setting up the Database for Tests](#setting-up-the-database-for-tests)
5. [Entity-Relationship Diagram](#entity-relationship-diagram)

---

## Requirements

- Ruby 3.3.5
- Rails 7.2.2.1
- PostgreSQL 14
- Bundler 2.5.18

---

## Setup

### Clone the Repository

```bash
# Clone the project
$ git clone https://github.com/LeeandroMachado/pin-people-challenge

# Navigate to the project directory
$ cd pin-people-challenge
```

### Install Dependencies

```bash
# Install Ruby gems
$ bundle install
```

### Database Setup

1. Configure your database credentials in `config/database.yml`. Ensure the configuration is appropriate for your environment.

2. Run the following commands to set up the database:

```bash
# Create the database
$ rails db:create

# Run migrations
$ rails db:migrate
```

---

## Running the Project

Start the Rails server:

```bash
$ rails server
```

The application will be accessible at [http://localhost:3000](http://localhost:3000).

---

## Setting up the Database for Tests

The test environment requires a dedicated database configuration. Follow these steps to set it up:

1. Ensure the `test` database is configured in `config/database.yml`.

2. Prepare the database:

```bash
# Create the test database
$ rails db:create RAILS_ENV=test

# Run migrations
$ rails db:migrate RAILS_ENV=test
```

3. Run the test suite to verify the setup:

```bash
$ bundle exec rspec   # If using RSpec
```

---

## POSTMAN API

Endpoint are available [here](https://github.com/LeeandroMachado/pin-people-challenge/blob/main/public/er-diagram.png).

---

## Entity-Relationship Diagram

The ER Diagram for the system is available [here](https://github.com/LeeandroMachado/pin-people-challenge/blob/main/public/er-diagram.png).

This diagram provides a visual representation of the relationships between tables such as `employees` and `survey_responses`.
