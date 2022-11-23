const functions = require("firebase-functions");
const admin = require('firebase-admin');
var serviceAccount = require("./serviceAccountKey.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});
const express = require('express');
const cors = require('cors');
//main app
const app = express();
app.use(cors({origin: true}));
//main db ref
const db = admin.firestore();
//routes
app.get('/', (req, res) => {
    return res.status(200).send('heloo')
});

//create post()
app.post('/api/create', (req, res) => {
    (async () => {
        try {
            await db.collection('sightings').doc(`/${Date.now()}/`).create({
                id : Date.now(),
                activity : req.body.activity,
                behavior : req.body.behavior,
                campus_id : req.body.campus_id,
                color : req.body.color,
                highlight_color : req.body.highlight_color,
                squirrel_id : req.body.squirrel_id
            });
            return res.status(200).send({status : "success", msg: "data saved"});
        } catch (error) {
            console.log(error);
            return res.status(500).send({status : "failed", msg: error});
        }
    })();
});
//get get() -- single, specific data
app.get('/api/get/:id', (req, res) => {
    (async () => {
        try {
            //load doc -- no data tho
            const reqDoc = db.collection('sightings').doc(req.params.id);
            //fetch doc
            let sighting = await reqDoc.get();
            //get data from doc
            let response = sighting.data();
            return res.status(200).send({status : "success", data: response});
        } catch (error) {
            console.log(error);
            return res.status(500).send({status : "failed", msg: error});
        }
    })();
});
//fetch all details
app.get('/api/getAll', (req, res) => {
    (async () => {
        try {
            const query = db.collection('sightings');
            let response = [];
            await query.get().then((data) => {
                let docs = data.docs;
                //read each item
                docs.map((doc) => {
                    //create the item
                    const selectedItem = {
                        activity : doc.data().activity,
                        behavior : doc.data().behavior,
                        campus_id : doc.data().campus_id,
                        color : doc.data().color,
                        highlight_color : doc.data().highlight_color,
                        squirrel_id : doc.data().squirrel_id
                    };
                    //push to array of response obj
                    response.push(selectedItem);
                });
                return response;
            });

            return res.status(200).send({status : "success", data: response});
        } catch (error) {
            console.log(error);
            return res.status(500).send({status : "failed", msg: error});
        }
    })();
});
//update by id put()
app.put('/api/update/:id', (req, res) => {
    (async () => {
        try {
            //ref to doc
            const reqDoc = db.collection('sightings').doc(req.params.id);
            await reqDoc.update({
                activity : req.body.activity,
                behavior : req.body.behavior,
                campus_id : req.body.campus_id,
                color : req.body.color,
                highlight_color : req.body.highlight_color,
                squirrel_id : req.body.squirrel_id
            });
            return res.status(200).send({status : "success", msg: "data updated"});
        } catch (error) {
            console.log(error);
            return res.status(500).send({status : "failed", msg: error});
        }
    })();
});
//delete delete()
app.delete('/api/delete/:id', (req, res) => {
    (async () => {
        try {
            //ref to doc
            const reqDoc = db.collection('sightings').doc(req.params.id);
            await reqDoc.delete();
        
            return res.status(200).send({status : "success", msg: "data removed"});
        } catch (error) {
            console.log(error);
            return res.status(500).send({status : "failed", msg: error});
        }
    })();
});
//export api to firebase 
exports.app = functions.https.onRequest(app);