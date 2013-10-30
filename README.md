bricks
======

A short POC for bricks infrastructure
=======
# Gooddata::Bricks

Bricks is a quick POC how could reusable apps in GD infrastructure work. 

## Installation

There is no installation. This is a POC not a library. If you want to play do

    git clone https://github.com/fluke777/bricks_usage.git 
    bundle install
    ruby playground.rb

## Usage

Let's say we have Bricks. These are reusable pieces of code for example for syncing users or executing all reports. You want to pass bricks some parameters and also set its execution in certain context. You want to log in to GoodData, maybe other systems, maybe measure an execution, set up logging policies etc. We are introducing a concept of Middleware which is different from brick in the sense that it has knowledge not only about parameters but also about next brick or middleware. This enables it to manipulate the parameters and influence the execution of the brick. It also allows to wrap around the execution and perform tasks like measuring time. All this is only configuration the infrastructure itself does not change so it poses less risk for breaking it down.

let's have a look at a simple example

```ruby
app = Pipeline.prepare([HelloWorldBrick])
app.call({:who => "tomas"})
```

this is fine but let's say we want to introduce measuring how long execution takes
There is a middleware called BenchMiddleware which benchmarks the app and then outputs the report

```ruby
app = Pipeline.prepare([BenchMiddleware, HelloWorldBrick])
app.call({:who => "tomas"})
```

now imagine that you would like to create a middleware that will connect you to GD based on your gd_login and gd_password or gd_sst parameters. There is a middleware that does just this.

```ruby
app = Pipeline.prepare([BenchMiddleware, GoodDataSSTLoginMiddleware, HelloWorldBrick])
app.call({:who => "tomas", :gd_sst => "your_sst_token_comes_here"})
```

Currently none of the middlewares is changing params but nothing keeps them from doing it. It might be useful to peek under the covers. You can easily create your own middleware. Do this

```ruby
class MyDebuggingMiddleware < Gooddata::Bricks::Middleware
  def call(params)
    binding.pry
    @app.call(params)
  end
end
```

now you can use it.

```ruby
app = Pipeline.prepare([MyDebuggingMiddleware, HelloWorldBrick])
app.call({:who => "tomas", :gd_sst => "your_sst_token_comes_here"})
```