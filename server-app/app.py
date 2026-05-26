from flask import Flask


source="DevOps-Engineer and more v10.3"
app = Flask(__name__)

@app.route("/")

def hello_server():
    return {" message ": f"hello from : {source}" }

if __name__ == "__main__":
    app.run(host='0.0.0.0',port=9000,debug=True)