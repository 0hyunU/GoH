import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

df = pd.read_csv('./processed_bp.csv')

def data_print(age,s_bp,d_bp):
    data = df[df['age_level']== age]
    print('your blood pressure is : {}/{}'.format(s_bp,d_bp))
    print('Average Blood pressure : {:.1f} / {:.1f}'.format(data.SBP.describe()[1],data.DBP.describe()[1]))
    if (s_bp < data.SBP.describe()[4] or d_bp < data.DBP.describe()[4]):
        print('your bp is low less than 25% quantile')
    elif (s_bp < data.SBP.describe()[5] or d_bp < data.DBP.describe()[5]):
        print('your bp is at normal range but below average')
    elif (s_bp < data.SBP.describe()[6] or d_bp < data.DBP.describe()[6]):
        print('your bp is at normal range but above average')
    elif (s_bp < data.SBP.describe()[7] or d_bp < data.DBP.describe()[7]):
        print('be advised your bp is high, 75% quantile')
        
data_print(3,140,70) #input : 나이대, 최고혈압/최저혈압