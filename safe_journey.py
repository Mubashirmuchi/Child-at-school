from flask import Flask, render_template, request, session, jsonify, redirect
from DBConnection import Db

app = Flask(__name__)
app.secret_key = "abc"
# static_path="C:\\Users\\User\\Desktop\\safe_journey\\static\\"
staticpath = "D:\\backup (1)\\safe_journey\\static\\"

@app.route('/login',methods = ['post'])
def hello_world():

    u = request.form['textfield']
    p = request.form['textfield2']
    db =Db()
    res = db.selectOne("select * from `login` WHERE `email` = '"+u+"' AND `password` = '"+p+"'")
    if res is not None:
       if res['type'] == 'admin':
           return render_template('admin/HOME.html')
       if res['type'] == 'parent':
           return render_template('admin/HOME.html')
       else:
           return '''<script>alert('Invalid username or password');window.location='/'</script>'''
    else:
        return '''<script>alert('Invalid username or password');window.location='/'</script>'''


@app.route("/")
def aa():
    return render_template("login.html")



@app.route('/admin_add_home')
def admin_add_home():
    return render_template("ADMIN/HOME.html")





#-----------------------------------ADMIN


@app.route('/admin_add_parent')
def admin_add_parent():
    return render_template("ADMIN/parent.html")

@app.route('/admin_add_parent_post',methods=['post'])
def admin_add_parent_post():
    p_name=request.form['textfield']
    phone=request.form['textfield2']
    email=request.form['textfield3']
    job=request.form['textfield4']

    db =Db()
    res = db.insert("INSERT INTO `login`(`email`,`password`,`type`) values('"+email+"','"+phone+"','parent')")
    # session['parent_id'] = str(res)
    db.insert("INSERT INTO `parent` (parent_id,`p_name`,`phone`,`email`,`job`,`plid`) VALUES ('"+str(res)+"','"+p_name+"','"+phone+"','"+email+"','"+job+"','"+str(res)+"')")
    return '''<script>alert("Parent Registeration Sucessfull");window.location="/admin_add_parent"  </script>'''



@app.route('/admin_view_parent')
def admin_view_parent():
    db = Db()
    res=db.select("select * from parent")
    print(res)
    return render_template("ADMIN/view parent.html",data = res)


@app.route('/admin_add_student/<p_id>')
def admin_add_student(p_id):
    return render_template("ADMIN/student.html",data = p_id)


@app.route('/admin_add_student_post',methods=['post'])
def admin_add_student_post():
    parent_id=request.form['p_id']
    student_name=request.form['textfield']
    class_number=request.form['select']
    division=request.form['select2']
    # division=request.forrm['select2']
    gender=request.form['radio']
    blood_group=request.form['select3']
    place=request.form['textfield5']
    post=request.form['textfield6']
    district=request.form['textfield7']
    pin=request.form['textfield8']
    photo=request.files['browse']
    photo.save("D:\\backup (1)\\safe_journey\\static\\student\\" + photo.filename)
    path='/static/student/' + photo.filename
    d = Db()
    # qry = "INSERT INTO `login`(`email`,`password`,`type`) VALUES('"++"','','')"
    # res = d.insert(qry)
    qry1 = "INSERT INTO `student`(`name`,`class`,`division`,`gender`,`blood_group`,`place`,`post`,`district`,`pin`,`photo`,`plid`) VALUES('"+student_name+"','"+class_number+"','"+division+"','"+gender+"','"+blood_group+"','"+place+"','"+post+"','"+district+"','"+pin+"','"+str(path)+"','"+str(parent_id)+"')"
    res1 = d.insert(qry1)
    return '''<script>alert('Added Successfull');window.location="/admin_view_parent"</script>'''


@app.route('/admin_view_student/<id>')
def admin_view_student(id):
    d = Db()
    qry = "SELECT * FROM student INNER JOIN `parent` ON `parent`.`parent_id`=`student`.`plid` WHERE `parent`.`parent_id`='"+str(id)+"'"
    res = d.select(qry)
    return render_template("ADMIN/view student.html", data=res)


@app.route('/admin_view_student_post',methods=['post'])
def admin_view_student_post():
    student_name=request.form['textfield']
    class_number=request.form['select2']
    division=request.form['select']
    return render_template("ADMIN/view student.html")


