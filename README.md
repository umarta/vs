1. What is your experience in Rails?

   My experience in Ruby on Rails involves maintaining and developing enterprise applications since early 2022. I've worked extensively with third-party applications such as Xendit and 3PL shipping. These applications primarily focus on procurement-related activities.

1. How many projects have you worked on?

   I've been working on a project involving API services for a company. It includes a payment service to handle payment notifications, a service for generating various types of files, emails, jobs, and more. The most impressive project was transforming a print procurement application into a marketplace application catering to the needs of suppliers.

   This project is built using Ruby on Rails version 2.7.2. It features modules for product catalog listing, request for quotation, purchase orders, invoices, and everything is seamlessly integrated.

1. What rails version do you use?

- 2.7.2

1. What databases do you usually use?
   1. Postgres sql
1. What libraries do you usually use:
   1. Database: ActiveRecord for database interactions.
   1. Background process: Sidekiq
   1. Caching: ActiveSupport::Cache, Redis.
   1. Pagination: Kaminari
   1. Upload processing: CarrierWave.
   1. Cronjob: Clockwork.
   1. Unit Test: RSpec
   1. Refactor and fix performance issues: never use this.
   1. Automation tools for deployment process: Jenkins, k8s, docker
1. Are you familiar with these plugins, if so can you describe the function for each of these plugins:
   1. Sidekiq: A background processing library for Ruby.
   1. Shrine: A versatile file attachment toolkit for Ruby applications.
   1. Ransack: A search library for Ruby on Rails.
   1. Devise: A flexible authentication solution for Rails.
   1. JWT: JSON Web Token authentication for APIs.
   1. Pagy: A lightweight and performant pagination library.
   1. Webpacker: Integrates Webpack with Rails for managing JavaScript and CSS assets.
   1. Sprocket: The Rails asset pipeline for managing and serving static assets.
   1. Capistrano: A remote server automation and deployment tool.
1. Are you familiar with Linux, which distributions do you often use?
   1. Yes
1. Are you familiar with ubuntu, which command do you often use?
   1. Cp
   1. Mv
   1. Ssh
   1. Ln
   1. Sudo su
   1. Sudo apt install
1. Which web server do you usually use? Are you familiar with Nginx?
   1. Indeed, I'm using Nginx.

Technical:

1. Describe the difference between module and class?
   1. Module
      1. A class is a blueprint for creating objects. It defines a data structure and behavior that the objects instantiated from the class will have.
      1. Objects created from a class can have attributes (properties) and methods (functions).
      1. Classes support inheritance, allowing one class to inherit the properties and methods of another, promoting code reuse.
      1. They are used to model and encapsulate real-world entities or concepts.
   1. Class
      1. A module is a collection of methods and constants. It cannot be instantiated, and it does not have instances or an inheritance hierarchy.
      1. A module is a collection of methods and constants. It cannot be instantiated, and it does not have instances or an inheritance hierarchy.
      1. A module is a collection of methods and constants. It cannot be instantiated, and it does not have instances or an inheritance hierarchy.
      1. A module is a collection of methods and constants. It cannot be instantiated, and it does not have instances or an inheritance hierarchy.
1. Describe the difference between the class variable and the class instance variable?
   1. Class Variable:
      1. A class variable is a variable that is shared among all instances of a class.
      1. It is defined within the class but outside of any instance methods.
      1. Changes to a class variable affect all instances of the class.
      1. Class variables are typically used to store data that should be common to all instances of the class.
   1. Class Instance Variable:
      1. A class instance variable is associated with a specific class instance (object) rather than the class itself.
      1. It is defined within the class, but outside of any instance methods, similar to class variables.
      1. Each instance of the class has its own copy of the class instance variable, and changes are specific to that instance.
      1. Class instance variables are often used when you need data that is shared among instances but not shared across all instances of the class.
1. What is polymorphism and give an example for that in a model class?

   - Polymorphism, in the context of object-oriented programming, refers to the ability of objects of different types to be treated as objects of a common type. It allows objects to be used interchangeably based on their common interface or shared behavior.

   ```ruby
      class Plant
         def grow
            raise NotImplementedError, "Subclasses must implement the 'grow' method"
         end
         end

         class Flower < Plant
         def grow
            "The flower is blooming!"
         end
         end

         class Tree < Plant
         def grow
            "The tree is getting taller."
         end
      end
   ```

text In this example, Plant is a base class with a method grow that is expected to be implemented by its subclasses. Flower and Tree are subclasses of Plant, each providing its own implementation of the grow method.

Now, you can use polymorphism to treat instances of Flower and Tree interchangeably as instances of Plant:

```ruby
rose = Flower.new
oak = Tree.new

plants = [rose, oak]

plants.each do |plant|
  puts plant.grow
end
```

4. How do you handle N+1 performance issues?

   - Eager Loading:
     example
     ```ruby
         @posts = Post.includes(:comments).all
         @posts.each { |post| puts post.comments.size }
     ```
   - Joins:
     example
     ```ruby
         @posts = Post.joins(:author).all
         @posts.each { |post| puts post.author.name }
     ```
   - Batch Loading: example
     ```ruby
     @authors = Author.preload(:posts)
     @authors.each { |author| puts author.posts.size }
     ```

5. Describe what is Lazy Load, and when to use it?

   - Lazy loading is a programming technique that defers the loading of a particular object or data until the point at which it is needed. In the context of backend development, lazy loading is often associated with database queries and the retrieval of related data.

   - #### When to Use Lazy Loading:
     - Reducing Initial Load Time
     - Optimizing Resources
     - Improving User Experience
     - Minimizing Database Queries

6. How to handle Unique Records in Concurrent Process?
   - Use Transactions
     - Wrap your operations in transactions to ensure atomicity. A transaction allows a series of operations to be treated as a single, indivisible unit. If a transaction encounters an error or conflict, it can be rolled back, preventing partial updates and maintaining data consistency.
   - Locking
     - Use database locks to prevent concurrent processes from modifying the same records simultaneously. However, be cautious with this approach, as it can lead to performance issues and contention
   - Database Constraints
     - Leverage database features to enforce uniqueness constraints. Most databases support unique constraints on columns, which can prevent the insertion of duplicate records. This ensures data integrity at the database level
