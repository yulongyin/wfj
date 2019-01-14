<template>
    <div class="app-perfectInfo">
        <header class="mui-bar mui-bar-nav">
			<a @click="previous" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" href="javascript:;"></a>
			<h1 id="title" class="mui-title">更多资料</h1>
		</header>
		<div class="mui-slider-item">
            <ul class="mui-table-view mui-grid-view mui-grid-9">
                <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3" v-for="(item,i) of list">
                    <a href="#">
                        <mt-button size="large" @click="changeShow($event)" :class="activeObj[i]"  :data-idx="i">{{item.users_info}}</mt-button>
                    </a>
                </li>
            </ul>
            <mt-button size="large" @click="subInfo">确定</mt-button>
        </div>
    </div>
</template>
<script>
    import {Toast} from 'mint-ui'
    export default {
        data () {
            return {
                list:[],
                uid:0,
                activeObj:[],
                users_info:[]
            }
        },
        methods:{
            previous(){
                history.go(-1);
            },
            //显示用户所有资料，根据是否显示确定颜色的不同
            getAllInfo(){
                this.uid = this.$route.query.uid;
                var url = "showAllInfo?uid="+this.uid;
                this.$http.get(url).then(result=>{
                    this.list = result.body;
                    //console.log(this.list)
                    this.activeObj = this.list;
                    this.users_info = this.list.users_info;
                    for(var i = 0;i < this.list.length;i++){
                        if(this.list[i].isShow == 1){
                            this.activeObj[i].actives = true;
                        }else{
                            this.activeObj[i].actives = false;
                        }
                    }
                    //console.log(this.activeObj)
                })
            },
            //点击选择或者取消选择
            changeShow(e){
                e.preventDefault();
                //获取个人信息中文名称
                //console.log(e.target);
                if(e.target.className.indexOf("actives") != -1){
                    e.target.classList.remove("isShow");
                    e.target.classList.remove("actives");
                    this.activeObj[e.target.dataset.idx].actives = false;
                    this.list[e.target.dataset.idx].isShow = 0;
                }else{
                    e.target.classList.add("isShow");
                    e.target.classList.add("actives");
                    this.activeObj[e.target.dataset.idx].actives = true;
                    this.list[e.target.dataset.idx].isShow = 1;
                }
            },
            //确定按钮
            subInfo(){
                this.uid = this.$route.query.uid;
                var url = "";
                var num = 0;
                for(var i = 0;i < this.activeObj.length;i++){
                    url = "updateInfo?uid="+this.uid+"&users_info="+this.activeObj[i].users_info+"&isShow="+this.list[i].isShow+";";
                    this.$http.get(url).then(result=>{
                        //console.log(result.body.code == 1)
                        if(result.body.code == 1){
                            num++;
                            if(num == 15){
                                Toast("修改成功！");
                                //跳回上一页
                                this.$router.push("perfect?uid="+this.uid);
                            }
                        }
                    })
                }
            }
        },
        created() {
            this.getAllInfo();
        },
        mounted() {
            
        },
    }
</script>
<style>

    .actives{
        background:#2E90FF !important;
        color:#fff !important;
    }
</style>