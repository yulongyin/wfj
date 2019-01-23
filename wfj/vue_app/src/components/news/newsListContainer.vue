<template>
    <div class="app-newsList">

        <ul class="mui-table-view">
            <li class="mui-table-view-cell mui-media" v-for="item in list">
                <router-link :to="'/home/newsInfo?id='+item.id">
                    <img class="mui-media-object mui-pull-left" :src="item.img_url">
                    <div class="mui-media-body">
                        {{item.title}}
                        <p class='mui-ellipsis'>
                            <span>{{item.ctime | dateFilter}}</span>&nbsp;
                            <span>点击:{{item.point}}次</span>
                        </p>
                    </div>
                </router-link>
            </li>
        </ul>
        <mt-button type="primary" id="btn" size="large" @click="getMore()">加载更多...</mt-button>
        <!--<div class="mui-content-padded">
            <button id="ddd" type="button" class="mui-btn mui-btn-primary mui-btn-block" @click="getMore()">加载更多...</button>
        </div>-->
    </div>
</template>
<script>
    export default {
        data(){
            return {
                list:[],
                pageIndex:0,    //显示当前页数
                pageSize:5,     //页显示多少
                hasMore:true,   //是否存在下一页数据
                pageCount:3
            }
        },
        methods:{
            //加载更多
            getMore(){
                this.pageIndex++;
                this.hasMore = this.pageIndex <= this.pageCount;
                if(!this.hasMore)return;
                var url = "http://127.0.0.1:3000/newslist?pno="+this.pageIndex+"&pageSize="+this.pageSize;
                this.$http.get(url).then(result=>{
                    //console.log(result);
                    var rows = this.list.concat(result.body.data);
                    this.list = rows;
                    this.pageCount = result.body.pageCount;
                    //this.list = result.body.data;
                    var ch = document.getElementById("btn");
                    if(this.pageIndex == result.body.pageCount){
                        ch.innerHTML = "没有更多了...";
                    }
                });
            }
        },
        created() {
            this.getMore();
        }
    }
</script>
<style>
    .app-newsList .mui-table-view .mui-table-view-cell a .mui-media-object{
        max-width:60px;
        height:60px;
    }
    
    .app-newsList .mui-table-view .mui-table-view-cell{
        width:100%;
    }

    .app-newsList .mui-table-view .mui-table-view-cell .mui-media-body p.mui-ellipsis span:last-child{
        float:right;
        color:blue;
    }
</style>