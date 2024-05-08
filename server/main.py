from flask import Flask, jsonify
from flask_restx import Api, Resource
import pymysql

app = Flask(__name__)
api = Api(app)

def get_mysql_connection():
    connection = pymysql.connect(host='',
                                 user='',
                                 password='',
                                 db='',
                                 charset='',
                                 cursorclass=pymysql.cursors.DictCursor)
    return connection

@api.route('/raw_data')
class RawData(Resource):
    def get(self):
        conn = get_mysql_connection()
        try:
            with conn.cursor() as cursor:
                sql = "SELECT * FROM raw_data"
                cursor.execute(sql)
                result = cursor.fetchall()
                return jsonify(result)
        finally:
            conn.close()

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=80)