@app.route('/admin_edit_student/<id>')
def admin_edit_student(id):
    d=Db()
    qry="select * from student where sid='"+id+"'"
    res=d.selectOne(qry)
    return render_template("ADMIN/edit student.html",data=res)

@app.route('/admin_edit_student_post',methods=['post'])
def admin_edit_student_post():
    st_id = request.form['p_id']
    student_name = request.form['textfield']
    class_number = request.form['select']
    division = request.form['select2']
    gender = request.form['radio']
    blood_group = request.form['select3']
    place = request.form['textfield5']
    post = request.form['textfield6']
    district = request.form['textfield7']
    pin = request.form['textfield8']
    if 'browse' in request.files:
        photo = request.files['browse']
        if photo.filename!='':
            photo.save("D:\\backup (1)\\safe_journey\\static\\student\\" + photo.filename)
            path = "//static//student//" + photo.filename
            db = Db()
            qry = "UPDATE `student`SET `name`='"+student_name+"',`class`='"+class_number+"',`division`='"+division+"',`gender`='"+gender+"',`blood_group`='"+blood_group+"',`place`='"+place+"',`post`='"+post+"',`district`='"+district+"',`pin`='"+pin+"',`photo`='"+path+"' WHERE sid='"+str(st_id)+"' "
            res = db.update(qry)
            return redirect('/admin_view_parent')
        else:
            db = Db()
            qry = "UPDATE `student`SET `name`='"+student_name+"',`class`='"+class_number+"',`division`='"+division+"',`gender`='"+gender+"',`blood_group`='"+blood_group+"',`place`='"+place+"',`post`='"+post+"',`district`='"+district+"',`pin`='"+pin+"' WHERE sid='"+str(st_id)+"' "
            res = db.update(qry)
            return redirect('/admin_view_parent')

@app.route('/admin_delete_student/<id>')
def admin_delete_student(id):
    d=Db()
    qry="DELETE FROM `student` WHERE sid='"+str(id)+"'"
    res= d.delete(qry)
    return '''<script>alert('Delete Successfull');window.location="/admin_view_parent"</script>'''



@app.route('/admin_add_bus')
def admin_add_bus():
    db=Db()
    qry="select * from route"
    res=db.select(qry)
    return render_template("ADMIN/bus.html",data=res)

@app.route('/admin_add_bus_post',methods=['post'])
def admin_add_bus_post():
    bus_no=request.form['textfield']
    registration_number=request.form['textfield2']
    model=request.form['textfield3']
    destination=request.form['textfield4']
    route=request.form['select']
    db = Db()
    db.insert("INSERT INTO `bus` (`bus_number`,`chasis_number`,`model`,`destination`,route_id) VALUES ('"+bus_no+"','"+registration_number+"','"+model+"','"+destination+"','"+route+"')")
    return admin_add_bus()
    # return render_template("ADMIN/bus.html")


@app.route('/admin_view_bus')
def admin_view_bus():
    db = Db()
    res = db.select("select * from bus join route on bus.route_id=route.route_id")
    print(res)
    return render_template("ADMIN/view bus.html",data = res)




@app.route('/admin_view_entries/<sid>')
def admin_view_entries(sid):
    db = Db()
    print(sid)
    qry="SELECT * FROM `entry` WHERE `sid`='"+sid+"'"
    res=db.select(qry)
    print(res)
    return render_template("ADMIN/view_entries.html",data=res)




@app.route('/admin_delete_bus/<id>')
def admin_delete_bus(id):
    d=Db()
    qry="DELETE FROM `bus` WHERE bid='"+str(id)+"'"
    res= d.delete(qry)
    return '''<script>alert('Delete Successfull');window.location="/admin_view_bus"</script>'''

@app.route('/admin_edit_bus/<id>')
def admin_edit_bus(id):
    db = Db()
    qry = "select * from `bus` WHERE `bid`='" + str(id) + "'"
    res = db.selectOne(qry)
    qry2="select * from route"
    res2=db.select(qry2)
    return render_template("admin/edit bus.html", data=res,route=res2)



