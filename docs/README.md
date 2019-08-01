# Make Testing Great Again: Powerful UI tests with Ruby, Rspec, Rake and Webdriver
![Image](images/main.png)


## Introduction
Though most of newest FrontEnd Development projects have moved to Javascript Frameworks, leaving Fullstack frameworks (e.g JSP, .Net and Ruby on Rails) in the water, still there are dozens of projects and customers out there with Rails projects, and even some of them have migrated their stacks to have API's based on Rails and FrontEnd in React, Angular or whatever poison they want to drink. 

Here is the sweetspot we want to manage here. These projects have a strong investment in Ruby code, seasoned developers polished in the arts of ruby and Testing based on those. Currently is extremely hard to find available Automators with Ruby experience and here is where this article fits in, Today we will teach you the arts of creating a Testing Project using the Ruby language and the available tools. 

This will be our agenda for this article
- Tools Installation and what do they do
- Creating the first tests, start from the ground, and go up
- Improving code with the **Page Object Model** Pattern, 
- Executing tests with **RSpec** and **Rake**, 
- Keeping all dependencies in check with **Bundler**
- **WebDrivers** and the tools in ruby for it
- and so on


## The basics:

### Ruby
Ruby is an **interpreted**, **multipurpose**, **multiparadigm**, **Object-Based**, **Hardtyped** programming language, that receives a lot of praise for the simplicity of their syntax and the powerful Rails framework

Install ruby is not hard, actually comes preinstalled in most MacOS X distributions, just in case you want to have the latest version use `RVM`

Open [rvm.io](https://rvm.io/) and follow the instructions to install the manager

Once installed, just open a terminal and run 
```bash
$ rvm install ruby
$ rvm --default use ruby
```

If you use Windows, please install [Ruby for Windows](https://rubyinstaller.org/)

### Ruby-Gems
Most of the libraries available in Ruby are packaged as gems, a gem is a library that offers a certain functionality, and you can download it and use it. This concept is similar to `NPM` if you come from the Javascript world.

So, lets install our first gem

```bash
$ gem install bundler
```

### Bundler
Bundler is a powerful dependencies manager for ruby, Similar to `NPM` or `Maven` or `NuGet`

Let's open our project directory and create our Gemfile, this file will allow us to have our list of gems to install, and simplify for future developers to have the environment ready in less time.

```bash
$ mkdir Rubytests && cd Rubytests
$ touch Gemfile
```

Edit the Gemfile and add this lines:


```Gemfile
source 'https://rubygems.org'
gem 'selenium-webdriver'
```
`source 'https://rubygems.org'` establishes which Gem repository are we going to use, in this case, we will go with the public repository

`gem 'selenium-webdriver'` is the first gem we need, let's talk about it next: 
### Webdriver
`Webdriver` is a framework that allows to simulate human interaction with a browser, using a couple of lines of code, you can open a webpage, write a query and hit the search button.

Webdriver is mature, has evolved well with time, and it has support for a **dozen of different programming languages** and all of the **major browsers** out there, of course, ruby is included.

After we have the Gemfile updated, we run the following command:

```bash
bundle install
```

With this, Bundler should have included all gems required.

### ChromeDriver
ChromeDriver is the official plugin support for the Chrome browser, install it and we can control Chrome

add this line to your Gemfile

```gemfile
gem 'chromedriver-helper'
```

and execute again:

```bash
bundle install
```



## Let's get our hands dirty

### The first test:
Creating a test that verify a web page is as simple as this:

```ruby
require "selenium-webdriver"
require "chromedriver-helper"

# Lets open a Chrome Driver
driver = Selenium::WebDriver.for :chrome
# Navigate.to indicates Chrome which webpage to open
driver.navigate.to "https://formy-project.herokuapp.com/form"
# find_element allows to interact with an element based on its ID, CSS selector or Xpath
driver.find_element(id: 'first-name').send_keys('John')
# send_keys allows to fill a form field
driver.find_element(id: 'last-name').send_keys('Doe')
# click allows to hit the button
driver.find_element(css: '.btn.btn-lg.btn-primary').click()
banner = driver.find_element(class: 'alert')
#Always close the browser when your tests are over
driver.quit
```
