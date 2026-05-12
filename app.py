from  flask import  Flask , render_template , request


app = Flask(__name__)

@app.route('/')

def index():
    return render_template('index.html')

@app.route('/submit',method='[POST]')
def submit():
   
    name = request.form['name']
    return f'hello from DevOps Engineer,{name}!'

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=5000,Debug=True)