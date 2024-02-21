// select Id,Name from cookit.ing_ingredient
//
// 
LOAD CSV FROM 'file:///ingredients.csv' as line
FIELDTERMINATOR ';'
CREATE (:Ingredient {id: line[0], name: line[1]})

CREATE INDEX ingredient_id_index FOR (n:Ingredient) ON (n.id)

// select ParentId,ChildId,RelationType from cookit.ing_ingredientChild where RelationType='Specyfication'
//
LOAD CSV FROM 'file:///ingredients_relations_specification.csv' AS line
FIELDTERMINATOR ';'
MATCH (e:Ingredient {id: line[0]})
MATCH (c:Ingredient {id: line[1]})
MERGE (e)-[:Specification]->(c)

//
//select ParentId,ChildId from cookit.ing_ingredientChild where RelationType='MadeInto'
//
LOAD CSV FROM 'file:///ingredients_relations_madeinto.csv' AS line
FIELDTERMINATOR ';'
MATCH (e:Ingredient {id: line[0]})
MATCH (c:Ingredient {id: line[1]})
MERGE (e)-[:Made_into]->(c)

// select Id,IdentityOfId from cookit.ing_ingredient where IdentityOfId is not null
LOAD CSV FROM 'file:///ingredient_identityOfId.csv' AS line
FIELDTERMINATOR ';'
MATCH (e:Ingredient {id: line[0]})
MATCH (c:Ingredient {id: line[1]})
MERGE (e)-[:IdentityOf]->(c)

LOAD CSV FROM 'file:///recipes.csv' AS line 
FIELDTERMINATOR ';'
CREATE (:Recipe {id: line[0], name: line[1]})

CREATE INDEX recipe_id_index FOR (n:Recipe) ON (n.id)

// Recipe->Ingredient
LOAD CSV FROM 'file:///recipe_ingredient_01.csv' AS line
FIELDTERMINATOR ';'
MATCH (r:Recipe {id: line[0]})
MATCH (i:Ingredient {id: line[1]})
MERGE (r)-[:Contains]->(i)

LOAD CSV FROM 'file:///recipe_ingredient_02.csv' AS line
FIELDTERMINATOR ';'
MATCH (r:Recipe {id: line[0]})
MATCH (i:Ingredient {id: line[1]})
MERGE (r)-[:Contains]->(i)

LOAD CSV FROM 'file:///recipe_ingredient_03.csv' AS line
FIELDTERMINATOR ';'
MATCH (r:Recipe {id: line[0]})
MATCH (i:Ingredient {id: line[1]})
MERGE (r)-[:Contains]->(i)

LOAD CSV FROM 'file:///recipe_ingredient_04.csv' AS line
FIELDTERMINATOR ';'
MATCH (r:Recipe {id: line[0]})
MATCH (i:Ingredient {id: line[1]})
MERGE (r)-[:Contains]->(i)