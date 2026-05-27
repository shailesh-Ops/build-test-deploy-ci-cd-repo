from flask import Flask


source="Hello From DevOps-Engineer"
source1 ="version is v-11"
app = Flask(__name__)

@app.route('/')
def index():
    return {"message": source , "result": "DEvOps Engineer to DevSecOps", "version": source1, "port": 9000}

@app.route("/health")
def index_second():
    return {"status": f"version v-11 latest", "data1": source1}

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=9000, debug=True)