<template>
    <div class="app-shop">
        <header class="mui-bar mui-bar-nav">
			<a @click="previous" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" href="javascript:;"></a>
			<h1 id="title" class="mui-title">购物车</h1>
		</header>
        <!--如果购物车为空-->
        <div v-if="product.length == 0">
            <div class="cart-null">
                <img src="../../img/cart.png" alt="">
                <p>购物车空空如也~~</p>
                <button @click="goToShop" class="mui-btn mui-btn-success">去逛逛</button>
            </div>
            <div class="mui-card">
                <ul class="hobby-title">
                    <li><img src="../../img/point.jpg" alt=""></li>
                    <li>猜你喜欢</li>
                    <li><img src="../../img/point.jpg" alt=""></li>
                </ul>
            </div>
            <div class="mui-card">
                <ul class="mui-table-view mui-grid-view">
                    <li class="mui-table-view-cell mui-media mui-col-xs-6" v-for="item of product">
                        <a href="#">
                            <img class="mui-media-object" :src="item.img_url" @click="showInfo($event)" :data-pid="item.pid">
                        </a>
                            <div class="mui-card-content">
                                <div class="mui-card-content-inner">
                                    <p style="color: #333;">现价：¥{{item.price}}</p>
                                    <p style="color: #333;">{{item.title}}</p>
                                </div>
                            </div>
                    </li>
                </ul> 
            </div>
        </div>
        <!--显示购物车内容-->
        <div v-else>
            <div class="mui-card">
                <ul class="mui-table-view mui-table-view-striped mui-table-view-condensed">
                    <li class="mui-table-view-cell">
                        <div class="mui-table">
                            <div class="mui-table-cell mui-col-xs-10">
                                <ul class="mui-table-view">
                                    <li class="mui-table-view-cell mui-media" v-for="item of product" :key="product.index">
                                        <a href="javascript:;">
                                            <input class="mui-media-object mui-pull-left" :checked="isChecked.indexOf(item.pid) >= 0" @click="checkedOne(item.pid)" type="checkbox">
                                            <img class="mui-media-object mui-pull-left" :src="item.img_url">
                                            <div class="mui-media-body">
                                                {{item.title}}
                                                <p class='mui-ellipsis'>
                                                    <span>¥ {{item.price}} 元</span>
                                                    <span>
                                                        <button @click="subCount($event)">-</button>
                                                        <input class="proCont" v-model="item.count" :data-count="item.count"/>
                                                        <button @click="addCount($event)">+</button>
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
                                    <li><input type="checkbox" :checked="isChecked.length == product.length" @click="checkedAll">&nbsp;全选</li>
                                    <li>¥ {{allPrice}} 元</li>
                                    <li>
                                        <button type="button" @click="orderBuy" class="mui-btn mui-btn-success">结算</button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        
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
                count:[],       //获取及保存商品的数量
                allPrice:0,
                isChecked:[],    //全选
                isCheckedAll:false,
                arr:[],          //保存商品id，根据id以及下标查询对应的商品以及价格
            }
        },
        methods:{
            previous(){
                history.go(-1);
            },
            goToShop(){
                this.$router.push("/shop");
            },
            //获取购物车数据
            getCartInfo(){
                var url = "http://127.0.0.1:3000/order?uid=" + this.uid;
                this.$http.get(url).then(res=>{
                    this.product = res.body.data;
                    for(var item of this.product){
                        this.arr.push(item.pid);
                    }
                    //console.log(this.arr);
                })
            },
            //修改商品数量
            subCount(e){
                var num =parseInt(e.target.nextElementSibling.value);
                if(num > 1){
                    num -= 1;
                    e.target.nextElementSibling.value = num;
                }
            },
            addCount(e){
                var num =parseInt(e.target.previousElementSibling.value);
                if(num < 999){
                    num += 1;
                    e.target.previousElementSibling.value = num;
                    //this.product[0].count = num;
                }
            },
            //单选
            checkedOne (pid) {
                var idIndex = this.isChecked.indexOf(pid);
                if (idIndex >= 0) {
                    // 如果已经包含了该id, 则去除(单选按钮由选中变为非选中状态)
                    this.isChecked.splice(idIndex, 1)
                    for(var i = 0;i<this.arr.length;i++){
                        if(this.arr[i] == pid){
                            this.allPrice -= this.product[i].price * this.product[i].count;
                        }
                    }
                    //this.allPrice -= this.product[pid].price * this.product[pid].count;
                } else {
                    // 选中该checkbox
                    for(var i = 0;i<this.arr.length;i++){
                        if(this.arr[i] == pid){
                            this.allPrice += this.product[i].price * this.product[i].count;
                        }
                    }
                    //this.allPrice += this.product[pid].price * this.product[pid].count;
                    this.isChecked.push(pid)
                }
            },
            //切换全选与否
            checkedAll(){
                this.isCheckedAll = !this.isCheckedAll;
                if (this.isCheckedAll) {
                    // 全选时
                    this.isChecked = []
                    this.product.forEach(function (item) {
                        this.isChecked.push(item.pid)
                    }, this)
                } else {
                    this.isChecked = []
                }
            },
            //结算按钮，跳转到结算页面
            orderBuy(){
                this.$router.push("orderBuy");
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
    .cart-null{
        width:100%;
        text-align:center;
        margin:50px auto;
    }
    .cart-null img{
        width:32%;
    }
    .cart-null p{
        margin:20px auto;
    }
    .hobby-title li{
        float:left;
        list-style:none;
        line-height:30px;
    }
    .hobby-title{
        width:90%;
        padding:0;
        margin:20px auto;
    }
    .hobby-title li img{
        width:100px;
        height:1px;
        vertical-align: middle;
        background-position:center;
    }
    .hobby-title li:nth-child(2){
        width:100px;
        text-align:center;
        vertical-align: middle;
        background-position:center;
    }
    .mui-card .mui-table-view .mui-table-view-cell p{
        height:24px;
        overflow:hidden;
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