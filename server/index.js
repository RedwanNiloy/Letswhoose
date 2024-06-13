 const express = require('express')
 const app = express();
 const mysql =require('mysql')
 const bodyparser=require('body-parser')
 const cors = require('cors')


app.use(cors());
app.use(express.json());



 app.use(bodyparser.json());

 const db =mysql.createConnection({

    host:'localhost',
    user: 'root',
    password:'password',
    database:'airlines_database'
 }
 );



 db.connect(function(error){
    if(!!error){

    
       throw error
    }
    else{
        console.log("Connected");
    }
})


// inserting into basic info




//Get class wise fare all details
app.get('/get/fare/all', (req, res) => {


   
   
   var dep=req.query.departure;
   var des=req.query.destination;
   var class1=req.query.class
   
     db.query("SELECT * From flight_details INNER JOIN flight_cost On ( flight_details.departure = flight_cost.departure AND flight_details.destination = flight_cost.arrival) WHERE  flight_details.departure=? AND flight_details.destination=? AND flight_cost.class=?",[dep,des,class1],(err,result)=>{
      if(err)
         console.log(err)
      else{
        
         res.send(result);
      }
          
   
   
     })
     
    })



// get ticket

app.get('/get/ticket', (req, res) => {


   const id= req.query.ticket_id;
   
     db.query("SELECT * FROM tickets WHERE ticket_id=?",[id],(err,result)=>{
      if(err)
         console.log(err)
      else{
   
         res.send(result);
      }
          
   
   
     })
     
    })




//get flight details

app.get('/get/flight_status', (req, res) => {


   const id=req.query.flight_id;
   const des=req.query.destination;
   const dep=req.query.departure;
   const dep_time=req.query.dep_time;
   
     db.query("SELECT * FROM flight_status WHERE flight_id=? AND departure=? AND destination=? AND dep_time=?",[id,dep,des,dep_time],(err,result)=>{
      if(err)
         console.log(err)
      else{
   
         res.send(result);
      }
          
   
   
     })
     
    })

























//CREATE NEW CUSTOMER INFO


app.post('/create/customers',(req,res)=>{

   var email_id=req.query.email;
   var phone_no=req.query.phone_no;
   var f_name=req.query.first_name
   var l_name=req.query.last_name
   var gender=req.query.gender
   var bod=req.query.birth_date
   var age=req.query.age
   
   
   db.query("insert into customers (email,phone_no) values (?,?)",
   [email_id,phone_no],(err,result)=>{
   
      if(err)
      {
         console.log(err);
      }
      else{
         //console.log(age);
        // res.send("INSERTED into customer");
         
         db.query("SELECT customer_id FROM customers WHERE email=? AND phone_no=?",[email_id,phone_no],(err,result)=>{
         
            if(err)
            {
               console.log(err);
            }
            else{
               //var sql_result=result;
               console.log("fetch success");
               console.log(result[0].customer_id);
               const sql_result=result[0].customer_id;
               db.query("insert into basic_info (customer_id, first_name, last_name, gender, birth_date, age) values (?,?,?,?,?,?)",
   [sql_result,f_name,l_name,gender,bod,age],(err,result)=>{
   
      if(err)
      {
         console.log(err);
      }
      else{
         console.log(age);
         res.send("inserted into basic");
      }
   })




            }
         })
      
      } 
   })

        




   
   
   


   
   
   })
    




// getting smtg from databse
app.get('/get', (req, res) => {


const id= req.body

  db.query("SELECT * FROM basic_info",(err,result)=>{
   if(err)
      console.log(err)
   else{

      res.send(result);
   }
       


  })
  
 })

 app.post('/create/payments',(req,res)=>{
 
   console.log(req.body);
   const t_id=req.body.transaction_id;
   const cost=req.body.total_cost;
   const method=req.body.payment_method;

   db.query('insert into payments (transaction_id, total_cost, payment_method) values (?,?,?)',
   [t_id,cost,method],(err,result)=>{

      if(err)
      {
         console.log(err);
      }
      else{
         console.log(t_id);
         res.send("successs");
      }
   })
   
   
   
   
   
   
   })



//Flight_details_API
app.get('/get/flight_details', (req, res) => {


   var dep= req.query.departure;
   var des=req.query.destination;
   var d_time=req.query.depTime;
   console.log(des);
   var sql=mysql.format("SELECT * FROM flight_details WHERE dep_time=? AND departure=? AND destination=?",[d_time,dep,des]);
   
     db.query(sql,(err,result,fields)=>{
      if(err)
         console.log(err)
      else{
            console.log(result[0].flight_id);
         res.send(result);
      }
          
   
   
     })
     
    })
   


    //flight_fare

    app.get('/get/fare', (req, res) => {


      
      var d_time=req.query.depTime;
      var dep= req.query.departure;
      var des=req.query.destination;
      var clas =req.query.class;



      console.log(des);
      var sql=mysql.format("SELECT aircraft_id,fare FROM flight_cost WHERE dept_time=? AND departure= ? AND arrival=? AND class=?",[d_time,dep,des,clas]);
      
        db.query(sql,(err,result,fields)=>{
         if(err)
            console.log(err)
         else{
         
            res.send(result);
         }
             
      
      
        })
        
       })
      
   













   app.listen(3000,()=>{
    console.log("yey, server is running on 3000");
 });



 