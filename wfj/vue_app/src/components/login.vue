<template>
    <div class="app-login">
        <div class="mui-bar mui-bar-nav">
			<h1 class="mui-title">用户登录</h1>
		</div>
        
        <div class="mui-card">
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <div class="login">
                        <span>账号：</span><input class="uname" type="text" placeholder="请输入用户名或邮箱">
                        <span>密码：</span><input class="upwd" type="password" placeholder="请输入密码">
                    </div>
                </div>
            </div>
        </div>
        
        <div class="mui-card">
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <div class="mui-content-padded">
                        <button type="button" class="mui-btn mui-btn-primary mui-btn-block">登录</button>
                    </div>
                </div>
            </div>
        </div>

        <footers></footers>
    </div>
</template>
<script>
    import footers from '@/components/tabbar/footer_nav.vue'
    export default {
        data() {
            return {
				
            }
        },
        methods:{
			
        },
		components:{
			footers
		}
    }
</script>
<style>
    .login{
        width:90%;
        margin:0 5%;
    }
    .login span{
        float:left;
        width:20%;
        vertical-align:middle;
        line-height:40px;
    }
    .login input[type=text],.login input[type=password]{
        float:left;
        width:80%;
    }
</style>