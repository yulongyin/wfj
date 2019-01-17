<template>
    <div class="app-manageAddr">
        <header class="mui-bar mui-bar-nav">
			<a @click="previous" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" href="javascript:;"></a>
			<h1 id="title" class="mui-title">管理收货地址</h1>
			<a class=" mui-pull-right" href="javascript:;" @click="toAddr">添加新地址</a>
		</header>
        <div class="manageContent">
            <ul class="mui-table-view mui-table-view-chevron" v-if="addr.length > 0">
                <li class="mui-table-view-cell mui-media" v-for="item of addr">
                    <a class="mui-navigate-right" @click="manageAddr">
                        <img class="mui-media-object mui-pull-left" src="../../img/addr_01.png">
                        <div class="mui-media-body">
                            <p class='mui-ellipsis'><span class=" mui-pull-left">收货人：{{addr[0].userName}}</span><span class="phone">{{addr[0].phone}}</span></p>
                            <p class='mui-ellipsis'>{{item.addr}}</p>
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
    	
    </div>
</template>
<script>
    
    import {Toast} from 'mint-ui'
    export default {
        data(){
            return {
                list:[{uname:""}],
                uid:sessionStorage["uid"],
                addr:[]
            }
        },
        methods:{
            previous(){
                history.go(-1);
            },
            //获取收货地址
            getShopAddr(){
                var url = "shopAddr?uid="+this.uid;
                this.$http.get(url).then(res=>{
                    this.addr = res.body.data;
                    console.log(this.addr);
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
            //给还没有实现的列表添加  "建设中..."  提示
            construction(){
                Toast("建设中...")
            },
            
        },
        created() {
            this.getInfo();
            this.getShopAddr();
        },
		components:{
			
		}
    }
</script>
<style scoped>
    .mui-table-view .mui-table-view-cell .mui-navigate-right img{
        height:20px;
        width:auto;
        margin-top:35px;
    }
    .mui-table-view .mui-table-view-cell .mui-navigate-right span.phone{
        width:80px;
        float:right;
        margin-right:100px;
    }
    .app-manageAddr .mui-bar .mui-pull-right{
        line-height:44px;
        font-size:14px;
        color:#666;
    }
    .mui-table-view .mui-table-view-cell button[type=button]{
        height:40px;
    }
    .mui-table-view .mui-table-view-cell .mui-navigate-right{
        height:80px;
    }
    .mui-table-view .mui-table-view-cell .mui-navigate-right span{
        text-align:left;
    }
    .mui-table-view .mui-table-view-cell .alignCenter{
        text-align:center;
        margin-right:0;
        padding-right:0;
    }
    .app-manageAddr .manageContent .mui-table-view-chevron .mui-table-view-cell{
        padding-right:15px;
    }
</style>