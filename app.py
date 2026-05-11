from  flask import  Flask , render_template , request


app = Flask(__name__)

@app.route('/')

def index():
    return render_template('index.html')

@app.route('/submit',method='POST')
def submit():
   
    name = request.form['name']
    return f'hello from DevOps Engineer,{name}!'

if __name__ == '__app__':
    app.run(debug=True)