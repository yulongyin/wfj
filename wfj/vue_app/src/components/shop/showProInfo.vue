<template>
    <div class="app-shop">
        <header class="mui-bar mui-bar-nav">
			<a @click="previous" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" href="javascript:;"></a>
			<h1 id="title" class="mui-title">商品详情</h1>
		</header>
        <div class="app-swipe">
            <mt-swipe :auto="300000">
                <mt-swipe-item v-for="item in list" :key="item.id">
                    <img :src="item.img_url" />
                </mt-swipe-item>
            </mt-swipe>
        </div>
        
		<div class="mui-card">
		    <ul class="mui-table-view mui-table-view-striped mui-table-view-condensed">
		        <li class="mui-table-view-cell">
		            <div class="mui-table">
		                <div class="mui-table-cell mui-col-xs-10" v-for="item of proInfo">
		                    <h4 class="mui-ellipsis">原价：¥ {{item.price}} 元</h4>
		                    <h3 class="mui-ellipsis">现价：¥ {{item.price}} 元</h3>
                            <h5>数量：<button @click="subCount">-</button><input class="proCont" v-model="val"></input><button @click="addCount">+</button></h5>
		                    <h5>{{item.subtitle}}</h5>
		                    <h5>{{item.title}}</h5>
		                </div>
		            </div>
		        </li>
            </ul>
		</div>
        
		<div class="mui-card">
		    <ul class="mui-table-view mui-table-view-striped mui-table-view-condensed">
		        <li class="mui-table-view-cell">
		            <div class="mui-table">
		                <div class="mui-table-cell mui-col-xs-10">
                            <h5>商品详情：</h5>
                            <li v-for="item of details">
		                        <h5>{{item}}</h5>
                            </li>
		                </div>
		            </div>
		        </li>
            </ul>
		</div>
    	
        
		<div class="mui-card">
		    <ul class="mui-table-view mui-table-view-striped mui-table-view-condensed">
		        <li class="mui-table-view-cell">
		            <div class="mui-table">
		                <div class="mui-table-cell mui-col-xs-10 li-bottom">
                            <li>
                                <button type="button" class="mui-btn" @click="construction">
					                <span class="mui-icon-extra mui-icon-extra-custom"></span>
                                    <p>客服</p>
                                </button>
                            </li>
                            <li>
                                <button type="button" class="mui-btn" @click="construction">
					                <span class="mui-icon-extra mui-icon-extra-rank"></span>
                                    <p>店铺</p>
                                </button>
                            </li>
                            <li>
                                <button type="button" @click="addCart" class="mui-btn mui-btn-warning">
                                    加入购物车
                                </button>
                            </li>
                            <li>
                                <button type="button" class="mui-btn mui-btn-danger">
                                    立即购买
                                </button>
                            </li>
		                </div>
		            </div>
		        </li>
            </ul>
		</div>


    </div>
</template>
<script>
    
    import {Toast} from 'mint-ui'
    export default {
        data (){
            return {
                uid:sessionStorage["uid"],
                list:[],
                pid:this.$route.query.pid,
                proInfo:[],
                details:[],
                val:1
            }
        },
        methods:{
            previous(){
                history.go(-1);
            },
			getProImg(){
                var url = "http://127.0.0.1:3000/showProImg?pid="+this.pid;
                this.$http.get(url).then(res=>{
                    this.list = res.data;
                    //console.log(this.list)
                })
            },
			getProInfo(){
                var url = "http://127.0.0.1:3000/showProInfo?pid="+this.pid;
                this.$http.get(url).then(res=>{
                    this.proInfo = res.data;
                    //console.log(this.proInfo)
                    this.details = this.proInfo[0].detail.split(" ");
                    //console.log(this.details);
                })
            },
            construction(){
                Toast("建设中...")
            },
            //修改商品数量
            subCount(){
                if(this.val > 1){
                    this.val -= 1;
                }
            },
            addCount(){
                if(this.val < 999){
                    this.val += 1;
                }
            },
            //加入购物车
            addCart(){
                if(this.uid == undefined){
                    Toast("请先登录");
                    this.$router.push("/login");
                    return;
                }
                //console.log(this.uid,this.pid,this.val);
                var url = "http://127.0.0.1:3000/cart";
                var param = `uid=${this.uid}&pid=${this.pid}&count=${this.val}`;
                this.axios.post(url,param).then(res=>{
                    //console.log(res);
                    Toast(res.data.msg);
                });
            },
            //立即购买
            buyNow(){
                if(this.uid == undefined){
                    Toast("请先登录");
                    this.$router.push("/login");
                    return;
                }
                console.log(this.uid,this.pid,this.val);
                var url = "http://127.0.0.1:3000/cart";
                var param = `uid=${this.uid}&pid=${this.pid}&count=${this.val}`;
                this.axios.post(url,param).then(res=>{
                    if(res.data.code == 1){
                        this.$router.push("/order");
                    }
                });
            }
        },
        created() {
            this.getProImg();
            this.getProInfo();
        },
		components:{
			
		}
    }
</script>
<style scoped>
    .app-swipe .mint-swipe{
        height:300px;
    }
    .app-swipe .mint-swipe .mint-swipe-items-wrap .mint-swipe-item img{
        height:300px;
        width:100%;
    }
    .app-swipe .mint-swipe .mint-swipe-items-wrap .mint-swipe-item{
        height:300px;
        width:auto;
    }
    .mui-card .mui-table-view .mui-table-view-cell p{
        height:24px;
        overflow:hidden;
    }
    .mui-card .mui-table-view .mui-table-view-cell .mui-table .mui-table-cell h4{
        color:red;
        text-decoration:line-through;
    }
    .mui-card .mui-table-view .mui-table-view-cell .mui-table .mui-table-cell h3{
        color:red;
    }
    .mui-card .mui-table-view .mui-table-view-cell .mui-table .mui-table-cell h5{
        color:#000;
        font-weight:bold;
        line-height:22px;
    }
    
    .mui-card .mui-table-view .mui-table-view-cell .mui-table .mui-table-cell h5 button{
        color:#000;
        line-height:22px;
        width:26px;
        height:26px;
        text-align:center;
        line-height:22px;
        padding:0;
    }
    
    .mui-card .mui-table-view .mui-table-view-cell .mui-table .mui-table-cell h5 .proCont{
        color:#000;
        width:26px;
        text-align:center;
        line-height:22px;
        display:inline-block;
        box-sizing:border-box;
        border:0;
        margin:0 4px;
    }

    .mui-card .mui-table-view .mui-table-view-cell .mui-table .li-bottom li{
        float:left;
        text-align:center;
    }
    .mui-card .mui-table-view .mui-table-view-cell .mui-table .li-bottom li button{
        margin:0 4px;
        height:54px;
    }
    .mui-card .mui-table-view .mui-table-view-cell .mui-table .li-bottom li button p{
        height:20px;
    }
    
    
</style>