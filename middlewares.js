const jwt = require("jsonwebtoken");
const User = require("./models/auth.model");

const verifyToken = (req, res, next) => {
    try{
        const token = req.headers.authorization.split(" ")[1];
        const userData = jwt.verify(token, "mysecretkey");
        if(token == null){
            res.send({message: "token not provided"});
        } 
        else {
            User.findOne({ _id: userData.uuid }).then(
                (udata) => {
                    uid = udata;
                    next()
                }
            ).catch(
                (err) => res.send(err)
            );
        }
    }
    catch (e) {
        res.send(e);
    }
}


module.exports = {
    verifyToken,
}