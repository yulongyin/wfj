<template>
    <div class="app-member">
        <header class="mui-bar mui-bar-nav">
			<h1 id="title" class="mui-title">会员中心</h1>
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
                                <h4 class="oa-contact-name">{{list[0].uname}}</h4>
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
        <ul class="mui-table-view">
            <li class="mui-table-view-cell"  v-for="item in list">
                <router-link class="mui-navigate-right" :to="'/perfect?uid='+item.uid">
                    <img src="../../img/vip_data_01.png" alt="">
                    完善会员资料
                </router-link>
            </li>
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right" @click="construction">
                    <img src="../../img/vip_data_02.png" alt="">
                    人脉资源
                </a>
            </li>
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right" @click="order">
                    <img src="../../img/vip_data_03.png" alt="">
                    订单管理
                </a>
            </li>
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right" @click="construction">
                    <img src="../../img/vip_data_05.png" alt="">
                    我的钱包
                </a>
            </li>
            <li class="mui-table-view-cell" @click="construction">
                <a class="mui-navigate-right">
                    <img src="../../img/vip_data_06.png" alt="">
                    金币池
                </a>
            </li>
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right" @click="construction">
                    <img src="../../img/vip_data_07.png" alt="">
                    分享产品
                </a>
            </li>
        </ul>
        <div class="mui-card">
		    <div class="mui-content-padded">
		        <button type="button" @click="logout" class="mui-btn mui-btn-danger mui-btn-block">注销</button>
		    </div>
        </div>
    	
    </div>
</template>
<script>
    
    import {Toast} from 'mint-ui'
    export default {
        data(){
            return {
                list:[{uname:""}],
                uid:sessionStorage["uid"]
                
            }
        },
        methods:{
            getInfo(){
                var url = "member?uid="+this.uid;
                this.$http.get(url).then(result=>{
                    this.list = result.body;
                    //console.log(this.list);
                });
            },
            //给还没有实现的列表添加  "建设中..."  提示
            construction(){
                Toast("建设中...")
            },
            logout(){
                sessionStorage.removeItem("uid");
                Toast("注销成功");
                this.$router.push("/");
            },
            //订单管理
            order(){
                var url = "http://127.0.0.1:3000/order?uid="+this.uid;
                this.$http.get(url).then(res=>{
                    this.$router.push("/order");
                });
            }
        },
        created() {
            this.getInfo();
        },
		components:{
			
		}
    }
</script>
<style>
        html,body {
            background-color: #efeff4;
        }
        .title{
            margin: 20px 15px 10px;
            color: #6d6d72;
            font-size: 15px;
        }
        .oa-contact-cell.mui-table .mui-table-cell {
        padding: 11px 0;
        vertical-align: middle;
        }
        
        .oa-contact-cell {
            position: relative;
            margin: -11px 0;
        }

        .oa-contact-avatar {
            width: 75px;
        }
        .oa-contact-avatar img {
            border-radius: 50%;
            width:60px;
        }
        .oa-contact-content {
            width: 100%;
        }
        .oa-contact-name {
            margin-right: 20px;
        }
        .oa-contact-name, oa-contact-position {
            float: left;
        }
        .mui-table-view .mui-table-view-cell .mui-navigate-right{
            line-height:40px;
        }
        .mui-table-view .mui-table-view-cell .mui-navigate-right img{
            width:40px;
            vertical-align: middle;
        }
</style>