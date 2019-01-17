<template>
    <div class="app-shop">
        <header class="mui-bar mui-bar-nav">
			<h1 id="title" class="mui-title">园区商城</h1>
		</header>
        <div class="app-swipe">
            <mt-swipe :auto="3000">
                <mt-swipe-item v-for="item in list" :key="item.id">
                    <img :src="item.img_url" />
                </mt-swipe-item>
            </mt-swipe>
        </div>
        
		<div class="mui-card">
		    <ul class="mui-table-view mui-grid-view">
		        <li class="mui-table-view-cell mui-media mui-col-xs-6" v-for="item of products">
		            <a href="#">
		                <img class="mui-media-object" :src="item.img_url" @click="showInfo($event)" :data-pid="item.pid">
                    </a>
                        <div class="mui-card-content">
                            <div class="mui-card-content-inner">
                                <p style="color: #333;text-decoration:line-through;">原价：¥{{item.old_price}}</p>
                                <p style="color: #333;">现价：¥{{item.price}}</p>
                                <p style="color: #333;">{{item.title}}</p>
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
                list:[],
                products:[],
                pid:this.$route.params.pid
            }
        },
        methods:{
			getImg(){
                var url = "http://127.0.0.1:3000/imagelist";
                this.$http.get(url).then(res=>{
                    this.list = res.data;
                })
            },
            getProduct(){
                var url = "http://127.0.0.1:3000/product";
                this.$http.get(url).then(res=>{
                    this.products = res.body;
                    console.log(this.products);
                })
            },
            showInfo(e){
                e.preventDefault();
                var pid = e.target.dataset.pid;
                this.$router.push("/showProInfo?pid="+pid);
            }
        },
        created() {
            this.getImg();
            this.getProduct();
        },
		components:{
			
		}
    }
</script>
<style scoped>
    .mui-card .mui-table-view .mui-table-view-cell a img{
        height:160px;
        width:auto;
    }
    .mui-card .mui-table-view .mui-table-view-cell p{
        height:24px;
        overflow:hidden;
    }
</style>