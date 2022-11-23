# cisc3140quiz4 (lab3)
this repository contains the api endpoints to our database on firebase 


## the process of creating the api and installations
- Firebase login
- Firebase init
- Select functions
- Use existing
- Select cisc3140…
- Select js
- Yes
- Yes
- Cd to functions folder
- Install express -- use npm install express
- Install cors -- use npm install cors

Create admin in index.js:
- const admin = require('firebase-admin');

Import express in index.js:
- const express = require('express');

Import cors in index.js:
- const cors = require('cors');

Create main app in index.js:
- const app = express();

- export api to firebase
- exports.app = functions.https.onRequest(app);
- Generate private key in service accounts
- Copy paste: 
- var serviceAccount = require("path/to/serviceAccountKey.json");

- admin.initializeApp({
  - credential: admin.credential.cert(serviceAccount)
- });

- Drag key file into functions folder
- Rename to serviceAccountKey.json
- Change to var serviceAccount = require("./serviceAccountKey.json");
- Configure cors for sharing app.use(cors({origin: true}));

Create main route app.get('/', (req, res) => {
   - return res.status(200).send('heloo')
- });

- Open terminal, cd function folder, use npm run serve
- Copy URL into browser/postman add a new request, and send the request
- Create db reference: const db = admin.firestore();
- Create method
- In the terminal cd to the functions folder, npm run serve, copy the link 
- In postman add new requests change get/put/post/delete, alter URL as needed


## Endpoints:

### POST: http://127.0.0.1:5001/cisc3140quiz4/us-central1/app/api/create

Creates a new document entry

In the body, specify the fields and send a request

{
   "activity" : "foraging",
   "behavior" : "frantic",
   "campus_id" : "4",
   "color" : "grey",
   "highlight_color" : "black",
   "squirrel_id" :  "8"
}

Get this as a response:

{
   "status": "success",
   "msg": "data saved"
}
 
### GET (specific details -- with id): ​​http://127.0.0.1:5001/cisc3140quiz4/us-central1/app/api/get/6

Returns:

{
   - "status": "success",
   - "data": {
       - "squirrel_id": 6,
       - "behavior": "defensive",
       - "color": "grey",
       - "activity": "running",
       - "campus_id": 4,
       - "highlight_color": "cinnamon"
   }
}

### GET (all data): http://127.0.0.1:5001/cisc3140quiz4/us-central1/app/api/getAll

Returns all data
 
### PUT (update details/fields) : http://127.0.0.1:5001/cisc3140quiz4/us-central1/app/api/update/2

Put in body:

{
          "activity": "sleeping",
          "behavior": "calm",
          "campus_id": "4",
          "color": "grey",
          "highlight_color": "black",
          "squirrel_id": "8"
       }

Returns result of:

{
   "status": "success",
   "msg": "data updated"
}
 
### DELETE(by document id/entry) : http://127.0.0.1:5001/cisc3140quiz4/us-central1/app/api/delete/7

Removes the entry and eturns:

{
   "status": "success",
   "msg": "data removed"
}
 
