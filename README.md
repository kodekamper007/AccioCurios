# AccioCurios

## Introduction

AccioCurios is a marketplace for buying and selling collectibles. The goal of AccioCurios is to have a dedicated marketplace for users to either buy or sell their collectibles such as toys, cards, games, etc to other users through a secure platform.  

## Links

[AccioCurios Site Link](https://secret-sea-86315.herokuapp.com/)

[Github Link](https://github.com/MomentaiChris26/AccioCurios)

### Purpose
The purpose of AccioCurios is to provide a dedicated marketplace for users to buy and sell collectibles through a safe and secure online platform.

### Functionality/Features
The functions and features of AccioCurios include:

- Ability for Users to create an account, where they can buy and sell collectibles.
- Listings can be created, modified or deleted by a user. They can also upload an image to accompany the listing.
- Users can view all listings available in the marketplace and users can purchase collectibles.
- They can use stripe to make a secure payment.
- Users have a dashboard where they can see their listings, modified or edited them, see their purchases or see which of their listings have been sold.
- There is an admin function that allows an administrator to oversee and maintain the website, including deleting or modifying users account or listings.

### Sitemap
![AccioCurios Sitemap](./resources/sitemap.jpg)

### Screenshot

Home Page
![Home Page](./resources/homepage.JPG)

Sign In Page
![Sign In Page](./resources/loginpage.JPG)

Sign Up Page
![Sign Up Page](./resources/signuppage.JPG)

Browse Listings Page
![Browse Listings Page](./resources/browselisting.JPG)

Show Listings Page
![Show Listing Page](./resources/showpage.JPG)

User Dashboard Page
![User Dashboard](./resources/dashboard.JPG)

Admin Dashboard Page
![Admin Dashboard Page](./resources/admindashboard.JPG)

### Target Audience

AccioCurios is designed for people who are seeking to purchase or sell different types of collectibles on a safe and secure website. This can include the general public, collectors or even businesses.

### Tech Stack
- HTML/CSS
- Bootstrap for CSS styling
- Heroku for website deployment
- VS Studio for code editing and development
- AWS S3 for file cloud storage
- Stripe API for online payments

## 1.2 High-Level Components (abstractions)

### Active Record
Active Records is a rails layer in the application that allows the creation, retention and use of objects inside a database.

All inputted data is stored into an Postgresql database. The information is stored into the database via forms or methods inside the rails application. The application can interact with the database by retrieving data and allowing it to intereactive with objects in rails. For example, the method `Listings.all` retrieves all listings from the Listings table in the database and the view portion of rails allows it to display aspects of those listings including the title or price.

### Active Storage
Active Storage is a layer in the rails that allows the application to upload files or images into a cloud storage such as Amazon or Google. Active Storage can interact with Active Records, where it attach images or files to an object in the Rails application. It can also store images through Active Records, where a user may update it through a form which gets saved into the database.

In AccioCurios, Active Storage allows a user to upload a screenshot or picture of the product they wish to sell. This is linked to AWS S3 cloud storage, where it can be retrieved and viewed in the listings pages.

### Devise
Devise is a gem that provides the creation and maintenance of user accounts on the rails application. It interacts with Active Records to store information into the database when a user signs up. It generates the view pages and controllers required for a user to create their accounts and modify when required. Devise is required in the application to give the ability for users to create, modify or delete their own listings, safely purchase listings and show their purchases and listings on their dashboard.

You can find out more detail about Devise by going to the following link. [Devise Github](https://github.com/plataformatec/devise)

### Cancancan
Cancancan is a library that provides authorisation and sets permissions in the application. It achieves this by setting defined methods in its own model which can be called to other components of the application. These methods check against the User's role, which would be defined in the database against the user's table and grants permission based on that role. It prevents other users from being able to modify or delete other user's listings.

Permissions are set inside the models/ability.rb, which is generated by Cancancan. There are three levels of permissions set inside this model.

First level is when a user is not signed up or signed in. They're able to read and view the current listings made by other users, but they must be signed in to access additional functionality.

Next level of permission is when a user is signed in. They're able to create, modify or delete their own listings, or buy other user's listings. However, they're unable to modify, or delete other user's listings.

Highest level of permission is an admin role. They're able to modify or delete users, all listings, and data in tables including categories and conditions.

You can find out more detail about Cancancan by going to the following link. [Cancancan Github](https://github.com/CanCanCommunity/cancancan)

### Ransack
Ransack is a rails library that allows the application to have search features. It does this by querying the database using parameters provided in the search bar. 

In regards to this application, it looks up the title of listing and uses a sql 'where' clause on the database with the input from the user on either the home page or listings page. 

Ransack is used because it provides the ability for a user to search the title of a listing and return the results to make it easier for users to look for specific listings in the database if they're looking for something specific.

You can find out more detail about Ransack by going to the following link. [Ransack Github](https://github.com/activerecord-hackery/ransack)

## 1.3 Third Party Services

### Bootstrap
Bootstrap was used for CSS styling in the application. This allowed the implementation of styling to the website. The elements are provided from an external CDN provided by [Stack Path]("https://www.stackpath.com/"). The styles are taken from a code extract on [Bootstrap]("https://getbootstrap.com/") and modified to fit the pages styling requirement.

### Stripe
Stripe is a payment platform that allows users to purchase other user's listings. It links the user to an external page using the stripe API, where the user can enter their credit card details to complete the purchase. It's designed to allow safe transaction between buyer and seller with maximum security when processing a buyer's payment.

For stripe to pick up the correct data, it queries the database based on the listing information provided in the show page. These parameters are taken into consideration in a method that stripe utilises to return the correct details of the listing to the payment page.

The reason for using Stripe over a custom payment implementation into the application is due to PCI compliance. In order for application to process payments, it needs to meet a set of requirement set out by PCI security standards. To overcome this issue, the implementation of Stripe, an external payment platform that is already PCI compliance, and eliminates the necessary work to become PCI compliant if we decided to implement a custom payment processing system.

## 3.1 Identify the problem you’re trying to solve
AccioCurios seeks to solve the problem of having a dedicated marketplace for people to buy or sell various collectibles.

In today's market, there are plenty of big marketplaces where people can buy, trade or sell collectibles, such as Ebay, Amazon, or Gumtree. However, these are large marketplaces that contain not only collectibles, but new items, or different type of products that aren't necessarily collectibles.

A collector may only be seeking specific collectibles and may find too many products that may or not be related to what they're looking for. AccioCurios solves this issue by providing the collectors a dedicated marketplace where they can sell and buy their collections.

It focuses on quality or rarity of the product over quantity. As it only allows a user to buy a particular product from its marketplace. AccioCurios target audience would be individuals rather than businesses seeking to sell their products. However, it doesn't prevent a business from selling their products on the site as they might also sell collectibles direct to collectors. Additionally, it offers a dashboard for users to check their listings and purchases they've made, making it cleaner and easier to keep track of their items.

## 3.3 Model Relationships
Listings is considered the main table in which the other tables in the database revolve around. Therefore the relationships for Rails Active Records are discussed in detail below and the reason for the existence of that relationship.

The first relationship discussed is the listings.

- Listings belongs to User, Condition and Category
- Condition has many listings
- Category has many listings
- Users has many listings

When the user is creating a new listing, it lets the database know through Active Records that it plans to create a new listing and assigns it a new id. The method in listings controller also assigns the attribute user_id to the current user. The relationship here is that the listing belongs to a user. Conditions and Categories will have many listings. Conditions and categories are separated into their own tables in the database. The purpose of this is to normalise the data and provide the opportunity for a future filtering feature in the application, where the user can do a filter search using the condition or the category of a specific listing.

However, to allow a user to add a new category or condition, the inputs needed to be nested into the create listings form. This is achieved through adding a relationship to the model using the `accepts_nested_attributes_for` attribute. This allowed the user to add a new condition or category using the listing form and store them into their respective tables in the database. Additionally, the form had to be able to retrieve pre-existing conditions and categories for a user to select. This is where the relationship between listing, conditions and categories, where the database determines the association between the tables and can allow the form display those items.  

The comments belong listings. 

- Comments belong to Listings and users
- Listing has many comments
- Users has many comments

The purpose of doing this is to ensure that any comments made is in reference to a listing. The comment section is designed for users to interact with one another regarding the listing. This uses the `listing_id` parameters on the show page which will perform two functions in relation to the comments. Firstly, the comment table in the database contains `listing_id` attribute which is accessed when in the listings show page using the listing id provided by the URL link. This allows the listing controller to retrieve the comments specifically related to the listing in the show page. The second function is the ability for a user to type a comment onto the show page and assign a `user_id` to the specific comment. This links the the user to the comment and can display the user's name by querying the user table and picking up the username using the `user_id` on the creation of the comment. The purpose of this is allow a user to be identified on the comments so they can send inquiries and replies to each other.

Purchase history table belongs to listings and users.

- Purchase_history belongs to listings and users
- Listings has many purchase_history
- Users has many purchase_history

The purpose of this relationship is that it acts a type of join table in which the listing is assigned to a user when they make a purchase. Its does this when a user makes a purchase, it assigns the attribute `buyer_id` of the Purchase History table in the database to the current user's id and the listing id in the Listings table to the Listing_id attribute in the Purchase History. The purchase history can be viewed in a user's dashboard since dashboard queries purchase history table to match up the buyer's id to the current user's id.

## 4.2 ERD Design and interaction

![AccioCurios ERD](./resources/erd.jpg)

The interaction in the ERD is based on a simple design where the relationships revolve around the listings table. In regards to the ERD, the interaction occurs around the Listings table, which is the application's foundation that is built around.

Both Conditions and Categories table in the ERD were separated from Listings for two purposes. Both tables contain one field and a primary key, and their only relationship is to the listings table.

Listing table in ERD contains attributes relevant for a complete listing and three foreign keys to other tables in the ERD. Conditions and Categories are separated from Listings to normalise the data. The listing table will store the Condition and Category ids and will reference them when the listing is created. The third foreign key ensures that the listing belongs to the user that created it. The Listing table also has relationships to comments and purchase histories tables.

The comments table has two foreign keys and a text body. Firstly, it contains a foreign key to the listings table. This ensures it only relates to a specific listing rather than just any listing. The second foreign key is the user_id. The purpose of having the reference to the user table is to assign the comment made on that specific listing to a particular user in the database. This means that a listing can have multiple comments and assigns different comments under that listing to different users, which allows the ability for users to have discussions or send queries in relation to the listing.

The purchase histories table is a type of join table that is used to display when a user has purchase a listing. The Purchase Histories table has two foreign keys. First, its assigned to a purchased listing using the id from the listing table and assigns the the user's id who purchasd it to the `buyer_id`. The purpose of this table is to record the information relating to the purchase of a particular listing to a particular user in the user table.

Finally, the last table is the user table, which contains information relating to user accounts within the database. User table has relations with three separate tables within the database. Firstly, a user will be able to have one or many listings. Next, the user should be able to make multiple comments to different listings. And finally, the user can have one or more purchase histories.

## 4.3 Schema

Extract from Application Schema

````ruby


ActiveRecord::Schema.define(version: 2019_11_09_071414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "body", null: false
    t.bigint "user_id"
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_comments_on_listing_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "conditions", force: :cascade do |t|
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string "title", null: false
    t.date "posted_date", null: false
    t.integer "sold", default: 0
    t.text "description", null: false
    t.bigint "condition_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.float "price", default: 0.0, null: false
    t.integer "buyer_id", default: 0, null: false
    t.index ["category_id"], name: "index_listings_on_category_id"
    t.index ["condition_id"], name: "index_listings_on_condition_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "purchase_histories", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_purchase_histories_on_listing_id"
    t.index ["user_id"], name: "index_purchase_histories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", default: "", null: false
    t.boolean "admin", default: false
    t.datetime "deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "listings"
  add_foreign_key "comments", "users"
  add_foreign_key "listings", "categories"
  add_foreign_key "listings", "conditions"
  add_foreign_key "listings", "users"
  add_foreign_key "purchase_histories", "listings"
  add_foreign_key "purchase_histories", "users"
end

````

## 6.1 User Stories

Since AccioCurios is a marketplace, the needs to be addressed for the marketplace to function effectively and efficiently comes down to how functions are accessed and the level of privileges allowed for the different types of users. The most important need, is the ability for a user to create, read, update or destroy listings and make purchases from other users.  

There are three different levels of users that will be using the application. Each level has a specific permission and depending on the level, can prevent or allow access to certain functionality in the application. 

A guest is a user who hasn't created an account or has logged in. The scope of their interaction with the application is that they're only able to view search listings, and view the individual listings. This level of access limits the functionality of the application and encourages the guest to sign up for an account to access the more important functionalities in the application. 

When user logs in or creates an account, it provides more functionality to the user's interaction. A user at this point can, create, modify or delete their own listings, purchase other user's listings and access their own dashboards, where their listings and purchases are displayed. They're also able to delete, or modify their account details. These privileges covers most of the functionality of the application, which meets the needs of the application. 

The last level of user is an admin. The admin has the ability to view all pages, has access to the admin dashboard. They're able to delete or modify all users, all listings, conditions and categories. The purpose of giving admin access to all these abilities is that as an admin, they should have oversight of all aspects of the application. However, an admin may not be able to purchase any listings, as an admin has the ability to modify another user's listings. This ensures that the admin can't abuse their power as an admin. An example of this is an admin may reduce another user's listing price to $1.00 and purchase the item. Removing the admin's ability to purchase an item prevents this from happening.


## 6.2 Wireframe

Below are the wireframes for the design of the website.

Home Page
![Home Page](./resources/home_page.png)

Home Page (375x812) (Mobile View)

![Home Page Mobile View](./resources/home_page_mobile.png)

All listings Page

![All listings](./resources/all_listings.png)

All Listings Page (375x812) (Mobile View)

![All listings Mobile View](./resources/all_listings_mobile.png)

Create Listings Page

![Create listing](./resources/create_listing.png)

Sign Up Page
![sign up page](./resources/SignUp.png)

## 6.3 Planning
Trello was used as the planning tool to document and check progress of the application. The process for keeping track of the tasks was putting them into individual cards on trello. Cards are lined up in the backlog based on the importance of the task. They are moved to 'Doing' when they're being worked on and finally moved to 'Done' once the task is completed.

![Trello 4](./resources/trello4.JPG)

![Trello 3](./resources/trello3.JPG)

![Trello 2](./resources/trello2.JPG)

![Trello 1](./resources/trello1.JPG)

