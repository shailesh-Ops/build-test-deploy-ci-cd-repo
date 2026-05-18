from flask import Flask


source="DevOps-Engineer"
app = Flask(__name__)

@app.route("/")

def hello_server():
    return {"this message hello from : {source}" }

if __name__ == "__app__":
    app.run(host='0.0.0.0',port=9000,Debug=True)