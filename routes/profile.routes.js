const express = require("express");
const router = express.Router();
const Profile = require("../models/profile.model");
const { verifyToken } = require("../middlewares");
const upload = require("../upload/upload");
const cloudinary = require("../cloudinary/cloudinary.config");

router.get('/profile', verifyToken, async (req, res) => {
    try {
        const profiles = await Profile.findOne({ user: uid });
        if(profiles == null){
            res.status(200).send({
                message: "No Profile"
            });
        }
        else {
            res.send(profiles);
        }
    } catch (error) {
        res.send(error)
    }
});

router.post('/profile', [verifyToken, upload.single('avtar')], async (req, res) => {
    const fullname = req.body.fullname;
    const bio = req.body.bio;
    const avtar = req.file.path;
    const address = req.body.address;
    
    try {
        const prof = await Profile.findOne({ user: uuid._id });
    if (prof === null) {
        const result = await cloudinary.uploader.upload(avtar);

        const profile = Profile({
            user: uuid._id,
            fullname: fullname,
            bio: bio,
            avtar: result.secure_url,
            address: address,
        });
        await profile.save();
        res.send("Success")
    }
    else {
        res.send("profile already exists");
    }
        
    } catch (error) {
        res.send(error);
    }  
});

router.put('/profile', verifyToken, async (req, res) => {
    const fullname = req.body.fullname;
    const bio = req.body.bio;
    const address = req.body.address;
    try {
        await Profile.updateOne(
            { user: uuid._id }, 
            { 
                $set: {
                    fullname: (fullname != null) ? fullname : this.fullname,
                    bio: (bio != null) ? bio : this.bio,
                    address: (address != null) ? address : this.addreess
                }
            },
        );
        res.send("updated");  

    } catch (error) {
        res.send(error);
    }  
});

router.put('/profile/image', [verifyToken, upload.single('avtar')], async (req, res) => {
    const avtar = req.file.path;
    try {
        const result = await cloudinary.uploader.upload(avtar);
        await Profile.updateOne(
            { user: uuid._id }, 
            { 
                $set: {
                    avtar: result.secure_url,
                    avtar_id: result.public_id,
                }
            },
        );
        res.send("updated");
    } catch (error) {
        res.send(error);
    }  
});

router.delete("/profile", [verifyToken], async (req, res) => {
    try {
        await Profile.deleteOne({ user: uuid });
    res.send("deleted");
    } catch (error) {
        res.send(error);
    }
});

module.exports = router;