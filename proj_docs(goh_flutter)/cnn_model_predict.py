import numpy as np 
import pandas as pd 
import tensorflow as tf
import keras

load_model = tf.keras.models.load_model('./best_model.h5')

def fit_model(data):
    res_dict = {0 : 'Normal beat, everything is normal',
            1 : 'Supraventricular ectopic beats detected, visit hospital',
            2 : 'Ventricular ectopic beats detected, visit hospital',
           3 : 'Fusion Beats detected, visit hospital',
           4 : 'Unknown Beats detected, visit hospital'}
    y = np.reshape(data, (186,1)).T
    load_model.compile(optimizer = 'adam', loss= 'categorical_crossentropy', metrics = ['accuracy'])
    y_pred=load_model.predict(y)
    result = y_pred[0].argmax()
    print(res_dict[result])
    print('possibility : {:.2f}%'.format((y_pred[0][result])*100));