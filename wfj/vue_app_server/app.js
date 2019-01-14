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


//引入第三方模块:bodyParser 处理post请求
const bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({
  extended:false
}));


//绑定监听端口
app.listen(3000);





//7.1加载第三方模块 session
const session = require("express-session");
//7.2对模块进行配置
app.use(session({
  secret:"128位随机字符",   //安全字符串
  resave:false,            //请求保存
  saveUninitialized:true,    //初始化保存
  cookie:{
    maxAge:1000 * 60 * 60 * 24  //session存留的时间
  }
}))


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

//用户登录
app.get("/login",(req,res)=>{
    var uname = req.query.uname;
    var upwd = req.query.upwd;
    var sql = "select * from login where uname=? and upwd=?";
    pool.query(sql,[uname,upwd],(err,result)=>{
        if(err) throw err;
        if(result.length == 1){
            req.session.uid = result[0].uid
            //console.log(result[0].uid);
            res.send({code:1,data:result})
        }else{
            res.send({code:0,msg:"登录失败"});
        }
        
    })
})

//用户注册
app.post("/register",(req,res)=>{
    var uname = req.body.uname;
    var upwd = req.body.upwd;
    var qpwd = req.body.qpwd;
    console.log(upwd,qpwd);
    var uid = 1;
    var nextId = 0;
    if(upwd != qpwd){
        res.send({code:2,msg:"重复密码有误"})
        return;
    }
    var reg = "select uname from login where uname = ?";
    pool.query(reg,[uname],(err,result)=>{
        if(err) throw err;
        if(result.length == 1){
            res.send({code:0,msg:"用户名已存在"})
        }else{
            var sql = "insert into login(uname,upwd) values(?,?)";
            pool.query(sql,[uname,upwd],(err,result)=>{
                if(err) throw err;
                res.send({code:1,data:result,msg:"注册成功"});
            });
            var sqlUser = "insert into users(uname,upwd) values(?,?)";
            pool.query(sqlUser,[uname,upwd],(err,result)=>{
                if(err) throw err;
                
                var arr = "select * from users where uid=1";  //获取列
                console.log("users内的id:"+uid);
                var info_type = [];
                pool.query(arr,[uid],(err,result)=>{
                    if(err) throw err;
                    var count = "select uid from user_info group by uid";
                    pool.query(count,(err,res)=>{
                        if(err) throw err;
                        nextId = parseInt(res.length+1);
                    
                        var types = "select info_type,users_info from user_info where uid="+uid;
                        var sqlInfo = "";
                        pool.query(types,[uid],(errs,results)=>{
                            if(errs) throw errs;
                            for(var i = 0;i<results.length;i++){
                                info_type.push(results[i].info_type);  //保存
                                //insert into user_info(usid,uid,info_type,users_info,isShow) values(null,2,"uname","姓名",1);
                                sqlInfo += " insert into user_info(usid,uid,info_type,users_info,isShow) values(null,"+nextId+",'"+results[i].info_type+"','"+results[i].users_info+"',1);"
                            }
                            // console.log("sqlInfo结果：")
                            // console.log(sqlInfo);
                            pool.query(sqlInfo,[],(errs,result)=>{
                                if(errs) throw errs;
                                //console.log("sqlInfo结果result");
                                //console.log(result);
                            })
                        })
                    })
                    //res.send({code:1,data:result});
                });
            });
            
        }
        
    })
})



