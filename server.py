from flask import Flask, request, jsonify
import os

app = Flask(__name__)

@app.route('/server', methods=['POST'])
def process():
    file = request.files['file']

    if file.filename == '':
        return jsonify({'message': 'No selected file'}), 400

    if file:
        # 파이썬 서버가 존재하는 디렉터리에 전달 받은 파일 저장
        file.save(os.getcwd()+"\\"+file.filename)
        return jsonify({'message': 'File successfully uploaded'}), 200

if __name__ == '__main__':
    app.run(port=5000)