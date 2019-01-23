<template>
    <div class="app-attract">
        <header class="mui-bar mui-bar-nav">
			<a @click="previous" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" href="javascript:;"></a>
			<h1 id="title" class="mui-title">5层5清管理体系</h1>
		</header>
        <div class="app-swipe">
            <mt-swipe :auto="3000">
                <mt-swipe-item v-for="item in list" :key="item.id">
                    <img :src="item.img_url" />
                </mt-swipe-item>
            </mt-swipe>
        </div>
        <div class="mui-card">
			<img class="mui-media-object mui-pull-left" src="../../img/manage_system.png">
        </div>
        <div class="mui-card">
            <div class="max-width">
                <h4>5L5C系统平台介绍</h4>
                <div>5L5C是由北京天太世统科技有限公司研发的，集管理系统、电子商务平台系统、咨询培训系统、赢利模式系统等为一体的大数据平台，即5L5C大数据（中联园区）+5L5C管理系统（人事系统、办公系统、财务系统、生产系统、营销系统等）+网络推广（电子商务平台系统、微分金、微信平台、电子商务资源平台、线上线下博览、5L5C管理咨询培训系统、资源赢利系统模式等），5L5C强大的管理后端，完成电子商务从进货、送货、销售、赢利等的系列流程，打造中国互联网大数据管理电子商务资源平台第一品牌！</div>
            </div>
        </div>
        <div class="mui-card">
            <div class="max-width">
                <h4>5L5C系统平台优势</h4>
                <div>它的好处优势是，在帮助企业实现管理新标准的基础上，完善平台股权激励机制方案，使各加盟商与有贡献的员工实现股权致富，实现共享资源共享金的梦想，进一步把五层五清企业管理新标准推广到学校企业公司及各贸易机构，完成企业公民的的神圣职责和使命！</div>
            </div>
        </div>
        <div class="mui-card">
            <div class="max-width">
                <h4>支持行业</h4>
                <div>适用于汽车交通工具、软件网络计算机、航空航天科技、食品饮料酒类、娱乐体育休闲、家电五金日用、运输物流仓储、机械工业加工、化工能源环保、媒体广告影视、旅游餐饮酒店、玩具礼品工艺品等行业。</div>
            </div>
        </div>
        <div class="mui-card">
		    <div class="mui-content-padded">
		        <button type="button" @click="subBuy" class="mui-btn mui-btn-success mui-btn-block">确认购买</button>
		    </div>
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
                list:[]
			}
		},
		methods:{
            previous(){
                history.go(-1);
            },
			getImg(){
                var url = "http://127.0.0.1:3000/imagelist";
                this.$http.get(url).then(res=>{
                    //console.log(res);
                    this.list = res.data;
                })
            },
            subBuy(){
                this.$router.push("subAttr");
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
	.mui-card img{
        vertical-align: middle;
        width:100%;
    }
    .mui-card .max-width{
        width:90%;
        margin:0 auto;
    }
    .mui-card .max-width h4{
        text-align:center;
        line-height:30px;
    }
    .mui-card .max-width div{
        text-indent:2em;
        line-height:26px;
    }
</style>