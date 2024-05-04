const express = require('express');
const dash=require('./routes/dash');
const authRouter=require('./routes/auth');

const app = express();
const PORT=3000;
const mongoose=require('mongoose');
const DB="mongodb+srv://ankitwork139:Ankit123@amazon-clone.fhit2cb.mongodb.net/?retryWrites=true&w=majority&appName=amazon-clone"

app.get("/",(req, res) => {
    res.send("Hello World")
});
app.use(dash);
app.use(authRouter);

//CLIENT <Middleware> SERVER
mongoose.connect(DB).then(()=> {
    console.log("Connection successful");
}).catch((e)=>{
    console.log(e);
});

app.listen(PORT,"0.0.0.0",function(){

});