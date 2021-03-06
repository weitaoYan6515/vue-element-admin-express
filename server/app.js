const express = require('express')
const app = express()
const expressJwt = require('express-jwt')
const bodyParser = require('body-parser')
const userRouter = require('./router/user')
const roleRouter = require('./router/role')
const menuRouter = require('./router/menu')
const logRouter = require('./router/user-log')

const cors = require("cors");//跨域
app.use(cors({
  "origin": "*",
  "methods": "GET,HEAD,PUT,PATCH,POST,DELETE",
  "preflightContinue": false,
  "optionsSuccessStatus": 204
}))
app.use(expressJwt({
  secret: 'bigfool.cn' // 签名的密钥 或 PublicKey
}).unless({
  path: ['/user/login'] // 指定路径不经过 Token 解析
}))

app.use(bodyParser.urlencoded({
  extends: false
}))

app.use(bodyParser.json())


app.use(function(err, req, res, next) {
  if (err.name === 'UnauthorizedError') {
    res.status(401).send('token已失效')
  } else {
    res.status(500).send('服务器错误')
  }
})

//  使用路由 / 是路由指向名称
app.use('/user', userRouter)
app.use('/user-log', logRouter)
app.use('/role', roleRouter)
app.use('/menu', menuRouter)

// 配置服务端口
const port = 3000
const hostname = 'localhost'
/* app.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`)
}) */
app.listen(port, () => {
  console.log(`Server running at http://${hostname}:${port}/`)
})