@app.route('/admin_edit_bus_post',methods=['post'])
def admin_edit_bus_post():
    bus_id = request.form['h1']
    bus_no = request.form['textfield']
    registration_number = request.form['textfield2']
    model = request.form['textfield3']
    destination = request.form['textfield4']
    route=request.form['select']
    db = Db()
    qry = "UPDATE `bus`SET `bus_number`='"+bus_no+"',`chasis_number`='"+registration_number+"',`model`='"+model+"',`destination`='"+destination+"',route_id='"+route+"' WHERE bid='"+bus_id+"' "
    res = db.update(qry)
    return '''<script>alert('edited sucessfull');window.location="/admin_view_bus"</script>'''



@app.route('/admin_allocation')
def admin_allocation():
    db=Db()
    qry = "select * from bus"
    res = db.select(qry)
    qry1 = "select * from student"
    res1 = db.select(qry1)
    return render_template("admin/studentbusallocation.html.", data=res, data1=res1)


@app.route('/admin_allocation_post',methods=['post'])
def admin_allocation_post():
    student_name=request.form['select']
    bus_number=request.form['select2']
    fees=request.form['textfield1']
    d = Db()
    qry ="INSERT INTO `allocation`(`sid`,`bid`,`fees`) VALUES('"+student_name+"','"+bus_number+"','"+fees+"')"
    res = d.insert(qry)
    return admin_allocation()



@app.route('/admin_view_allocation')
def admin_view_allocation():
    db=Db()
    qry="SELECT `allocation`.*, `bus`.`bus_number`, `student`.* FROM `student` INNER JOIN `allocation` ON `allocation`.`sid`=`student`.`sid` INNER JOIN `bus` ON `bus`.`bid`=`allocation`.bid"
    res=db.select(qry)
    return render_template("ADMIN/view studentbusallocation.html",data=res)


@app.route('/admin_edit_allocation')
def admin_edit_allocation():
    return render_template("ADMIN/editstudentbusall.html")



@app.route('/admin_edit_allocation_post')
def admin_edit_allocation_post():
    student_name = request.form['textfield']
    bus_number = request.form['textfield2']
    bus_fees=request.form['textfield1']
    return render_template("admin/editstudentbusall.html")


@app.route('/admin_delete_aqllocation/<id>')
def admin_delete_allocation(id):
    d=Db()
    qry="DELETE FROM `allocation` WHERE aid='"+str(id)+"'"
    res= d.delete(qry)
    return '''<script>alert('Delete Successfull');window.location="/admin_view_allocation"</script>'''


@app.route('/admin_add_driver')
def admin_add_driver():
    d = Db()
    qry = "select * from bus"
    res = d.select(qry)
    return render_template("ADMIN/driver.html", data=res)

@app.route('/admin_add_driver_post', methods=['post'])
def admin_add_driver_post():
    name=request.form['textfield']
    email=request.form['textfield2']
    phone_number=request.form['textfield3']
    place = request.form['place']
    post=request.form['textfield4']
    pin=request.form['textfield5']
    age=request.form['textfield6']
    license_number=request.form['lic']
    bus_number=request.form['textfield7']
    d = Db()
    qry1 = "INSERT INTO login(`email`,`password`,`type`) VALUES('"+email+"','"+phone_number+"','driver')"
    res = d.insert(qry1)
    qry = "INSERT INTO `driver`(`dlid`,`name`,`email`,`phone_number`,place,`post`,`pin`,`age`,`bus_id`,license_number) VALUES('"+str(res)+"','"+name+"','"+email+"','"+phone_number+"','"+place+"','"+post+"','"+pin+"','"+age+"','"+bus_number+"','"+license_number+"')"
    res1 = d.insert(qry)
    return render_template("ADMIN/driver.html")


@app.route('/admin_view_driver')
def admin_view_driver():
    d=Db()
    # qry="SELECT `driver`.*, `bus`.* FROM `bus` INNER JOIN `driver` ON `driver`.`bus_id`=`bus`.`bid`"
    qry="SELECT * from driver,bus where driver.bus_id =bus.bid"
    res=d.select(qry)
    return render_template("ADMIN/view driver.html",data = res)

@app.route('/adm_edit_driver/<id>')
def adm_edit_driver(id):
    d = Db()
    qry = "SELECT * FROM driver WHERE `did`='"+str(id)+"'"
    res = d.selectOne(qry)
    qry1 = "select * from bus"
    res1 = d.select(qry1)
    return render_template('admin/edit driver.html',data=res,data1=res1)



