express = require('express');
const authRouter=express.Router();

authRouter.post("/api/signup",(req, res) => {
    //req.body - Map Type
    const {name ,email,pwd}=req.body;
});

module.exports =authRouter;

//mongodb+srv://ankitwork139:<9430152492@Ankit>@amazon-clone.fhit2cb.mongodb.net/?retryWrites=true&w=majority&appName=amazon-clone