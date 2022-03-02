const mongoose = require("mongoose");

const caseSchema = new mongoose.Schema({
    location : {
        type: String,
        required: true,
    },
    total: {
        type: String,
        required: true,
    },
    confirmed: {
        type: String,
        required: true,
    },
    recovered: {
        type: String,
        required: true,
    },
    death: {
        type: String,
        required: true,
    },
    pos_tested: {
        type: String,
        required: true,
    },
    neg_tested: {
        type: String,
        required: true,
    },
    isolation: {
        type: String,
        required: true,
    },
    quarentine: {
        type: String,
        required: true,
    },
    tested_rtd: {
        type: String,
        required: true,
    },
    pending: {
        type: String,
        required: true,
    }
}, {
    timestamps: true,
});

module.exports = mongoose.model("case", caseSchema);