const express = require("express");
const User = require("../models/auth.model");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const router = express.Router();
const salt = 10;
const secretKey = "mysecretkey";

router.post('/register', async (req, res) => {
    const email = req.body.email;
    const password = await bcrypt.hash(req.body.password, parseInt(salt));
    const newUser = new User({
        email: email,
        password: password
    });  
    console.log(req.body);
    try {
            const user = await User.findOne({email: email});
            if(!user) {
                const newuser = await newUser.save();
                res.status(201).send({
                    message: "registered successfully",
                    data: newuser
                });
            }else{
                res.status(403).send({
                    message: "Email already in use.",
                });
            }
           
    } catch (err) {
        res.status(500).json(err);
    }
});

router.post("/login", async (req, res) => {
    const email = req.body.email;
    const password = req.body.password;
    console.log(req.body);
    try {
            const user = await User.findOne({ email: email });
            !user && res.status(404).send({
                message: "Not found!"
            });
        
            const validated = await bcrypt.compare(password, user.password);
            !validated && res.status(400).send({
                message: "Wrong credentials!"
            });
            
            const access_token = jwt.sign({uuid: user._id}, secretKey);
            
            res.status(200).send({
                token: access_token, 
                message: "success", 
            });
        
    } catch (err) {
        res.status(500).send(err);
    }
});



module.exports = router;