@app.route('/admin_edit_driver_post',methods=['post'])
def admin_edit_driver_post():
    name = request.form['textfield']
    email = request.form['textfield2']
    phone_number = request.form['textfield3']
    post = request.form['textfield4']
    pin = request.form['textfield5']
    age = request.form['textfield6']
    bus_number = request.form['textfield7']
    return render_template("ADMIN/edit driver.html")





@app.route('/admin_delete_driver/<id>')
def admin_delete_driver(id):
    d=Db()
    qry="DELETE FROM `driver` WHERE did='"+str(id)+"'"
    res= d.delete(qry)
    return '''<script>alert('Delete Successfull');window.location="/admin_view_driver"</script>'''


@app.route('/admin_complaints')
def admin_comadmin_complaintsplaints():
    d = Db()
    qry = "SELECT * FROM `complaints`,`parent` WHERE complaints.pid=parent.plid AND complaints.reply='pending'"
    res=d.select(qry)
    return render_template("ADMIN/complaint.html",data=res)

@app.route('/admin_reply/<id>')
def admin_reply(id):
    return render_template("ADMIN/reply.html",d1=id)

@app.route('/admin_reply_post',methods=['post'])
def admin_reply_post():
    id=request.form['id']
    reply=request.form['textarea']
    d=Db()
    qry="update complaints set reply='"+reply+"' where cid='"+id+"'"
    res=d.update(qry)
    return '''<script>alert('Sending Successfully');window.location="/admin_complaints"</script>'''


@app.route('/admin_track')
def admin_track():
    return render_template("ADMIN/track.html")

@app.route('/admin_vehicle_status')
def admin_vehichle_status():
    d=Db()
    qry="SELECT * FROM `status`,`driver` WHERE status.did=driver.dlid "
    res=d.select(qry)
    print(qry)
    return render_template("ADMIN/status.html",data=res)

@app.route('/admin_payment')
def admin_payment():
    return render_template("admin/payment notication.html")

@app.route('/admin_payment_post',methods=['post'])
def admin_payment_post():
    last_date = request.form['textfield']
    # fees = request.form['textfield2']
    d = Db()
    qry = "SELECT * FROM `student`"
    res = d.select(qry)
    for i in res:
        sid=i['sid']
        qry1 = "SELECT * FROM `allocation` WHERE `sid`='"+str(sid)+"'"

        res1 = d.selectOne(qry1)
        if res1 is not  None:

           qry2 = "INSERT INTO `payment`(`last_date`,`fees`,`plid`) VALUES ('"+last_date+"','"+str(res1['fees'])+"','"+str(sid)+"')"
           res2 = d.insert(qry2)
    return '''<script>alert('Sending Successfully');window.location="/admin_payment"</script>'''


@app.route('/add_route')
def add_route():
    return render_template('admin/route.html')

@app.route('/add_route_post', methods=['POST'])
def add_route_post():
    fromr=request.form['textfield']
    tor=request.form['textfield2']
    db=Db()
    qry="INSERT INTO `route`(`from`,`to`)VALUES('"+fromr+"','"+tor+"')"
    res=db.insert(qry)
    return '''<script>alert('Added Successfully');window.location="/add_route"</script>'''

@app.route('/view_route')
def view_route():
    db=Db()
    qry="select * from route"
    res=db.select(qry)
    return render_template('admin/view route.html',data=res)


@app.route('/delete_route/<id>')
def delete_route(id):
    db=Db()
    qry="delete from route where route_id='"+id+"'"
    res=db.delete(qry)
    return '''<script>alert('Deleted Successfully');window.location="/view_route"</script>'''

@app.route('/add_route_point')
def add_route_point():
    db=Db()
    qry="select * from route"
    res=db.select(qry)
    return render_template('admin/route_point.html',data=res)

@app.route('/add_route_point_post', methods=['POST'])
def add_route_point_post():
    db=Db()
    route=request.form['select']
    routep=request.form['textfield2']
    qry="INSERT INTO `route_point`(`route_id`,`route_point`)VALUES('"+route+"','"+routep+"')"
    res=db.insert(qry)
    return '''<script>alert('Added Successfully');window.location="/add_route_point"</script>'''

