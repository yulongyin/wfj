<template>
	<div class="app-home">
		<div class="mui-bar mui-bar-nav">
			<h1 class="mui-title">中联园区首页</h1>
		</div>
        <div class="app-swipe">
            <mt-swipe :auto="3000">
                <mt-swipe-item v-for="item in list" :key="item.id">
                    <img :src="item.img_url" />
                </mt-swipe-item>
            </mt-swipe>
        </div>
        <div class="app-content">
            <h4>5L5C中联园区微分金隶属于北京天太世统科技有限公司运营</h4>
            <span>目前，5L5C中联园区微分金（简称：中联园区）的手机各版、电脑版还在持续优化众。系统全方位从企业管理到移动互联网应用为 各企业节约成本，增加销售利润；公司目标是“打造中国互联网大数据管理电子商务平台第一品牌”，通过帮助企业实现管理新标准的基础上，完善平台股权激励方 案，完成共享资源共享金的梦想，进一步把五层五清企业管理新标准推广到学校，为实现伟大的中国梦添砖加瓦，尽到企业公民的神圣职责和使命！</span>
        </div>
	</div>
</template>
<script>
    
    export default {
        data() {
            return {
                list:[]
            }
        },
        methods:{
			getImg(){
                var url = "http://127.0.0.1:3000/imagelist";
                this.$http.get(url).then(res=>{
                    //console.log(res);
                    this.list = res.data;
                })
            }
        },
        created() {
            this.getImg();
        },
		components:{
			
		}
    }
</script>
<style>
  .app-swipe .mint-swipe{ height:120px}
  .app-swipe .mint-swipe img{width:100%;height:120px;}
  .app-content{width:90%;margin:20px auto;}
  .app-content h4{text-align:center;line-height:30px;}
  .app-content span{line-height:26px;text-indent:2em;display:block;}
</style>