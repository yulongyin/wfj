<template>
    <div class="app-login">
        <div class="mui-bar mui-bar-nav">
			<a @click="previous" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" href="javascript:;"></a>
			<h1 class="mui-title">用户登录</h1>
		</div>
        
        <div class="mui-card">
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <div class="login">
                        <input v-model="uname" class="uname" type="text" placeholder="请输入用户名">
                        <input v-model="upwd" class="upwd" type="password" placeholder="请输入密码">
                    </div>
                </div>
            </div>
        </div>
        
        <div class="mui-card">
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <div class="mui-content-padded">
                        <ul>
                            <li><router-link to="/register">立即注册</router-link></li>
                            <li><a href="javascript:;">忘记密码</a></li>
                        </ul>
                    </div>
                    <div class="mui-content-padded">
                        <button type="button" @click="login" class="mui-btn mui-btn-primary mui-btn-block">登录</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</template>
<script>
    
    import { Toast } from 'mint-ui'
    export default {
        data() {
            return {
				uname:"",
                upwd:"",
                uid:0
            }
        },
        methods:{
            previous(){
                history.go(-1);
            },
			login(){
                var uname = this.uname;
                var upwd = this.upwd;
                //console.log(uname,upwd);
                var url = "http://127.0.0.1:3000/login?uname="+uname+"&upwd="+upwd;
                //var param = `uname=${uname}&upwd=${upwd}`;
                this.$http.get(url).then(res=>{
                    if(res.body.code == 1){
                        this.uid = res.body.data[0].uid;
                        //console.log(this.uid);
                        sessionStorage["uid"] = this.uid;
                        Toast("登录成功");
                        history.go(-1);
                    }else{
                        Toast(res.body.msg);
                    }
                    //console.log(res);
                })
            }
        },
		components:{
			
		}
    }
</script>
<style>
    .mui-card-content-inner .login{
        width:100%;
    }
    .login span{
        float:left;
        width:20%;
        vertical-align:middle;
        line-height:40px;
    }
    .login input[type=text],.login input[type=password]{
        width:100%;
    }
    .mui-card .mui-content-padded ul{
        list-style:none;
        width:80%;
        margin:0 10%;
        padding-left:0;
        line-height:30px;
        height:30px;
        padding-top:-10px;
    }
    .mui-card .mui-content-padded ul li:first-child{
        float:left;
    }
    .mui-card .mui-content-padded ul li:last-child{
        float:right;
        padding-right:20px;
    }
</style>