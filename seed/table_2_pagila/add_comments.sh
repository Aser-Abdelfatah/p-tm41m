#!/bin/bash

# Replace 'postgres_user' and 'your_database_name' with your PostgreSQL username and desired database name.

DATABASE_NAME=tutos
POSTGRES_USER=tuto




# Execute the table creation in the new database
sudo docker exec -it pagila psql -U postgres -c"

COMMENT ON COLUMN film_actor.actor_id IS 'Unique identifier for the actor';
COMMENT ON COLUMN film_actor.film_id IS 'Unique identifier for the film';
COMMENT ON COLUMN film_actor.last_update IS 'Timestamp of the last update';

COMMENT ON COLUMN address.address_id IS 'Unique identifier for the address';
COMMENT ON COLUMN address.address IS 'Primary address text';
COMMENT ON COLUMN address.address2 IS 'Secondary address text (optional)';
COMMENT ON COLUMN address.district IS 'District or area of the address';
COMMENT ON COLUMN address.city_id IS 'Identifier for the city';
COMMENT ON COLUMN address.postal_code IS 'Postal code for the address';
COMMENT ON COLUMN address.phone IS 'Contact phone number';
COMMENT ON COLUMN address.last_update IS 'Timestamp of the last update';

COMMENT ON COLUMN city.city_id IS 'Unique identifier for the city';
COMMENT ON COLUMN city.city IS 'Name of the city';
COMMENT ON COLUMN city.country_id IS 'Identifier for the country the city belongs to';
COMMENT ON COLUMN city.last_update IS 'Timestamp of the last update';

COMMENT ON COLUMN actor.actor_id IS 'Unique identifier for the actor';
COMMENT ON COLUMN actor.first_name IS 'First name of the actor';
COMMENT ON COLUMN actor.last_name IS 'Last name of the actor';
COMMENT ON COLUMN actor.last_update IS 'Timestamp of the last update';


COMMENT ON COLUMN actor_info.actor_id IS 'Identifier for the actor';
COMMENT ON COLUMN actor_info.first_name IS 'First name of the actor (optional)';
COMMENT ON COLUMN actor_info.last_name IS 'Last name of the actor (optional)';
COMMENT ON COLUMN actor_info.film_info IS 'Information about films the actor is associated with (optional)';

COMMENT ON COLUMN category.category_id IS 'Unique identifier for the category';
COMMENT ON COLUMN category.name IS 'Name of the category';
COMMENT ON COLUMN category.last_update IS 'Timestamp of the last update';



COMMENT ON COLUMN country.country_id IS 'Unique identifier for the country';
COMMENT ON COLUMN country.country IS 'Name of the country';
COMMENT ON COLUMN country.last_update IS 'Timestamp of the last update';


COMMENT ON COLUMN customer.customer_id IS 'Unique identifier for the customer';
COMMENT ON COLUMN customer.store_id IS 'Identifier for the store the customer belongs to';
COMMENT ON COLUMN customer.first_name IS 'First name of the customer';
COMMENT ON COLUMN customer.last_name IS 'Last name of the customer';
COMMENT ON COLUMN customer.email IS 'Email address of the customer (optional)';
COMMENT ON COLUMN customer.address_id IS 'Identifier for the address of the customer';
COMMENT ON COLUMN customer.activebool IS 'Boolean flag indicating if the customer is active';
COMMENT ON COLUMN customer.create_date IS 'Date when the customer record was created';
COMMENT ON COLUMN customer.last_update IS 'Timestamp of the last update';
COMMENT ON COLUMN customer.active IS 'Active status of the customer (optional)';

COMMENT ON COLUMN customer_list.id IS 'Identifier for the customer';
COMMENT ON COLUMN customer_list.name IS 'Name of the customer';
COMMENT ON COLUMN customer_list.address IS 'Address of the customer';
COMMENT ON COLUMN customer_list.\"zip code\" IS 'Zip code of the customer';
COMMENT ON COLUMN customer_list.phone IS 'Phone number of the customer';
COMMENT ON COLUMN customer_list.city IS 'City of the customer';
COMMENT ON COLUMN customer_list.country IS 'Country of the customer';
COMMENT ON COLUMN customer_list.notes IS 'Additional notes about the customer (optional)';
COMMENT ON COLUMN customer_list.sid IS 'Identifier for the store the customer belongs to';

COMMENT ON COLUMN film_list.fid IS 'Identifier for the film';
COMMENT ON COLUMN film_list.title IS 'Title of the film';
COMMENT ON COLUMN film_list.description IS 'Description of the film';
COMMENT ON COLUMN film_list.category IS 'Category of the film';
COMMENT ON COLUMN film_list.price IS 'Price of the film';
COMMENT ON COLUMN film_list.length IS 'Length of the film in minutes';
COMMENT ON COLUMN film_list.rating IS 'Rating of the film';
COMMENT ON COLUMN film_list.actors IS 'Actors starring in the film';


COMMENT ON COLUMN nicer_but_slower_film_list.fid IS 'Identifier for the film, same as film_list but designed for slower queries';
COMMENT ON COLUMN nicer_but_slower_film_list.title IS 'Title of the film';
COMMENT ON COLUMN nicer_but_slower_film_list.description IS 'Description of the film';
COMMENT ON COLUMN nicer_but_slower_film_list.category IS 'Category of the film';
COMMENT ON COLUMN nicer_but_slower_film_list.price IS 'Price of the film';
COMMENT ON COLUMN nicer_but_slower_film_list.length IS 'Length of the film in minutes';
COMMENT ON COLUMN nicer_but_slower_film_list.rating IS 'Rating of the film';
COMMENT ON COLUMN nicer_but_slower_film_list.actors IS 'List of actors in the film';

