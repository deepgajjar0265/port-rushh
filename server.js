const express = require("express");
const app = express();
const PORT = 3000;

app.use(express.json());
app.use(require("cors")());

let portData = [];

app.post("/api/ports", (req, res) => {
    portData = req.body;
    console.log("Received data:", portData.length);
    res.send({ status: "ok" });
});

app.get("/api/ports", (req, res) => {
    res.json(portData);
});

app.listen(PORT, () => console.log(`Server running on ${PORT}`));