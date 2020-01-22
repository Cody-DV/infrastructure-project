from flask import Flask, request, jsonify
import json

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/greet', methods=['POST'])
def greet_user():

  data = json.loads(request.data)

  response = jsonify({
    "message": "Greetings from the Flask API, {}".format(data['name']),
    "status": "Online"
  })

  response.status_code = 200

  return response