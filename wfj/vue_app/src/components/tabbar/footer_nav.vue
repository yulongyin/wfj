<template>
	<div class="app-nav">
		<nav class="mui-bar mui-bar-tab">
			<router-link id="defaultTab" class="mui-tab-item mui-active" to="/">
				<span class="mui-icon mui-icon-home"></span>
				<span class="mui-tab-label">首页</span>
			</router-link>
			<a class="mui-tab-item" href="Javascript:;">
				<span class="mui-icon mui-icon-extra mui-icon-extra-peoples"></span>
				<span class="mui-tab-label">园区招商</span>
			</a>
			<a class="mui-tab-item" href="Javascript:;">
				<span class="mui-icon mui-icon-extra mui-icon-extra-cart"><span class="mui-badge">0</span></span>
				<span class="mui-tab-label">购物车</span>
			</a>
			<router-link class="mui-tab-item" to="/login">
				<span class="mui-icon mui-icon-contact"></span>
				<span class="mui-tab-label">会员中心</span>
			</router-link>
		</nav>
	</div>
</template>
<script>
	import {Toast} from 'mint-ui'
	export default {
		data(){
			uid : this.$route.query.uid
		},
		methods:{
			toMember(){
				if(this.uid == undefined){
					Toast("请先登录！");
					this.$router.push("login");
				}else{
					this.$router.push("member?uid="+this.uid);
				}
			}
		},
		created() {
			
		},
	}
</script>
<style>
	
</style>