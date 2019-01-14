<template>
	<!--div class="app-nav">
		<nav class="mui-bar mui-bar-tab" @click="changeColor($event)">
			<router-link id="defaultTab" class="mui-tab-item" :class="{'mui-active':active}" to="/home">
				<span class="mui-icon mui-icon-home"></span>
				<span class="mui-tab-label">首页</span>
			</router-link>
			<router-link class="mui-tab-item" to="attract"  :class="{'mui-active':active}">
				<span class="mui-icon mui-icon-extra mui-icon-extra-peoples"></span>
				<span class="mui-tab-label">园区招商</span>
			</router-link>
			<router-link class="mui-tab-item" to="shop"  :class="{'mui-active':active}">
				<span class="mui-icon mui-icon-extra mui-icon-extra-class"></span>
				<span class="mui-tab-label">园区商城</span>
			</router-link>
			<a class="mui-tab-item" href="Javascript:;" @click="toMember" :class="{'mui-active':active}">
				<span class="mui-icon mui-icon-contact"></span>
				<span class="mui-tab-label">会员中心</span>
			</a>
		</nav>
	</div-->
</template>
<script>
	// import {Toast} from 'mint-ui'
	// export default {
	// 	data(){
	// 		return {
	// 			uid : sessionStorage["uid"],
	// 			active:false,
	// 			span:[]
				
	// 		}
	// 	},
	// 	methods:{
	// 		toMember(){
	// 			if(this.uid == undefined){
	// 				Toast("请先登录！");
	// 				this.$router.push("login");
	// 			}else{
	// 				this.$router.push("member?uid="+this.uid);
	// 			}
	// 		},
	// 		//底部切换颜色
	// 		changeColor(e){
	// 			// console.log("eeeeee");
	// 			// console.log(e);
	// 			this.span = document.querySelectorAll(".app-nav .mui-bar .mui-tab-item");
	// 			//console.log(this.span)
	// 			for(var item of this.span){
	// 				// console.log("e.target");
	// 				// console.log(e.target);
	// 				// console.log("item");
	// 				// console.log(item);
	// 				if(item == e.target){
	// 					this.active = true;
	// 				}else{
	// 					this.active = false;
	// 				}
	// 			}
	// 		}
	// 	},
	// 	created() {
	// 		//this.changeColor();
	// 	},
	// }
</script>
<style>
	
</style>