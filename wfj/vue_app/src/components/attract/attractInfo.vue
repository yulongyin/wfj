<template>
    <div class="app-attract">
        <header class="mui-bar mui-bar-nav">
			<a @click="previous" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" href="javascript:;"></a>
			<h1 id="title" class="mui-title">园区招商</h1>
		</header>
        <div class="mui-card">
            <ul class="mui-table-view mui-table-view-chevron">
				<li class="mui-table-view-cell mui-media" v-for="item of attr">
					<a class="mui-navigate-right" @click="getInfoById(item.id)">
						<img class="mui-media-object mui-pull-left" :src="item.img_url">
						<div class="mui-media-body">
							<h4>{{item.title}}</h4>
							<p class='mui-ellipsis'>¥{{item.price}}元</p>
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
				uid : sessionStorage["uid"],
                attrName : sessionStorage["attrName"],
                attr:[],
                list:[]
			}
		},
		methods:{
            previous(){
                history.go(-1);
            },
            getAttrs(){
                var url = "http://127.0.0.1:3000/attract";
                this.$http.get(url).then(res=>{
                    if(this.attrName == "个人加入"){
                        this.list = res.body;
                        for(var i = 0;i < this.list.length;i++){
                            if(this.list[i].aid == 2){
                                this.attr.push(this.list[i]);
                            }
                        }
                    }else{
                        this.list = res.body;
                        for(var i = 0;i < this.list.length;i++){
                            if(this.list[i].aid == 1){
                                this.attr.push(this.list[i]);
                            }
                        }
                    }
                })
            },
            getInfoById(id){
                sessionStorage["attrId"] = id;
                this.$router.push("toBuyAttr");
            }
		},
		created() {
			this.getAttrs();
		},
		components:{
			
		}
	}
</script>
<style>
	.mui-card .mui-table-view .mui-navigate-right img{
        vertical-align: middle;
    }
</style>