const express = require('express');
const user=require('../model/user');
const bcryptjs = require('bcryptjs');
const authRouter=express.Router();


//validation
authRouter.post("/api/signup",async(req, res) => {
  try{
  const {name ,email,password}=req.body;
  const exist = await user.findOne({email});
  if(exist){
    return res.status(400).json({msg:"user already exists"});
  }
    //req.body - Map Type
    

//upload data to DB
const hashedPassword=await bcryptjs.hash(password,3);
var user=new User({
    name,
    email,
    password: hashedPassword,
})
user = await user.save();
res.json(user);
}catch(e){
  res.status(500).json({error:e.message});
};

});

module.exports =authRouter;

