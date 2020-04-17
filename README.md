# Grocery-Sales-Prediction
Predicting Sales using Machine Learning in R 
Model Used: - regression tree, regression tree after pruning, bootsing, bagging, random forest, linear regression using ridge and lasso, forward/backward model selection, neural network, MARS

## Project Description
Imagine a grocery chain with multiple stores. In each store, they sell numerous products. For  a  high  level  analysis,  twenty-four  product  categories  are  considered  in each  store. Following are the product categories:1.Carbonated  Beverages,  2.Cigarettes,  3.  Coffee,  4.  Cold  Cereal,  5.  Deodorant,  6. Diapers,  7.  Face  Tissue,  8.  Frozen  Dinner  Entre,  9.  Frozen  Pizza,  10.  Hot  Dog,  11. Laundry Detergent, 12. Margarine & Butter, 13. Mayonnaise, 14. Mustard & Ketchup, 15. Paper Towel, 16. Peanut Butter, 17. Shampoo, 18. Soup, 19. Spaghetti Sauce, 20. Sugar Substitute,21. Toilet Tissues, 22. Tooth Paste, 23. Yogurt, and 24. Beer.

For  each  of  the  above  listed  product  categories,  weekly  data  were  collected  on  the following variables:1. Unit Price (P), 2. Promotion (PR), 3. Display (D), 4. Feature (F) 5. Volume of Sales (Y)

Each row in the data represents a week.Numeric values that are part of the variable names indicate the product categories. For example,P1,  PR1, D1,  F1,  and  Y1representprice,  promotion,  display,  feature,  and sales, respectively of carbonated beverage.

The  goal  is  to  predict sales of each product category forall thestores. 


##  Extract of Final Report
To make weekly plans of inventory and shelf spaces for each store and weekly product replenishment orders for suppliers, we, from the headquarter office of a retail chain, used products information from 8 stores to build a relatively accurate forecast model.
Based on all data from 8 store each with 24 products, 4 related variables and 1 sales value divided into training data and test data, we aimed to establish 8 \cdot 24 models to forecast sales. 
The highlight of our research is that is we tune model and data according to the features of data so as to increase our predictability-- to attain prediction error, RMSE, as small as possible. As a result, we adopted 11 prediction methods and then adjusted parameters of them in order make a better prediction. Overall, we discover that Boosting domains all the models to have the best performance on our dataset to predict sales. But anyway, we fit the best model to every product of every store to get minimum RMSE that we can get.
