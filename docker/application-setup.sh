#!/bin/bash
rails db:create

rails db:create RAILS_ENV=test

rails db:migrate

rails db:migrate RAILS_ENV=test