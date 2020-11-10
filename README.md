This is a Repository of some my projects.

## 1. Churn Prediction and Reason Analysis of carrier ATT, Verizon and T-Mobile
* Detected and mined the real-time data on Twitter based on some keywords of three carrier ATT, Verizon and T-Mobile.
* Clean up the social media data and organize into the regular corpus. Use the python ‘matplotlib’ library to create dashboards to explore the characteristics of each data distribution and perform pre- analysis on the sentiment trend analysis of Twitter text data to find some rules and problems.
* Develop scripts that can understand the semantics of the tweet text, based on the premise of fully understanding the database. For instance, using a weight score to indicate whether the user will transfer from Verizon to ATT, is it because of service or price? According to the test of some samples manually labeled, the accuracy of small feature engineering reaches 80%.
* Use manually labeled samples to train Naïve Bayes and XGBoost classification models and test with 73% accuracy.
* Focus on the churn reason text dataset, use topic modeling and other clustering technology to screen out some key insights.
* Utilized: text analysis model, python lib: nltk, genism, sklearn, numpy, pandas, matplotlib

## 2. Computer Vision -- Classifier of Clean Bedroom and Messy Bedroom
* Collect and label 150 clean bedroom pictures and 150 messy bedroom pictures from Google images, and organize them into a database.
* From the perspective of feature engineering, scan the obvious difference of two types of pictures, such as clean rooms have lots of parallel and neat lines, and messy rooms have lots of irregular curves. Use edge detection, line gradient direction and other image processing techniques to convert all pictures into another representation and 9 models are trained with it. And the hard-voting classifier composed of naïve bayes, logistic regression and svc has the highest accuracy 83%
* Directly use deep learning models such as CNN and transfer learning to learn the features of all pictures, and finally get 92% accuracy in the classification task.
* Utilized: image processing technology, python lib: numpy, sklearn, matplotlib, MatLab
