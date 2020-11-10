This is a Repository of my analysis projects.

## 1. Churn Prediction and Reason Analysis of carrier ATT, Verizon and T-Mobile
* Detected and mined the real-time data on Twitter based on some keywords of three carrier ATT, Verizon and T-Mobile.
* Clean up the social media data and organize into the regular corpus. Use the python ‘matplotlib’ library to create dashboards to explore the characteristics of each data distribution and perform pre- analysis on the sentiment trend analysis of Twitter text data to find some rules and problems.
* Develop scripts that can understand the semantics of the tweet text, based on the premise of fully understanding the database. For instance, using a weight score to indicate whether the user will transfer from Verizon to ATT, is it because of service or price? According to the test of some samples manually labeled, the accuracy of small feature engineering reaches 80%.
* Use manually labeled samples to train Naïve Bayes and XGBoost classification models and test with 73% accuracy.
* Focus on the churn reason text dataset, use topic modeling and other clustering technology to screen out some key insights.
* Utilized: text analysis model, python lib: nltk, genism, sklearn, numpy, pandas, matplotlib

