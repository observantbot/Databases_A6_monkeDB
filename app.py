from flask import Flask, render_template, request, redirect, url_for
from flask_mysqldb import MySQL
import yaml
from sql_execution import Sql_query
from datetime import date
import random

app = Flask(__name__)

# Configure db
db = yaml.safe_load(open('db.yaml'))
app.config['MYSQL_HOST'] = db['mysql_host']
app.config['MYSQL_USER'] = db['mysql_user']
app.config['MYSQL_PASSWORD'] = db['mysql_password']
app.config['MYSQL_DB'] = db['mysql_db']

mysql = MySQL(app)


def age(year, month, day):
    today = date.today()
    age = today.year - year - ((today.month, today.day) < (month, day))
    return age



@app.route('/', methods=['GET', 'POST'])
def index():

    # FOR INSERT
    if request.method == 'POST':
        det = request.form
        
        
        print("USER DETAILS:", det)
        cur = mysql.connection.cursor()
        sql = Sql_query(cur)

        user_id = random.randint(100, 100000)
        vaccine_id = random.randint(100, 100000)
        patient_id = random.randint(100, 100000)
        disease_id = random.randint(100, 100000)
        qr_id = random.randint(100, 100000)
        age_ = age(int(det['dob'][:4]), int(det['dob'][5:7]), int(det['dob'][8:]))
        
        # USER TABLE
        user_att = ['user_id', 'Name', 'email', 'dob', 'gender', 'age',
                    'home_no', 'street_name', 'city', 'state', 'pincode', 'Contact_no']
        user_val = (user_id, det['Name'], det['email'], det['dob'], det['gender'], age_,
                    int(det['home_no']), det['street_name'], det['city'], det['state'], int(det['pincode']), int(det['Contact_no']))
        
        sql.insert('users', user_att, user_val)
        
        # STUDENT - STAFF - FACULTY
        if det['roll_no'] != '':
            student_att = ['roll_no', 'hostel', 'room_no', 'Discipline', 'Home_contact_no']
            student_val = (int(det['roll_no']), det['hostel'], int(det['room_no']), det['discipline'], int(det['home_contact_no']) )
            sql.insert('students', student_att, student_val)
        elif det['employ_no'] != '':
            staff_att = ['emp_id', 'resident', 'department', 'address']
            staff_val = (int(det['employ_no']), det['resident'], det['department'], det['address'])
            sql.insert('staff', staff_att, staff_val)
            print('LEAKAGE')
        else:
            faculty_att = ['emp_id', 'discipline', 'housing_block', 'house_number']
            faculty_val = (int(det['faculty_employ_no']), det['faculty_discipline'], det['housing_block'], int(det['house_no']))
            sql.insert('faculty', faculty_att, faculty_val)

        # VACCINE
        vaccine_att = ['vaccine_id', 'Name', 'first_dose', 'second_dose', 'booster_dose', 'total_doses_no']
        vaccine_val = (vaccine_id, det['vaccine_name'], det['fdd'], det['sdd'], det['bdd'], 0)
        sql.insert('vaccine', vaccine_att, vaccine_val)

        # QR
        qr_att = ['qr_id', 'last_entry_time', 'last_exit_time']
        qr_val = (qr_id, None, None)
        sql.insert('qr', qr_att, qr_val)

        # DISEASE
        disease_att = ['disease_id', 'disease_name']
        disease_val = (disease_id, det['disease_name'])
        sql.insert('disease', disease_att, disease_val)

        # COVID_DATA
        covid_att = ['patient_id', 'Date']
        covid_val = (patient_id, det['covid_date'])
        sql.insert('covid_data', covid_att, covid_val)
        mysql.connection.commit()
        cur.close()
        return redirect(url_for('table', table_name = 'users'))

    return render_template('index.html')



@app.route('/table/<table_name>', methods = ['GET', 'POST'])
def table(table_name):
    cur = mysql.connection.cursor()
    sql_q = "SELECT * FROM " + table_name
    resultValue = cur.execute(sql_q)
    if resultValue > 0:
        userDetails = cur.fetchall()
        url = table_name + '.html'
        return render_template(url,userDetails=userDetails)
    return render_template('otherwise.html')



@app.route('/<table_name>/delete/<att>', methods = ['POST'])
def delete(table_name, att):
    cur = mysql.connection.cursor()
    print('INSIDE DELETE FUN', table_name, att)
    det = request.form
    print('FORM------', det)
    sql = Sql_query(cur)
    sql.delete(table_name, [att], (int(det[att])))
    mysql.connection.commit()
    url = '/table/' + table_name
    return redirect(url)


@app.route('/<table_name>/update', methods = ['POST'])
def update(table_name):
    cur = mysql.connection.cursor()
    print('INSIDE UPDATE FUN', table_name)
    det = request.form
    form_att = []
    for i in det:
        if det[i] != '':
            form_att.append(i)
    print('FORM ATT', form_att)
    form_val = tuple([det[i] for i in form_att])
    print('FORM VAL', form_val)
    sql = Sql_query(cur)
    sql.update(table_name, form_att, form_val)
    mysql.connection.commit()
    url = '/table/' + table_name
    return redirect(url)



if __name__ == '__main__':
    app.run(debug=True)
    

    