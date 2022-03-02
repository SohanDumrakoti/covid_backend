const express = require("express");
const router = express.Router();
const News = require("../models/news.model");
const upload = require("../upload/upload");
const cloudinary = require("../cloudinary/cloudinary.config");

router.get('/news', async (req, res) => {
    try {
        const news = await News.find({});
        res.send(news)
    } catch (error) {
        res.send(error)
    }
});

router.get('/news/:id', async (req, res) => {
    const id = req.params.id;
    try {
        const news = await News.findOne({ _id: id });
        res.send(news)
    } catch (error) {
        res.send(error)
    }
});

router.post('/news', upload.single('image'), async (req, res) => {
    const title = req.body.title;
    const image = req.file.path;
    const summary = req.body.summary;
    
    try {
        const result = await cloudinary.uploader.upload(image);
        const news = News({
            title: title,
            summary: summary,
            imageUrl: result.secure_url,
        });
        await news.save();
        res.send("Success");
        
    } catch (error) {
        res.send(error);
    }  
});

router.put('/news/:id', async (req, res) => {
    const title = req.body.title;
    const summary = req.file.summary;
    const id = req.params.id;
    try {
        await Profile.updateOne(
            { _id: id }, 
            { 
                $set: {
                    title: title,
                    summary:  summary 
                }
            },
        );
        res.send("updated");  

    } catch (error) {
        res.send(error);
    }  
});

router.put('/news/:id/image',  upload.single('image'), async (req, res) => {
    const image = req.file.path;
    const id = req.params.id;
    try {
        const result = await cloudinary.uploader.upload(image);
        await News.updateOne(
            { _id: id }, 
            { 
                $set: {
                    imageUrl: result.secure_url,
                }
            },
        );
        res.send("updated");
    } catch (error) {
        res.send(error);
    }  
});

router.delete("/news/:id", async (req, res) => {
    try {
        await News.deleteOne({ _id: req.params.id });
    res.send("deleted");
    } catch (error) {
        res.send(error);
    }
});

module.exports = router;