<template>
    <div class="app-shop">
        <header class="mui-bar mui-bar-nav">
			<a @click="previous" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" href="javascript:;"></a>
			<h1 id="title" class="mui-title">购物车</h1>
		</header>
		<div class="mui-card">
		    <ul class="mui-table-view mui-table-view-striped mui-table-view-condensed">
		        <li class="mui-table-view-cell">
		            <div class="mui-table">
		                <div class="mui-table-cell mui-col-xs-10">
                            <ul class="mui-table-view">
                                <li class="mui-table-view-cell mui-media" v-for="item of product">
                                    <a href="javascript:;">
                                        <input class="mui-media-object mui-pull-left" type="checkbox">
                                        <img class="mui-media-object mui-pull-left" :src="item.img_url">
                                        <div class="mui-media-body">
                                            {{item.title}}
                                            <p class='mui-ellipsis'>
                                                <span>¥ {{item.price}} 元</span>
                                                <span>
                                                    <button @click="subCount($event)">-</button><input class="proCont" v-model="item.count"></input><button @click="addCount($event)">+</button>
                                                </span>
                                            </p>
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
		        <li class="mui-table-view-cell">
		            <div class="mui-table">
		                <div class="mui-table-cell mui-col-xs-10 li-bottom">
                            <ul>
                                <li><input type="checkbox" >&nbsp;全选</li>
                                <li>¥ {{price}} 元</li>
                                <li>
                                    <button type="button" class="mui-btn mui-btn-success">结算</button>
                                </li>
                            </ul>
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
                product:[],
                val:[],
                price:0
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
                    console.log(this.product);
                })
            },
            //修改商品数量
            subCount(e){
                if(e.target.nextElementSibling.value > 1){
                    e.target.nextElementSibling.value -= 1;
                }
            },
            addCount(e){
                var num =parseInt(e.target.previousElementSibling.value);
                if(num < 999){
                    num += 1;
                    e.target.previousElementSibling.value = num;
                }
            },
            //切换全选与否
            changeChecked(){
                for(var i = 0;i<this.product.length;i++){
                    
                }
            }
        },
        created() {
            this.getCartInfo();
        },
        computed:{
            getAllPrice(){
                
            }
        }
    }
</script>
<style scoped>
    
    .mui-card .mui-table-view .mui-table-view-cell .mui-table .mui-table-cell a .mui-media-body p span:last-child{
        float:right;
    }
    .mui-card .mui-table-view .mui-table-view-cell .mui-table .mui-table-cell a .mui-media-body p button{
        width:28px;
        height:28px;
        padding:0;
        vertical-align: middle;
    }


    .mui-card .mui-table-view .mui-table-view-cell .mui-table .mui-table-cell a .mui-media-body p input{
        width:26px;
        text-align:center;
        border:0;
        vertical-align: middle;
    }

    .mui-card .mui-table-view .mui-table-view-cell .mui-table .mui-table-cell.li-bottom ul{
        padding-left:15px;
    }
    .mui-card .mui-table-view .mui-table-view-cell .mui-table .mui-table-cell.li-bottom ul li{
        list-style:none;
        float:left;
        line-height:40px;
        margin-right:15px;
    }
    .mui-card .mui-table-view .mui-table-view-cell .mui-table .mui-table-cell.li-bottom ul li:last-child{
        list-style:none;
        float:right;
    }
    .mui-card .mui-table-view .mui-table-view-cell .mui-table .mui-table-cell.li-bottom ul li:last-child button{
        width:120px;
    }
    
    .mui-card .mui-table-view .mui-table-view-cell .mui-table .mui-table-cell ul input[type=checkbox]{
        width:20px;
        height:20px;
        border-radius: 10px;
        vertical-align: middle;
    }
</style>