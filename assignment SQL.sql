create table Recipe (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(25), description VARCHAR(50), instructions VARCHAR(500)) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table Ingredient (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50)) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

create table Measure (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(30)) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

create table RecipeIngredient (recipe_id INT NOT NULL, ingredient_id INT NOT NULL, measure_id INT, amount INT, 

	CONSTRAINT fk_recipe FOREIGN KEY(recipe_id) REFERENCES Recipe(id), 

	CONSTRAINT fk_ingredient FOREIGN KEY(ingredient_id) REFERENCES Ingredient(id), 

	CONSTRAINT fk_measure FOREIGN KEY(measure_id) REFERENCES Measure(id)) 

	ENGINE=InnoDB DEFAULT CHARSET=utf8; 
  
  /* With the schema created, we can insert rows (aka records) of data in to the tables.  This is the "Create" part of CRUD.  Notice that the RecipeIngredient table is full of foreign keys, meaning that this table maps all the other tables together. */	
/* inserted measurements to database*/
  INSERT INTO Measure (name) VALUES ("PATTY"), ("SLICE"), ("PIECES");
/* Inserted ingredients to database*/
  INSERT INTO Ingredient (name) VALUES ('cheese'), ("bologna"), ("bread"), ("crackers"), ("hamburger");
/* added name, description and prep instructions to recipe */
  INSERT INTO Recipe (name, description, instructions) VALUES('Cheese Burger', 'Summertime favorite', 'Grill the burger. Melt cheese on top. Serve with french fries.');
  INSERT INTO Recipe (name, description, instructions) VALUES('Cheese and Crackers', 'Delightful snack', 'Slice cheese into cracker sized slices. Serve with crackers.');
  INSERT INTO Recipe (name, description, instructions) VALUES('Bologna & Cheese Sandwich', 'Childhood staple', 'Take two slices of bread and add a slice of bologna and a slice of cheese. Serve.');
/* called values of measure, ingredient and recipe to combine into final recipe */

   /*Cheeseburger recipe */
  INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (1, 5, 1, 1);
  INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (1, 1, 2, 1);
  INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (1, 3, 2, 2);
  
  /*Cheese and Crackers */
  INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (2, 1, 2, 1),(2, 4, 3, 1);
  
  /* Bologna and Cheese Sandwich */
  INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (3, 3, 2, 2),(3, 2, 2, 1),(3, 1, 2, 1);
  