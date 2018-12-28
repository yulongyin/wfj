//加载模块
const express = require("express");
const pool = require("./pool");
//创建express对象
var app = express();

//服务器node.js 允许跨域访问配置项
//引入跨域模块
const cors = require("cors");
//配置允许哪个程序跨域访问---脚手架
app.use(cors({
    origin:["http://127.0.0.1:3001","localhost:3001"],
    credentials:true
}));
//指定静态目录`
// __dirname 当前文件的绝对路径
app.use(express.static(__dirname + "/public"));
//绑定监听端口
app.listen(3000);



//个人名片
app.get("/member",(req,res)=>{
    var uid = req.query.uid;
    //console.log(req.query);
    //console.log(uid);
    var sql = "select uid,uname,sex,birthday,addr,cards,phone,wechat,user_name,upwd,job_addr,position,email,education,record,situation,political from users where uid=?";
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err;
        res.send(result);
    });
});

//
app.get("/perfect",(req,res)=>{
    var uid = req.query.uid;
    var arr = "SELECT info_type FROM user_info where isShow = 1 and uid=?";
    
    pool.query(arr,[uid],(err,result)=>{
        if(err) throw err;
        var sql = "";
        sql += "select ";
        for(var i = 0;i < result.length;i++){
            sql += `${result[i].info_type}`;
            if(i < result.length-1){
                sql += ", ";
            }
        }
        sql += " from users where uid = ?";
        //console.log(sql);
        pool.query(sql,[uid],(err,result)=>{
            if(err) throw err;
            res.send(result);
        })
    });
});

//
app.get("/getType",(req,res)=>{
    var uid = req.query.uid;
    var sql = "SELECT * FROM user_info where isShow = 1 and uid=?";
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err;
        res.send(result);
    });
});

//修改用户信息
app.get("/update",(req,res)=>{

    //console.log(req.query);
    var obj = req.query;
    var sql = "";
    var arr = [];   //属性
    var val = [];   //值
    var uid = req.query.uid;
    var arrs = "SELECT info_type FROM user_info where isShow = 1 and uid=?";
    for(var item in obj){
        val.push(obj[item]);
    }
    pool.query(arrs,[uid],(err,result)=>{
        if(err) throw err;
        //console.log(result);
        sql += "update users set ";
        //console.log(arr);
        for(var i = 0;i < result.length;i++){
            arr.push(result[i].info_type);
            //arr[i] =  req.query[i];
            sql += `${result[i].info_type}=?`;
            if(i < result.length-1){
                sql += ",";
            }
        }
        sql += " where uid = ?";
        val.push(uid)
        for(var i = 0;i < val.length;i++){
            if(val[i].trim() == null){
                val[i] = "";
            }
        }
        pool.query(sql,val,(err,result)=>{
            if(err) throw err;
            if(result.affectedRows > 0){
                res.send({code:1,msg:"修改成功！",data:result});
            }else{
                res.send({code:0,msg:"修改失败！"});
            }
        })
    });

})

//显示用户所有资料，根据是否显示确定颜色的不同
app.get("/showAllInfo",(req,res)=>{
    var uid = req.query.uid;
    var sql = "select users_info,isShow from user_info where uid=?";
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
});

//根据用户选择，是否显示资料，确认修改资料的显示列
app.get("/updateInfo",(req,res)=>{
    var uid = req.query.uid;
    var isShow = req.query.isShow;
    var users_info = req.query.users_info;
    var sql = "update user_info set isShow=? where uid=? and users_info=?";
    pool.query(sql,[isShow,uid,users_info],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows > 0){
            res.send({code:1,msg:"修改成功！"});
        }else{
            res.send({code:0,msg:"修改失败！"});
        }
    })
})






