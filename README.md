
# Project Title

DUMBO

Welcome to the Dumbo app. An online market for users to sell and purchase rare clothing both new and used.

Getting Started

First fork and clone the latest version from Github. The latest commit should read "Dumbo Completed".

Dumbo collaborates and selects new items from today's trendiest brands in high fashion. Therefore, each item is seeded in the "seeds.rb" file located in db/migrate. Clothing items will be stored in the table created from "002_create_items.rb".

Users also have the ability to contribute to the items table database. User info is stored in "001_create_users.rb". However, their items they wish to sell will go directly into the items table.

When a user makes a purchase of a used item (an item a different user is selling) their receipt of the transaction is stored in the "003_create_marketplace_transactions" table. If a user has made a purchase from an item directly from the Dumbo selection of new items their transaction is stored in "004_create_store_transactions.rb".

Dumbo allows users to narrow down their search for clothes. These methods can be found in the "app/model/item.rb". There are 3 levels of criteria: new or used, style, and category. Styles include formal, street wear, and vintage. Category is split into tops, bottoms, and shoes.

User interaction methods (purchase used items, purchase new items, sell items) are stored in "app/model/user.rb".
 

## Installing

run 'bundle install' in your terminal to install the gem files.
run 'ruby bin/run.rb' to start the application.
If you wish to check the back end data, please run 'rake console'.

## Gem files
source "https://rubygems.org"

gem "sinatra-activerecord"
gem "sqlite3"
gem "pry"
gem "require_all"
gem "colorize"
gem "rake"
gem 'catpix'

## Contributing

Please read [CONTRIBUTING.md](https://github.com/yanganna68/module-one-final-project-guidelines-web-010818) for details on our code of conduct, and the process for submitting pull requests to us.

## Authors

**Fara Obatusin**  - (https://github.com/nisutabo)
**Osama Miro** - (https://github.com/miroosama)
**Anna Yang** - (https://github.com/yanganna68)