@app.route('/view_route_point')
def view_route_point():
    db=Db()
    qry="SELECT * FROM `route_point` JOIN `route` ON `route_point`.`route_id`=`route`.`route_id`"
    res=db.select(qry)
    return render_template('admin/view route_point.html',data=res)

@app.route('/delete_route_point/<id>')
def delete_route_point(id):
    db=Db()
    qry="delete from route_point where route_point_id='"+id+"'"
    res=db.delete(qry)
    return '''<script>alert('Added Successfully');window.location="/view_route_point"</script>'''



#-----------------------------------------------------DRIVER



@app.route('/and_login',methods = ['post'])
def and_login():
    db=Db()
    username=request.form['u']
    password=request.form['p']
    qry = "select * from login where email='" + username + "' and password='" + password + "'"
    res = db.selectOne(qry)
    if res is not None:
        print(res)
        if res['type']=="parent":
            pid=res['lid']
            # print(pid)
            qry2="select * from student where plid='"+str(pid)+"'"
            res2=db.selectOne(qry2)
            sid=res2['sid']
            print(sid,"hloo")
            qry3="select * from allocation where sid='"+str(sid)+"'"
            res3=db.selectOne(qry3)
            print(res3,"haii")
            bid=res3['bid']
            # print('bussssss',bid)
            print(bid)
            if res3 is not None:
                return jsonify(status="ok", type=res["type"], lid=res["lid"],bid=res3['bid'])
            else:
                return jsonify(status="ok", type=res["type"], lid=res["lid"],bid=0)
        elif res['type']=="driver":
            dlid=res['lid']
            qry1="select * from bus,driver where bus.bid=driver.bus_id and driver.dlid='"+str(dlid)+"'"
            res1=db.selectOne(qry1)
            return jsonify(status="ok", type=res["type"], lid=res["lid"],bid=res1['bid'])
        else:
            return jsonify(status="none")
    else:
        return jsonify(status="no")


@app.route('/and_driver_view_profile',methods=['post'])
def and_driver_view_profile():
    db=Db()
    lid=request.form['id']
    print(lid)
    qry="select * from driver,bus where driver.bus_id=bus.bid and dlid='"+str(lid)+"'"
    res=db.selectOne(qry)
    return jsonify(status='ok',data=res)


@app.route('/driver_status_post',methods=['post'])
def driver_status_post():
    db=Db()
    status=request.form['status']
    print(status)
    pid=request.form['id']
    print(pid)
    # qry="update status set status='"+status+"' where did='"+str(pid)+"'"
    qry="INSERT INTO `status` (`did`,`status`) VALUES('"+pid+"','"+status+"')"
    res=db.insert(qry)
    return jsonify(status='ok')


@app.route('/and_view_parent',methods=['post'])
def and_view_parent():
    db=Db()
    lid=request.form['id']
    qry="select * from allocation,bus,driver,student,parent where allocation.bid=driver.bus_id and driver.dlid='"+str(lid)+"' and bus.bid=driver.bus_id and allocation.sid=student.sid and student.plid=parent.plid"
    res=db.select(qry)
    print(res)
    return jsonify(status='ok',data=res)

@app.route('/view_parent_bus',methods=['post'])
def view_parent_bus():
    db=Db()
    lid=request.form['id']
    print(lid)
    qry="select * from allocation,bus,driver,student,parent,track where allocation.bid=driver.bus_id and student.plid='"+str(lid)+"' and bus.bid=driver.bus_id and allocation.sid=student.sid and student.plid=parent.plid and allocation.bid=track.bid"
    res=db.select(qry)
    print(res)
    # return jsonify(status='ok',b_no=res['bus_numand_parent_paymentber'],c_no=res['chasis_number'],model=res['model'],destination=res['destination'],latitude=res['latitude'],longitude=res['longitude'])
    return jsonify(status='ok',data=res)


@app.route('/and_driver_message_parent',methods=['post'])
def driver_message_parent():
    db=Db()
    message=request.form['message']
    plid=request.form['pid']
    print(plid)
    id=request.form['id']
    qry="insert into message values ('','"+str(id)+"','"+str(plid)+"','"+message+"',curdate())"
    res=db.insert(qry)
    return jsonify(status='ok')


