# Microblog

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
## -microblog

Github:
https://github.com/BoRenChen/-microblog
Applink:
microblog.oceanabo.com


##Feature

Like
The appication allows user to like posts, User can like a post as many times as user like to show how many like the post is making user feels "LIKEING" the amount of likes in relates to user and post are stored in database for future features

Deploy Script
Referernce and modified from https://github.com/NatTuck/nu_mart/blob/master/deploy.sh
script is placed in the deployed tar in the home directory, run your script by typing "./deploy.sh /home/microblog/prod" in the server termianl under home directory of the deployed folder in my case "/home/microblog/predeploy"