const express = require('express');
const dash=require('./routes/dash');
const authRouter=require('./routes/auth');

const app = express();
const PORT=3000;

app.get("/",(req, res) => {
    res.send("Hello World")
});
app.use(dash);
app.use(auth);

app.listen(PORT,"0.0.0.0",function(){

});