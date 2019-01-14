<template>
    <div class="app-attract">
        <header class="mui-bar mui-bar-nav">
			<a @click="previous" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" href="javascript:;"></a>
			<h1 id="title" class="mui-title">购买订单</h1>
		</header>
        <div class="mui-card">
            <ul class="mui-table-view mui-table-view-chevron">
				<li class="mui-table-view-cell mui-media" >
					<a class="mui-navigate-right">
						<img class="mui-media-object mui-pull-left" :src="this.list.img_url">
						<div class="mui-media-body">
							<h4>{{this.list.title}}</h4>
							<p class='mui-ellipsis'>¥{{this.list.price}}元</p>
						</div>
					</a>
				</li>
			</ul>
        </div>
        <div class="mui-card">
            <div class="sub-card-left">
                <span>行业类别</span>
            </div>
            <div class="sub-card-right">
                <input type="text" value="北京天太世统科技有限公司">
            </div>
        </div>
        <div class="mui-card">
            <div class="sub-card-left">
                <span><span>*</span>公司名称</span>
            </div>
            <div class="sub-card-right">
                <input type="text">
            </div>
            <div class="sub-card-left">
                <span>机构名称</span>
            </div>
            <div class="sub-card-right">
                <input type="text">
            </div>
            <div class="sub-card-left">
                <span><span>*</span>详细地址</span>
            </div>
            <div class="sub-card-right">
                <input type="text">
            </div>
            <div class="sub-card-left">
                <span>注册号</span>
            </div>
            <div class="sub-card-right">
                <input type="text">
            </div>
            <div class="sub-card-left">
                <span><span>*</span>公司邮箱</span>
            </div>
            <div class="sub-card-right">
                <input type="text">
            </div>
        </div>
        <div class="mui-card">
            <div class="sub-card-left">
                <span><span>*</span>法人代表</span>
            </div>
            <div class="sub-card-right">
                <input type="text">
            </div>
            <div class="sub-card-left">
                <span><span>*</span>联系电话</span>
            </div>
            <div class="sub-card-right">
                <input type="text">
            </div>
        </div>
        <div class="mui-card">
            <div class="sub-card-left">
                <span><span>*</span>开户银行</span>
            </div>
            <div class="sub-card-right">
                <input type="text">
            </div>
            <div class="sub-card-left">
                <span><span>*</span>开户账号</span>
            </div>
            <div class="sub-card-right">
                <input type="text">
            </div>
        </div>
        <div class="mui-card">
		    <div class="mui-content-padded">
		        <button @click="buySeccess" type="button" class="mui-btn mui-btn-success mui-btn-block">支付</button>
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
                list:[],
                attrId:0
			}
		},
		methods:{
            previous(){
                history.go(-1);
            },
            getOneAttr(){
                var url = "http://127.0.0.1:3000/attract";
                this.$http.get(url).then(res=>{
                    var aid = sessionStorage["attrId"];
                    this.list = res.body[aid-1]
                })
            },
            buySeccess(){
                Toast("购买成功");
                this.$router.push("/");
            }
		},
		created() {
            this.getOneAttr();
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
    .mui-table-view .mui-navigate-right:after, .mui-push-right:after{
        content:"";
    }
    .mui-card .sub-card-left{
        float:left;
        width:25%;
        line-height:55px;
        box-sizing:border-box;
        text-align:right;
        padding-right:10px;
    }
    .mui-card .sub-card-right{
        float:left;
        width:75%;
        line-height:55px;
    }
    .mui-card .sub-card-right input{
        width:90%;
        line-height:55px;
    }
    .mui-card div span span{
        color:red;
    }
</style>