@app.route('/driver_student_bus_entry')
def driver_student_bus_entry():
    return render_template("DRIVER/studentbusentry.html")



@app.route('/driver_student_bus_entry_post',methods=['post'])
def driver_student_bus_entry_post():
    stdent_name=request.form['textfield']
    check_in_time=request.form['textfield2']
    check_out_time=request.form['textfield3']
    return render_template("DRIVER/studentbusentry.html")


#------------------------------------------------------PARENT


@app.route('/parent_complaint')
def parent_complaint():
    return render_template("PARENT/complaint.html")

@app.route('/parent_complaint_post',methods=['post'])
def parent_complaint_post():
    complaint=request.form['textarea']
    return render_template("PARENT/complaint.html")

@app.route('/and_view_parent_message',methods=['post'])
def and_view_parent_message():
    db=Db()
    lid=request.form['id']
    print(lid)
    qry="select * from message,driver where message.did=driver.dlid and message.pid='"+str(lid)+"'"
    res=db.select(qry)
    return jsonify(status='ok',data=res)



@app.route('/and_view_parent_entry',methods=['post'])
def and_view_parent_entry():
    db=Db()
    sid=request.form['sid']
    print(sid)
    qry="SELECT * FROM `entry` WHERE `sid`='"+sid+"'"
    res=db.select(qry)

    return jsonify(status='ok',data=res)

@app.route('/update_locate',methods=['post'])
def update_locate():
    db=Db()
    bid=request.form['bid']
    lattitude=request.form['lati']
    longitude=request.form['longi']
    location=request.form['place']
    qry="insert into track values('','"+str(bid)+"',curtime(),curdate(),'"+lattitude+"','"+longitude+"','"+location+"')"
    # qry='insert into track values('','"+str(bid)+"',curtime(),curdate(),'"+lattitude+"','"+longitude+"')'
    res=db.insert(qry)
    return jsonify(status='ok')

@app.route('/and_parent_payment',methods=['post'])
def and_parent_payment():
    db=Db()
    plid=request.form['id']
    print(plid)
    qry="select * from payment where payment.plid='"+str(plid)+"'"
    res=db.selectOne(qry)
    print(res)
    return jsonify(status='ok',data=res)


@app.route('/parent_payment_post',methods=['post'])
def parent_payment_post():
    payment_notification = request.form['textarea']
    return render_template("PARENT/payment.html")

#-----------------------------ANDROID

@app.route('/and_parent_complaint', methods=['post'])
def and_parent_complaint():
    lid=request.form['id']
    complaint = request.form['comp']
    d = Db()
    qry = "insert into complaints values('','"+str(lid)+"','"+complaint+"','pending',curdate())"
    res = d.insert(qry)
    return jsonify(status='ok')


@app.route('/and_view_complaint_reply', methods=['post'])
def and_view_complaint_reply():
    d = Db()
    pid=request.form['id']
    print(pid)
    qry = "select * from complaints where pid='"+str(pid)+"'"
    res = d.select(qry)
    return jsonify(status='ok',data=res)



@app.route('/parent_track')
def parent_track():
    return jsonify(status="ok")

@app.route('/parent_track_Post',methods=['post'])
def parent_track_post():

    return jsonify(status="ok")

@app.route('/parent_track_list_post',methods=['post'])
def parent_track_list_Post():
    d=Db()
    lid=request.form['id']
    qry="SELECT * FROM `track`,`bus` WHERE track.bid=bus.bid AND track.date=CURDATE()"
    res=d.select(qry)
    return jsonify(status='ok',data=res)


@app.route('/admin_delete_parent/<id>')
def admin_delete_parent(id):
    db = Db()
    qry = "delete from `parent` where parent_id='"+str(id)+"'"
    res = db.delete(qry)
    return '''<script>alert('Delete Successfull');window.location="/admin_view_parent"</script>'''


@app.route('/and_view_parent_child', methods=['POST'])
def and_view_parent_child():
    plid=request.form['id']
    db=Db()
    qry=" SELECT * FROM `student` WHERE `plid`='"+plid+"'"
    res=db.select(qry)
    return jsonify(status="ok",data=res)


if __name__ == '__main__':
    app.run(debug=True,host="0.0.0.0")
