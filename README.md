![Logo of Abre](https://raw.githubusercontent.com/ciudadanointeligente/abre/master/public/img/logo_wiki.png)

# Abre

Abre is a project of Ciudadano Inteligente to open up local governments to their citizens. It consists of a methodology that includes raising and prioritizing proposals, designing workshops, monitoring and implementation, and evaluation of the process.

The platform is an adaptation of Consul (https://github.com/consul/consul), and allows uploading, modifying and monitoring a proposal through the different steps of the methodology.


## Tech stack

The application backend is written in the [Ruby language](https://www.ruby-lang.org/) using the [Ruby on Rails](http://rubyonrails.org/) framework.

Frontend tools used include [SCSS](http://sass-lang.com/) over [Foundation](http://foundation.zurb.com/) for the styles.

## Configuration for development and test environments

**NOTE**: For more detailed instructions check the [docs](https://github.com/consul/consul/tree/master/doc/en/dev_test_setup.md)

Prerequisites: install git, Ruby 2.3.2, bundler gem, ghostscript and PostgreSQL (>=9.4).

```
git clone https://github.com/consul/consul.git
cd consul
bundle install
cp config/database.yml.example config/database.yml
cp config/secrets.yml.example config/secrets.yml
bin/rake db:setup
bin/rake db:dev_seed
RAILS_ENV=test rake db:setup
```

Run the app locally:
```
bin/rails s

```

Prerequisites for testing: install PhantomJS >= 1.9.8

Run the tests with:

```
bin/rspec
```

You can use the default admin user from the seeds file:

 **user:** admin@consul.dev
 **pass:** 12345678

But for some actions like voting, you will need a verified user, the seeds file also includes one:

 **user:** verified@consul.dev
 **pass:** 12345678

### Customization

See [CUSTOMIZE_ES.md](CUSTOMIZE_ES.md)

### OAuth

To test authentication services with external OAuth suppliers - right now Twitter, Facebook and Google - you'll need to create an "application" in each of the supported platforms and set the *key* and *secret* provided in your *secrets.yml*

In the case of Google, verify that the APIs *Contacts API* and *Google+ API* are enabled for the application.

## License

Code published under AFFERO GPL v3 (see [LICENSE-AGPLv3.txt](LICENSE-AGPLv3.txt))

## Contributions

See [CONTRIBUTING_EN.md](CONTRIBUTING_EN.md)
