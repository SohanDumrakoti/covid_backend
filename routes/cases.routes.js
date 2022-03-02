const express = require("express");
const router = express.Router();
const Case = require("../models/cases.model");

router.get('/cases', async (req, res) => {
    try {
        const cases = await Case.find({});
        res.send(cases)
    } catch (error) {
        res.send(error)
    }
});

router.get('/cases/:location', async (req, res) => {
    try {
        const news = await Case.findOne({ location: req.params.location });
        res.send(news)
    } catch (error) {
        res.send(error)
    }
});

router.post('/cases', async (req, res) => {
    const location = req.body.location;
    const total = req.body.total;
    const confirmed = req.body.confirmed;
    const recovered = req.body.recovered;
    const death = req.body.death;
    const pos_tested = req.body.pos_tested;
    const neg_tested = req.body.neg_tested;
    const isolation = req.body.isolation;
    const quarentine = req.body.quarentine;
    const tested_rtd = req.body.tested_rtd;
    const pending = req.body.pending;
    try {
        const cases = Case({
            location: location,
            total: total,
            confirmed: confirmed,
            recovered: recovered,
            death: death,
            pos_tested: pos_tested,
            neg_tested: neg_tested,
            isolation: isolation,
            quarentine: quarentine,
            tested_rtd: tested_rtd,
            pending: pending
        });
        await cases.save();
        res.send("Success");
        
    } catch (error) {
        res.send(error);
    }  
});

router.put('/news/:location', async (req, res) => {
    const location = req.body.location;
    const total = req.body.total;
    const confirmed = req.body.confirmed;
    const recovered = req.body.recovered;
    const death = req.body.death;
    const pos_tested = req.body.pos_tested;
    const neg_tested = req.body.neg_tested;
    const isolation = req.body.isolation;
    const quarentine = req.body.quarentine;
    const tested_rtd = req.body.tested_rtd;
    const pending = req.body.pending;

    try {
        await Case.updateOne(
            { location: req.params.location }, 
            { 
                $set: {
                    location: location,
            total: total,
            confirmed: confirmed,
            recovered: recovered,
            death: death,
            pos_tested: pos_tested,
            neg_tested: neg_tested,
            isolation: isolation,
            quarentine: quarentine,
            tested_rtd: tested_rtd,
            pending: pending,
                }
            },
        );
        res.send("updated");  

    } catch (error) {
        res.send(error);
    }  
});


router.delete("/cases/:location", async (req, res) => {
    try {
        await Case.deleteOne({ location: req.params.location });
    res.send("deleted");
    } catch (error) {
        res.send(error);
    }
});

module.exports = router;