COMMENT ON COLUMN film.film_id IS 'Unique identifier for the film';
COMMENT ON COLUMN film.title IS 'Title of the film';
COMMENT ON COLUMN film.description IS 'Description of the film';
COMMENT ON COLUMN film.release_year IS 'Release year of the film';
COMMENT ON COLUMN film.language_id IS 'Identifier for the language of the film';
COMMENT ON COLUMN film.original_language_id IS 'Identifier for the original language of the film (if different)';
COMMENT ON COLUMN film.rental_duration IS 'Duration in days for which the film can be rented';
COMMENT ON COLUMN film.rental_rate IS 'Rate at which the film can be rented';
COMMENT ON COLUMN film.length IS 'Length of the film in minutes';
COMMENT ON COLUMN film.replacement_cost IS 'Cost to replace the film';
COMMENT ON COLUMN film.rating IS 'Rating of the film';
COMMENT ON COLUMN film.last_update IS 'Timestamp of the last update';
COMMENT ON COLUMN film.special_features IS 'List of special features available in the film';
COMMENT ON COLUMN film.fulltext IS 'Full-text search vector for the film';


COMMENT ON COLUMN film_category.film_id IS 'Identifier for the film';
COMMENT ON COLUMN film_category.category_id IS 'Identifier for the category';
COMMENT ON COLUMN film_category.last_update IS 'Timestamp of the last update';

COMMENT ON COLUMN inventory.inventory_id IS 'Unique identifier for the inventory item';
COMMENT ON COLUMN inventory.film_id IS 'Identifier for the film';
COMMENT ON COLUMN inventory.store_id IS 'Identifier for the store';
COMMENT ON COLUMN inventory.last_update IS 'Timestamp of the last update';


COMMENT ON COLUMN language.language_id IS 'Unique identifier for the language';
COMMENT ON COLUMN language.name IS 'Name of the language';
COMMENT ON COLUMN language.last_update IS 'Timestamp of the last update';

COMMENT ON COLUMN rental.rental_id IS 'Unique identifier for the rental';
COMMENT ON COLUMN rental.rental_date IS 'Date and time the rental started';


COMMENT ON COLUMN rental.inventory_id IS 'Identifier for the inventory item being rented';
COMMENT ON COLUMN rental.customer_id IS 'Identifier for the customer renting the item';
COMMENT ON COLUMN rental.return_date IS 'Date and time the item was returned';
COMMENT ON COLUMN rental.staff_id IS 'Identifier for the staff member who processed the rental';
COMMENT ON COLUMN rental.last_update IS 'Timestamp of the last update';

COMMENT ON COLUMN payment.payment_id IS 'Unique identifier for the payment';
COMMENT ON COLUMN payment.customer_id IS 'Identifier for the customer making the payment';
COMMENT ON COLUMN payment.staff_id IS 'Identifier for the staff member receiving the payment';
COMMENT ON COLUMN payment.rental_id IS 'Identifier for the rental associated with the payment';
COMMENT ON COLUMN payment.amount IS 'Amount of the payment';
COMMENT ON COLUMN payment.payment_date IS 'Date and time the payment was made';


COMMENT ON COLUMN sales_by_film_category.category IS 'Category of the film';
COMMENT ON COLUMN sales_by_film_category.total_sales IS 'Total sales amount for the category';

COMMENT ON COLUMN sales_by_store.store IS 'Name of the store';
COMMENT ON COLUMN sales_by_store.manager IS 'Name of the store manager';
COMMENT ON COLUMN sales_by_store.total_sales IS 'Total sales amount for the store';

COMMENT ON COLUMN staff_list.id IS 'Identifier for the staff member';
COMMENT ON COLUMN staff_list.name IS 'Name of the staff member';
COMMENT ON COLUMN staff_list.address IS 'Address of the staff member';
COMMENT ON COLUMN staff_list.\"zip code\" IS 'Zip code of the address of the staff member';
COMMENT ON COLUMN staff_list.phone IS 'Phone number of the staff member';
COMMENT ON COLUMN staff_list.city IS 'City of the staff member';
COMMENT ON COLUMN staff_list.country IS 'Country of the staff member';
COMMENT ON COLUMN staff_list.sid IS 'Identifier for the store the staff member belongs to';

COMMENT ON COLUMN store.store_id IS 'Unique identifier for the store';
COMMENT ON COLUMN store.manager_staff_id IS 'Identifier for the manager of the store';
COMMENT ON COLUMN store.address_id IS 'Identifier for the address of the store';
COMMENT ON COLUMN store.last_update IS 'Timestamp of the last update';
COMMENT ON COLUMN staff.staff_id IS 'Unique identifier for the staff member';
COMMENT ON COLUMN staff.first_name IS 'First name of the staff member';
COMMENT ON COLUMN staff.last_name IS 'Last name of the staff member';
COMMENT ON COLUMN staff.address_id IS 'Identifier for the address of the staff member';
COMMENT ON COLUMN staff.email IS 'Email address of the staff member (optional)';
COMMENT ON COLUMN staff.store_id IS 'Identifier for the store the staff member is associated with';
COMMENT ON COLUMN staff.active IS 'Boolean flag indicating if the staff member is active';
COMMENT ON COLUMN staff.username IS 'Username for the staff member';
COMMENT ON COLUMN staff.password IS 'Password for the staff member (optional)';
COMMENT ON COLUMN staff.last_update IS 'Timestamp of the last update';
COMMENT ON COLUMN staff.picture IS 'Picture of the staff member (optional)';


"