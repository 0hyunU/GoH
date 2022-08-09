import numpy as np 
import pandas as pd 
import tensorflow as tf
import keras
import os


def fit_model(data):
    print(os.getcwd())
    load_model = tf.keras.models.load_model('./best_model.h5')
    res_dict = {0 : '동리듬(정상),Normal beat,everything is normal',
            1 : '조기수축(심방),Supraventricular ectopic beats detected, visit hospital',
            2 : '조기수축(심실),Ventricular ectopic beats detected, visit hospital',
           3 : '조기수축(심실/심방),Fusion Beats detected, visit hospital',
           4 : 'Unknown Beats detected, visit hospital'}
    y = np.reshape(data, (186,1)).T
    load_model.compile(optimizer = 'adam', loss= 'categorical_crossentropy', metrics = ['accuracy'])
    y_pred=load_model.predict(y)
    result = y_pred[0].argmax()
    print(res_dict[result])
    print('possibility : {:.2f}%'.format((y_pred[0][result])*100));
    
    return res_dict[result]