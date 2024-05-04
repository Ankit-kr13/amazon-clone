const express = require('express');
const user=require('../model/user');
const authRouter=express.Router();


//validation
authRouter.post("/api/signup",async(req, res) => {
    const {name ,email,password}=req.body;
  const exist = await user.findOne({email});
  if(exist){
    return res.status(400).json({msg:"user already exists"});
  }
    //req.body - Map Type
    

//upload data to DB
var user=new User({
    name,
    email,
    password,
})
user = await user.save();
res.json(user);


});

module.exports =authRouter;

