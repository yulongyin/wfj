<template>
    <div class="app-member">
        <header class="mui-bar mui-bar-nav">
			<a @click="previous" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" href="javascript:;"></a>
			<h1 id="title" class="mui-title">确认订单</h1>
		</header>
        <ul class="mui-table-view mui-table-view-striped mui-table-view-condensed">
            <li class="mui-table-view-cell">
                <div class="mui-slider-cell">
                    <div class="oa-contact-cell mui-table">
                        <div class="oa-contact-avatar mui-table-cell">
                            <img src="../../img/huiyuan_01.png" />
                        </div>
                        <div class="oa-contact-content mui-table-cell">
                            <div class="mui-clearfix">
                                <h4 class="oa-contact-name">{{list[0].user_name==""?list[0].uname:list[0].user_name}}</h4>
                                <span class="oa-contact-position mui-h6">会员</span>
                            </div>
                            <p class="oa-contact-email mui-h6">
                                {{list[0].uname}}@sina.com
                            </p>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        <div>
            <ul class="mui-table-view mui-table-view-chevron" v-if="addr.length > 0">
                <li class="mui-table-view-cell mui-media">
                    <a class="mui-navigate-right" @click="manageAddr">
                        <img class="mui-media-object mui-pull-left" src="../../img/addr_01.png">
                        <div class="mui-media-body">
                            <p class='mui-ellipsis'><span class=" mui-pull-left">收货人：{{addr[0].userName}}</span><span class="phone">{{addr[0].phone}}</span></p>
                            <p class='mui-ellipsis'>{{addr[0].addr}}</p>
                        </div>
                    </a>
                </li>
            </ul>
            
            <ul class="mui-table-view mui-table-view-chevron" v-else>
                <li class="mui-table-view-cell mui-media">
                    <a class="mui-navigate-right">
                        <div class="mui-media-body">
                            <img class="mui-media-object mui-pull-left" src="../../img/addr_01.png">
                            <p class='mui-ellipsis'>
                                <button type="button" @click="toAddr" class="mui-btn mui-btn-success">添加收货地址</button>
                            </p>
                        </div>
                    </a>
                </li>
            </ul>
        </div>

    	<div class="mui-card">
            <ul class="mui-table-view mui-table-view-striped mui-table-view-condensed">
                <li class="mui-table-view-cell">
                    <div class="mui-table">
                        <div class="mui-table-cell mui-col-xs-10">
                            <ul class="mui-table-view">
                                <li class="mui-table-view-cell mui-media" v-for="item of product" :key="product.index">
                                    <a href="javascript:;">
                                        <img class="mui-media-object mui-pull-left" :src="item.img_url">
                                        <div class="mui-media-body">
                                            <p class="pro_title">{{item.title}}</p>
                                            <p class="pro_subtitle">{{item.subtitle}}</p>
                                            <p class='mui-ellipsis'>
                                                <span style="color:red;">¥ {{item.price}} 元</span>
                                                <span>
                                                    x<input class="proCont" v-model="item.count" :data-count="item.count"/>
                                                </span>
                                            </p>
                                        </div>
                                        <div style="margin:20px 0;">
                                            <span class="right_info">共{{item.count}}件商品&nbsp;&nbsp;小计:<span style="color:red;">¥{{item.price*item.count}}</span></span>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </div>


    	<div class="mui-card">
            <ul class="mui-table-view mui-table-view-striped mui-table-view-condensed">
                <li class="mui-content-padded navigate_right">
                    合计：<span style="color:red;">¥{{total}}</span>&nbsp;&nbsp;&nbsp;<button type="button" class="mui-btn mui-btn-danger">提交订单</button>
                </li>
            </ul>
        </div>


    </div>
</template>
<script>
    
    import {Toast} from 'mint-ui'
    export default {
        data(){
            return {
                list:[{uname:""}],
                uid:sessionStorage["uid"],
                addr:[],
                product:[],
                isChecked:[],    //全选
                arr:[],
                total:0
            }
        },
        methods:{
            previous(){
                history.go(-1);
            },
            //获取购物车数据
            getCartInfo(){
                var url = "http://127.0.0.1:3000/order?uid=" + this.uid;
                this.$http.get(url).then(res=>{
                    this.product = res.body.data;
                    for(var item of this.product){
                        this.arr.push(item.pid);
                        //获取总价
                        this.total += item.price * item.count;
                    }
                })
            },
            //获取收货地址
            getShopAddr(){
                var url = "shopAddr?uid="+this.uid;
                this.$http.get(url).then(res=>{
                    this.addr = res.body.data;
                    //console.log(this.addr);
                })
            },
            //跳转到添加收货地址页面，添加收货信息
            toAddr(){
                this.$router.push("addAddress");
            },
            getInfo(){
                var url = "member?uid="+this.uid;
                this.$http.get(url).then(result=>{
                    this.list = result.body;
                    //console.log(this.list);
                });
            },
            //跳转到管理收货地址页面
            manageAddr(){
                this.$router.push("manageAddr");
            },
        },
        created() {
            this.getInfo();
            this.getShopAddr();
            this.getCartInfo();
        },
		components:{
			
		}
    }
</script>
<style scoped>
    .mui-card .mui-table-view .navigate_right{
        float:right;
        line-height:33px;
    }
    .mui-table-view .mui-table-view-cell div .right_info{
        float:right;
    }
    .mui-table-view .mui-table-view-cell .mui-navigate-right img{
        height:20px;
        width:auto;
        margin-top:35px;
    }
    .mui-card .mui-table-view .mui-table-view-cell .mui-table .mui-table-cell a .mui-media-body{
        width:200px;
        white-space:pre-wrap;
    }
    .mui-card .mui-table-view .mui-table-view-cell .mui-table .mui-table-cell a .mui-media-body p input{
        width:26px;
        text-align:center;
        border:0;
        vertical-align: middle;
    }
    .mui-card .mui-table-view .mui-table-view-cell .mui-table .mui-table-cell a .mui-media-body p .pro_title{
        height:48px;
        line-height:24px;
        overflow:hidden;
    }
    .mui-card .mui-table-view .mui-table-view-cell .mui-table .mui-table-cell a .mui-media-body p .pro_subtitle{
        height:48px;
        line-height:24px;
    }
    .mui-card .mui-table-view .mui-table-view-cell a img.mui-media-object{
        width:80px;
        max-width:100px;
        height:auto
    }
    .mui-table-view .mui-table-view-cell button[type=button]{
        height:40px;
    }
    .mui-table-view .mui-table-view-cell .mui-navigate-right{
        height:80px;
    }
    
    .mui-table-view .mui-table-view-cell .mui-navigate-right:after{
        right:15px;
        content:'\e583';
    }
    .mui-table-view .mui-table-view-cell .mui-navigate-right span.phone{
        width:80px;
        float:right;
    }
    .mui-card .mui-table-view .mui-table-view-cell .mui-table .mui-table-cell a .mui-media-body p span:last-child{
        float:right;
    }
    .mui-card .mui-table-view .mui-table-view-cell .mui-table .mui-table-cell a .mui-media-body p button{
        width:28px;
        height:28px;
        padding:0;
        vertical-align: middle;
    }

    .mui-card .mui-table-view .mui-table-view-cell .mui-table .mui-table-cell ul input[type=checkbox]{
        width:20px;
        height:20px;
        border-radius: 10px;
        vertical-align: middle;
    }
</style>