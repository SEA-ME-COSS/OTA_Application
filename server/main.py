from flask import Flask, request, send_file, jsonify
from flask_restx import Api, Resource
import pymysql
import paho.mqtt.publish as publish
import os

app = Flask(__name__)
api = Api(app)

UPLOAD_FOLDER = os.path.join(os.getcwd(), 'uploads')
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

def get_mysql_connection():
    connection = pymysql.connect(host='',
                                 user='',
                                 password='',
                                 db='',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)
    return connection

@api.route('/raw_data')
class RawData(Resource):
    def get(self):
        conn = get_mysql_connection()
        try:
            with conn.cursor() as cursor:
                sql_result_data = "SELECT * FROM result_data"
                cursor.execute(sql_result_data)
                result_data = cursor.fetchall()

                sql_raw_data = "SELECT LocationX, LocationY FROM raw_data"
                cursor.execute(sql_raw_data)
                raw_data = cursor.fetchall()

                sql_overpoint_data = "SELECT * FROM overpoint_data"
                cursor.execute(sql_overpoint_data)
                overpoint_data = cursor.fetchall()

                result = {
                    "result_data": result_data,
                    "raw_data": raw_data,
                    "overpoint_data": overpoint_data
                } 
                return jsonify(result)
        finally:
            conn.close()

@app.route('/upload', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        return 'No file part'
    file = request.files['file']
    if file.filename == '':
        return 'No selected file'
    
    file_path = os.path.join(app.config['UPLOAD_FOLDER'], file.filename)
    file.save(file_path)

    file_url = f"http://127.0.0.1:80/files/{file.filename}"
    publish.single("ota/update", file_url, hostname="localhost", port=1883)

    return 'File uploaded and update notification sent'

@app.route('/files/<filename>', methods=['GET'])
def download_file(filename):
    file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
    if os.path.exists(file_path):
        return send_file(file_path, as_attachment=True)
    else:
        return 'File not found', 404

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=80)

