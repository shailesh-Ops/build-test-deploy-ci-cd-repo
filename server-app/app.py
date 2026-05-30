from flask import Flask

# any make chenge's at here not another palce with make any chenge's
source="Hello From DevOps-Engineer"
source1 ="version is v-12"
app = Flask(__name__)

@app.route('/')
def index():
    return {
        
            "message": source ,
            "result": "DEvOps Engineer to DevSecOps", 
            "version": source1, 
            "port": 9000         
        }

@app.route("/health")
def index_second():
    return {
            
            "message": source,
            "status": "version v-11 latest",
            "data1": source1,
            "port": 9000
        }

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=9000, debug=True)