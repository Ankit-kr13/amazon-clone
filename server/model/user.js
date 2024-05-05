const mongoose=require('mongoose');
const userSchema=mongoose.Schema({
    name:{
        require:true,
        type:String,
        trim:true,
    },
    email:{
        require:true,
        type:String,
        trim:true,

        validate:{
            validator:(value)=>{
                const re=/^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$/;
               return value.match(re);
            },
            message : "Enter a valid email address",
        }
    },
    password:{
        require:true,
        type:String,
        validate:{
            validator:(value)=>{
                return value.length >=6;
            },
            message : "Please enter a valid password",
        }

    },
    address:{
              type:String,
              default:''
    },
    type:{
        type:String,
        default:'user'
    }

});
module.exports=mongoose.model("user",userSchema);