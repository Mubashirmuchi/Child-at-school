import serial
from  DBConnection import  Db
serialPort = serial.Serial(port="COM11")

serialString = ""                           # Used to hold data coming over UART
mm=""
counter=0
studentlogid=""
while(True):

        from  datetime import  datetime
        s= datetime.now().strftime("%H:%M:%S")


        serialString = serialPort.read().decode('utf-8')
        mm=mm+serialString
        if len(mm)==12:
            print(mm)
            if counter==0: #first student rfid scanned

                db=Db()
                qry="SELECT * FROM `student` WHERE `pin`='"+mm+"'"
                print(qry)
                mm = ""
                res=db.selectOne(qry)
                if res is not None:
                    qry="SELECT  * FROM `entry` WHERE `sid`='"+str(res['sid'])+"' AND `date`=curdate()"
                    res1= db.selectOne(qry)
                    if res1 is None:

                        qry="INSERT INTO `entry` (`sid`,`check_in_time`,`check_out_time`,`date`,`status`) VALUES ('"+str(res['sid'])+"','"+s+"','pending',curdate(),'checkin')"
                        db.insert(qry)
                    else:

                        if res1['status']=="checkin":
                            qry="update entry set check_out_time='"+s+"', status='checkout' where eid='"+str(res1['eid'])+"'"
                            db.update(qry)