//功能一:首页轮播图
app.get("/imagelist",(req,res)=>{
    var obj = [
        { id: 1, img_url: "http://127.0.0.1:3000/img/banner1.png" },
        { id: 2, img_url: "http://127.0.0.1:3000/img/banner2.png" },
        { id: 3, img_url: "http://127.0.0.1:3000/img/banner3.png" },
        { id: 4, img_url: "http://127.0.0.1:3000/img/banner4.png" },
        { id: 5, img_url: "http://127.0.0.1:3000/img/banner5.png" },
        { id: 6, img_url: "http://127.0.0.1:3000/img/banner6.png" },
        { id: 7, img_url: "http://127.0.0.1:3000/img/banner7.png" }
    ];
    res.send(obj);
 });
 
 //园区招商图片
 app.get("/attract",(req,res)=>{
     var obj = [
        { id: 1, aid:1, title:"大型企业平台管理商城系统", price:200000, img_url: "http://127.0.0.1:3000/img/com_attract01.png" },
        { id: 2, aid:1, title:"中型企业平台管理商城系统", price:100000, img_url: "http://127.0.0.1:3000/img/com_attract02.png" },
        { id: 3, aid:1, title:"小型企业平台管理商城系统", price:50000, img_url: "http://127.0.0.1:3000/img/com_attract03.png" },
        { id: 4, aid:1, title:"微型企业平台管理商城系统", price:10000, img_url: "http://127.0.0.1:3000/img/com_attract04.png" },
        { id: 5, aid:1, title:"小微型企业平台管理商城系统", price:3500, img_url: "http://127.0.0.1:3000/img/com_attract05.png" },
        { id: 6, aid:1, title:"供应商企业平台管理商城系统", price:600, img_url: "http://127.0.0.1:3000/img/com_attract06.png" },
        { id: 7, aid:2, title:"合作创业商城业主会员", price:10000, img_url: "http://127.0.0.1:3000/img/me_attract01.png" },
        { id: 8, aid:2, title:"微分金商城业主会员", price:1680, img_url: "http://127.0.0.1:3000/img/me_attract02.png" },
        { id: 9, aid:2, title:"代理商商城业主会员", price:100, img_url: "http://127.0.0.1:3000/img/me_attract03.png" },
        { id: 10, aid:2, title:"VIP客户商城业主会员", price:10, img_url: "http://127.0.0.1:3000/img/me_attract04.png" },
     ];
     res.send(obj);
 })

 //查询所有商品
 app.get("/product",(req,res)=>{
     var sql = "select pid,title,subtitle,old_price,price,detail,(select img_url from pro_img where product.pid=pro_img.pid limit 1) as img_url from product ";
     pool.query(sql,(err,result)=>{
         if(err) throw err;
         res.send(result);
     })
 })


 //根据pid查询商品
 app.get("/showProInfo",(req,res)=>{
     var pid = req.query.pid;
    var sql = "select pid,title,subtitle,old_price,price,detail from product where pid=?";
    pool.query(sql,[pid],(err,result)=>{
        if(err) throw err;
        res.send(result);
    });

});
//根据pid查询商品对应图片
app.get("/showProImg",(req,res)=>{
    var pid = req.query.pid;
    var sql2 = "select img_url from pro_img where pid=?";
    pool.query(sql2,[pid],(err,result)=>{
        if(err) throw err;
        res.send(result);
    });
   
});

app.post("/cart",(req,res)=>{
    var uid = req.body.uid;
    var pid = req.body.pid;
    var count = parseInt(req.body.count);
    var selsql = "select count(*) as num,count from cart where uid=? and pid=?";
    pool.query(selsql,[uid,pid],(err,result)=>{
        if(err) throw err;
        if(result[0].count > 0){
            var con = result[0].count;
            count = parseInt(count+con);
            var upsql = "update cart set count=?,isPay=0,isShow=1 where uid=? and pid=? ";
            pool.query(upsql,[count,uid,pid],(err,result)=>{
                if(err) throw err;
                if(result.affectedRows > 0){
                    res.send({code:1,msg:"修改成功"});
                }else{
                    res.send({code:1,msg:"修改失败"});
                }
            })
        }else{
            var sql = "insert into cart(uid,pid,count,isPay,isShow) values(?,?,?,0,1)";
            pool.query(sql,[uid,pid,count],(err,result)=>{
                if(err) throw err;
                if(result.affectedRows > 0){
                    res.send({code:1,msg:"添加成功"});
                }else{
                    res.send({code:1,msg:"添加失败"});
                }
            })
        }
    })
})

app.get("/order",(req,res)=>{
    var uid = req.query.uid;
    var sql = "select *,(select img_url from pro_img where pid=cart.pid limit 1) img_url from cart inner join product on cart.pid = product.pid where uid=? and isPay=0 and isShow=1";
    pool.query(sql,uid,(err,result)=>{
        if(err) throw err;
        if(result.length == 0){
            res.send({code:0,msg:"购物车为空",data:result})
        }else{
            res.send({code:1,msg:"查看购物车",data:result});
        }
    })
})