# NLP Model for SMS Spam Detection

## Overview
This project focuses on building a Natural Language Processing (NLP) model for detecting spam messages in SMS data. 
The model is designed to classify messages into spam or ham (non-spam) categories.
It incorporates various techniques including text pre-processing, feature engineering, and machine learning.

## Project Structure

- **Data Loading and Exploration**
  - Loaded SMS data from a CSV file and explored its distribution.
  
- **Exploratory Data Analysis (EDA)**
  - Analyzed the message length distribution for spam and ham messages.
  - Visualized data roles in different fields.

- **Data Pre-processing**
  - Cleaned text data by converting to lowercase, removing punctuation, links, and stopwords.
  - Applied stemming to reduce words to their root form.

- **Token Visualization**
  - Utilized WordCloud to visualize top words for both ham and spam messages.

- **Vectorization**
  - Employed CountVectorizer for traditional machine learning models.
  - Utilized TF-IDF transformation for feature scaling.
  - Utilized GloVe embeddings for word representation.

- **Model Building**
  - Implemented a Multinomial Naive Bayes model with accuracy score 0.9626704953338119.
  - Developed a pipeline for seamless integration of text vectorization and machine learning models.
  - Implemented an XG Boost model for enhanced performance.

- **Confusion Matrix Visualization**
  - Utilized Plotly to create an annotated heatmap for confusion matrix visualization.

## Dependencies
- Python 3.x
- Jupyter Notebook
- Libraries: pandas, numpy, matplotlib, seaborn, plotly, nltk, spacy, keras, scikit-learn, xgboost, wordcloud

## Acknowledgments
- The project uses data from the SMS Spam Collection dataset from https://www.kaggle.com/code/andreshg/nlp-glove-bert-tf-idf-lstm-explained/notebook#5.2-TF-IDF
- GloVe pre-trained word embeddings were utilized for enhanced feature representation.

