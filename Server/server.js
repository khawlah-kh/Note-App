//const { Console } = require("console")

const express = require('express')

//const { not } = require('ip')

const mongoose = require('mongoose')

var app = express()

//look to noteSchema file
var Data = require('./noteSchema')

mongoose.connect('mongodb://localhost/newDB')
mongoose.connection.once("open",function(){
    console.log("Connected to DB!")
}).on("error",function(error){
    console.log("Faild to connect  " + error)
})


//1-CREATE A NOTE (Post request)
app.post("/create",(req,res)=>{

    var note = new Data({
        title : req.get("title"),
        date : req.get("date"),
        note : req.get("note")
    })
note.save().then(()=>{

    if (note.isNew == false ){
        console.log("Saved Data!")
        res.send("Saved Data!")
    } else{
        console.log("Faild to save Data")
    }
})


})

//2-FETCH ALL NOTES (Get request)
app.get("/fetch",(req,res)=>{
Data.find({}).then((DBitems)=>{

    res.send(DBitems)
})

})


//3-DELETE A NOTE (Post request)
app.post("/delete",(req,res)=>{
Data.findOneAndRemove({
    _id : req.get("id")
},(err)=>{
    console.log("Faild"+err)
})
res.send("deleted!")

})

//UPDATE A NOTE (Post request)

app.post("/update",(req,res)=>{
Data.findOneAndUpdate({
    _id : req.get("id")
},{
title : req.get("title"),
date : req.get("date"),
note : req.get("note")
},(err)=>{
console.log("Faild to update "+err)
})

res.send("Updated!")
})





var server = app.listen(8081,"MyIPAddress",()=>{
    console.log("Server is running")
})
