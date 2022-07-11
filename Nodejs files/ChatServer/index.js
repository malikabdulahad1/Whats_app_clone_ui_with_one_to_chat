const express = require("express");
var http = require("http");
const cors = require("cors");
const app = express();
const port = process.env.port || 5000;
var server = http.createServer(app);
var io = require("socket.io")(server, {
    cors:
    {
        origin:'*'
    }
});

//middlewre

app.use(express.json());
var clients ={};
app.use(cors());

io.on('connection', (socket)=>{
    console.log('connected');
    console.log(socket.id, "has joined");
    socket.on("signin",(id)=>[
        console.log(id),
        clients[id]= socket,
        console.log(clients),

    ])

    socket.on("message", (msg)=>{
        console.log(msg);
        let targetId=msg.targetId;
        if (clients[targetId]) {
            
            clients[targetId].cmit("message", msg);  
        }
    })
});

server.listen(port, "0.0.0.0", ()=>{
    console.log('server started');
})
 