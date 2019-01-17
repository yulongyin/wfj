<template>
    <div class="app-address">
        <header class="mui-bar mui-bar-nav">
			<a @click="previous" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" href="javascript:;"></a>
			<h1 id="title" class="mui-title">添加收货信息</h1>
		</header>
        <ul class="mui-table-view">
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right">
                    <span>收货人</span>
                    <input type="text" v-model="userName">
                </a>
            </li>
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right">
                    <span>收货地址</span>
                    <input type="text" v-model="addr">
                </a>
            </li>
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right">
                    <span>手机号</span>
                    <input type="text" v-model="phone">
                </a>
            </li>
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right">
                    <span>邮政编码</span>
                    <input type="text" v-model="zipCode">
                </a>
            </li>
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right">
                    <button type="button" @click="subAddr" class="mui-btn mui-btn-success">确认添加</button>
                </a>
            </li>
        </ul>
    </div>
</template>
<script>
    import {Toast} from 'mint-ui'
    export default {
        data(){
            return {
                uid:sessionStorage["uid"],
                userName:"",
                addr:"",
                phone:"",
                zipCode:"",
            }
        },
        methods:{
            previous(){
                history.go(-1);
            },
            //确认添加收货信息
            subAddr(){
                if(this.userName == ""){
                    Toast("请输入姓名");
                    return;
                }
                if(this.addr == ""){
                    Toast("请输入收货地址");
                    return;
                }
                if(this.phone == ""){
                    Toast("请输入手机号");
                    return;
                }
                var uid = this.uid;
                var userName = this.userName;
                var addr = this.addr;
                var phone = this.phone;
                var zipCode = this.zipCode;
                var url = "http://127.0.0.1:3000/postAddr";
                var params = `uid=${uid}&userName=${userName}&addr=${addr}&phone=${phone}&zipCode=${zipCode}`;
                this.axios.post(url,params).then(res=>{
                    console.log(res.data);
                    if(res.data.code == 1){
                        Toast(res.data.msg);
                        history.go(-1);
                    }else{
                        Toast(res.data.msg);
                    }
                })
            },
        },
        created() {

        },
    }
</script>
<style>

    .mui-table-view .mui-table-view-cell .mui-navigate-right{
        height:60px;
    }

    .mui-table-view .mui-table-view-cell .mui-navigate-right span{
        width:70px;
        display:inline-block;
        text-align:right;
        margin-right:10px;
    }
    .mui-table-view .mui-table-view-cell .mui-navigate-right input{
        width:270px;
    }
</style>