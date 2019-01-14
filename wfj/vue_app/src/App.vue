<template>
 <div class="app-container">
    <router-view></router-view>
    <div class="app-nav">
		<nav class="mui-bar mui-bar-tab" @click="changeColor($event)">
			<router-link id="defaultTab" class="mui-tab-item mui-active" to="/home">
				<span class="mui-icon mui-icon-home"></span>
				<span class="mui-tab-label">首页</span>
			</router-link>
			<router-link class="mui-tab-item" to="attract" >
				<span class="mui-icon mui-icon-extra mui-icon-extra-peoples"></span>
				<span class="mui-tab-label">园区招商</span>
			</router-link>
			<router-link class="mui-tab-item" to="shop" >
				<span class="mui-icon mui-icon-extra mui-icon-extra-class"></span>
				<span class="mui-tab-label">园区商城</span>
			</router-link>
			<a class="mui-tab-item" href="Javascript:;" @click="toMember" >
				<span class="mui-icon mui-icon-contact"></span>
				<span class="mui-tab-label">会员中心</span>
			</a>
		</nav>
	</div>
 </div>
</template>
<script>
    import {Toast} from 'mint-ui'
	export default {
		data(){
			return {
				uid : sessionStorage["uid"],
				active:false,
				span:[]
				
			}
		},
		methods:{
			toMember(){
				if(this.uid == undefined){
					Toast("请先登录！");
					this.$router.push("login");
				}else{
					this.$router.push("member?uid="+this.uid);
				}
			},
			//底部切换颜色
			changeColor(e){
        var pash = this.$router.history.current.path;
				this.span = document.querySelectorAll(".app-nav .mui-bar .mui-tab-item");
        for(var item of this.span){
          item.classList.remove("mui-active");
          //console.log(this.span);
          //console.log(item)
          if(pash == "/home"){
            this.span[0].classList.add("mui-active");
            console.log(sessionStorage["uid"])
          }else if(pash == "/attract"){
            this.span[1].classList.add("mui-active");
          }else if(pash == "/shop"){
            this.span[2].classList.add("mui-active");
          }else{
            this.span[3].classList.add("mui-active");
          }
        }
			}
		},
		created() {
			//this.changeColor();
		},
	}
</script>
<style>
   .app-container{
     padding-top:40px;
     padding-bottom:50px;
     overflow-x:hidden;
   }

</style>
