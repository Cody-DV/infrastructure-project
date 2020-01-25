from flask import Flask, request, jsonify
from flask_cors import CORS
import json

app = Flask(__name__)
CORS(app)


@app.route('/')
def hello_world():

    response = jsonify({
      "message": "Hello World"
    })

    response.status_code = 200

    return response

@app.route('/greet', methods=['POST', 'OPTIONS'])
def greet_user():

  data = json.loads(request.data)

  response = jsonify({
    "message": "Greetings from the Flask API, {}".format(data['name']),
    "status": "Online"
  })

  response.status_code = 200

  return response