# **Beanstar**- Documentation & Application Summary
#### https://beanstar.herokuapp.com/

----------

Beanstar is a project demonstration (not for commercial use) of a two-sided marketplace for niche coffee roasters to sell roast coffee beans and/or ground coffee to discerning customers. This documentation can be navigated using the following links:

1. [Overview](#overview) 
2. [Setup, configure and use](#setup-configure-and-use)
3. [User stories and profiles](#user-stories-and-profiles)
4. [Wireframes](#wireframes)
5. [Database design and ERD](#database-design-and-erd)
7. [Gems](#gems)

## Overview

![Beanstar landing page](https://trello-attachments.s3.amazonaws.com/59f280e7c0ab92dd996443d6/59f2bc5352dd03099bdb2642/7b3e22730a5ed7cb69237698ec0539fe/Beanstar.png)
<br />
Beanstar is a two-sided marketplace for small-batch coffee roasters to sell their beans to customers with an interest in niche products. Although larger sellers could use the site, it has been designed to cater to small businesses and individuals who want to sell small batches of high-quality/unique coffees. 

The site offers a range of features to assist sellers, buyers and the coffee community - including ratings and reviews, in-application chat and messaging, the ability to 'follow' particular roasters, and detailed information on the coffee for sale (including coffee variety, origin, roast, flavour composition and roasting schedule). The social features of the application are particularly important, as they allow for users with specialist knowledge and/or a strong interest in coffee to engage with each other, share advice and recommend products.



### Technology

 - Beanstar was built using Ruby on Rails (Rails v5.1.4, Ruby v2.4.2), PostgreSQL, Bootstrap 4, CSS3 and HTML5 and deployed to Heroku. A list of the gems used can be found [below](#gems).
 - The application was designed and wireframed using Figma. The wireframes can be found <a href="https://www.figma.com/file/Wg1dSvnq7xFOieUXv4cdDBlj/Major-Project---Beanstar">here</a>. 
 - Planning and project management was tracked using Trello. The board can be found <a href="https://trello.com/b/JkPtVpr2/two-sided-marketplace-beanstar">here</a>. 
 - Other services used include AWS S3 (image uploading/data storage), and Mailgun (for transaction confirmation emails).
 

### Problem

The problem identified is that most existing online stores cater to larger businesses with the ability to produce and sell a consistent product. Smaller businesses or at-home enthusiasts would find these platforms excessive for the purpose of experimenting and selling single-batch roasts.  

### Solution

Beanstar's solution to this problem is to offer a two-sided market place where an amateur roaster can quickly and easily create a seller's account and list single products - offering a high degree of detail about their products, building a social profile and attracting followers, and chatting with other sellers and buyers through a platform which specifically caters to their target audience. 

### Project plan and estimation

This application was developed over a 12 day period - with 3 days originally allocated for user story, wireframe and database design and  9 days allocated for development. This estimation proved to be accurate, and the project was completed on schedule.

## Setup, configure and use

Noting its focus on small business and individual sellers, Beanstar was designed to be easy to sign up for and use. The application has been deployed to Heroku and is live at: https://beanstar.herokuapp.com/. Listing an item for sale takes only four steps:

 1. Sign up for a Beanstar account (only an email is required).<br>
 
 2. Create a user profile (note: at this point, a user is able to freely buy roasts, message other users, leave reviews and follow roasters).<br>
 
 3. Create a store profile.<br>
 
 4. Create a product listing. 

## User Stories and Profiles
 
![Trello board](https://trello-attachments.s3.amazonaws.com/59f280e7c0ab92dd996443d6/59f2bc5352dd03099bdb2642/ee99e6dc8bf84748b8a6b5c09a36d071/Trello.png)
<br />

The design process was commenced by identifying the application's intended users and developing their user stories. In total, twenty-four user stories were written to build a strong understanding of the software features that Beanstar would require from an end-user perspective - including from the perspective of buyers only, sellers only and buyer/seller users. 

These were <a href="https://trello.com/b/JkPtVpr2/two-sided-marketplace-beanstar">documented using Trello and can be accessed at this link</a>. 

## Wireframes
![Figma wireframes](https://trello-attachments.s3.amazonaws.com/59f280e7c0ab92dd996443d6/59f2bc5352dd03099bdb2642/8230f2a9dbb2bea2364fd038a8a041e6/Figma.png)
<br>

The second phase of the design process was to create low-fidelity wireframes to set out the structure, flow and content of the application. The focus here was on mobile-first design, and over twenty wireframes were produced which followed the user journey through the application. These mobile wireframes were made based on a 320 x 568 pixel screen size and account for almost all of the functions and pages which were ultimately developed - therefore also serving as a work-flow diagram of the user journey. Some key design decisions were made at this point, including:

 - That users needed to be logged in to make purchases, contact sellers and make their own reviews of stores; but that the product listings, store pages and basic profile pages would be available to anyone who visited the page; and
 
 - That - in addition to directing visitors to sign up - the home/landing page would make listings of products (beans) and stores (roasters) clearly available, along with a list of the top 5 roasters (by user rating).


Once the mobile wireframes were complete, four low-fidelity desktop wireframes were also prepared to set-out how this content would be presented on a wider screen.

All of the wireframes were designed using Figma and can be found <a href="https://www.figma.com/file/Wg1dSvnq7xFOieUXv4cdDBlj/Major-Project---Beanstar">at this link</a>. 

## Database design and ERD
![ERD](https://trello-attachments.s3.amazonaws.com/59f280e7c0ab92dd996443d6/59f68709836a27e3f5734c1a/b157e36c2464ca9557d520eb6fd09b9a/final_erd.png)

The final stage in the pre-development design process was to design and document the application's database. For ease of use and greater security, the User model generated by the authentication gem Devise was at the center of the database. The `current_user` method available with Devise could then be use to set the foreign key of the Profile, Conversation (i.e. chat), Store, Review and Purchase models - as well as the Following join table. The only exception was the Listing model (used to generate individual product listings), which was associated with the Store model. 

## Gems

Beanstar was developed using the following gems. 

| Gem | 
| ------ | 
| Devise | 
| Dotenv | 
| Pundit | 
| Bootstrap |
| Bootstrap-datepicker-rails | 
| Will-paginate | 
| Will-paginate-bootstrap | 
| Jquery-rails | 
| Fastimage | 
| Image Processing | 
| Mini Magick | 
| Shrine | 
| Aws-sdk | 
| Money-rails | 
| Country-select | 
| Stripe | 
| Mailgun-ruby |
| Httparty | 
| Pg_search |

