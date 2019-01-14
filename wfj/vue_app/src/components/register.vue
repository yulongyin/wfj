<template>
    <div class="app-login">
        <div class="mui-bar mui-bar-nav">
			<h1 class="mui-title">用户注册</h1>
		</div>
        
        <div class="mui-card">
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <div class="login">
                        <input v-model="uname" class="uname" type="text" placeholder="请输入用户名">
                        <input v-model="upwd" class="upwd" type="password" placeholder="请输入密码">
                        <input v-model="qpwd" class="qpwd" type="password" placeholder="请输入确认密码">
                    </div>
                </div>
            </div>
        </div>
        
        <div class="mui-card">
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <div class="mui-content-padded">
                        <button type="button" @click="login" class="mui-btn mui-btn-primary mui-btn-block">立即注册</button>
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
                qpwd:"",
                uid:0
            }
        },
        methods:{
			login(){
                var uname = this.uname;
                var upwd = this.upwd;
                var qpwd = this.qpwd;
                if(upwd == qpwd){
                    var url = "http://127.0.0.1:3000/register";
                    var param = `uname=${uname}&upwd=${upwd}&qpwd=${qpwd}`;
                    this.axios.post(url,param).then(res=>{
                        console.log(res);
                        if(res.data.code == 1){
                            //console.log(this.uid);
                            Toast("注册成功");
                            this.$router.push("/login");

                        }else{
                            Toast(res.data.msg);
                            console.log(41);
                        }
                        //console.log(res);
                    })
                }else{
                    Toast("重复密码输入有误")
                }
            }
        },
		components:{
			
		}
    }
</script>
<style>
    .login{
        width:100%;
    }
    .login span{
        float:left;
        width:20%;
        vertical-align:middle;
        line-height:40px;
    }
    .login input[type=text],.login input[type=password]{
        float:left;
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