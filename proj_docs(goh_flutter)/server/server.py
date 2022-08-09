from flask import Flask, request, jsonify  # 서버 구현을 위한 Flask 객체 import
from flask_restx import Api, Resource  # Api 구현을 위한 Api 객체 import
from typing import Union

app = Flask(__name__)  # Flask 객체 선언, 파라미터로 어플리케이션 패키지의 이름을 넣어줌.
api = Api(app)  # Flask 객체에 Api 객체 등록

@api.route('/hello')  # 데코레이터 이용, '/hello' 경로에 클래스 등록
class HelloWorld(Resource):
    def get(self):  # GET 요청시 리턴 값에 해당 하는 dict를 JSON 형태로 반환
        return {"hello": "world!"}

@api.route('/ecg',methods=['GET', 'POST'])
class Classify(Resource):

    def post(self):
        return self.ecg_classify(request)
    def get(self):
        return self.ecg_classify(request)
    
    def ecg_classify(self, request) -> Json:
        from ecg_preprocess import ecg_preprocess
        from cnn_model_predict import fit_model

        data = request.get_json()
        if type(data) != list: 
            return jsonify({'result': 'Wrong!!! body should list!!!'})            
        print(str(data)[:100])
        print(type(data))
        # print(data)
        # print(type(data))
        # print(data)
        result = fit_model(ecg_preprocess(data))
        
        
        return jsonify({'result': result})
        
    

@api.route('/bp',methods=['GET','POST'])
class Classify(Resource):
    
    def post(self):
        return self.bp_classify(request)
    
    def get(self):
        return self.bp_classify(request)
    
    
    def bp_classify(self, req):
        from bp_result import data_print
        
        req = request.get_json()
        age = int(req['age'])
        s_bp = int(req['s_bp'])
        d_bp = int(req['d_bp'])
        result = data_print(age,s_bp,d_bp)
        
        return jsonify({'result': result})
    
        
    

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=5001)
