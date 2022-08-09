import numpy as np 
import pandas as pd 
import tensorflow as tf
import keras

load_model = tf.keras.models.load_model('./drive/MyDrive/best_model.h5')

def fit_model(data):
    load_model.compile(optimizer = 'adam', loss= 'categorical_crossentropy', metrics = ['accuracy'])
    y_pred=load_model.predict(ecg)
    result = y_pred[0].argmax()
    return result;