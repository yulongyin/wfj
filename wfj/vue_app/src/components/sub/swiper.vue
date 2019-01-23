<template>
    <div class="app-swiper">
        <mt-swipe :auto="3000" :show-indicators="true">
            <mt-swipe-item v-for="item in list" :key="item.id">
                <img :src="item.img_url" alt="">
            </mt-swipe-item>
        </mt-swipe>
    </div>    
</template>

<script>
    export default {
        data(){
            return { }
        },
        props:["list"]
    }
</script>
<style>

    .app-swiper .mint-swipe{
        width:100%;
        height:140px;
        margin:auto;
    }
    .app-swiper .mint-swipe img{
        width:100%;
    }
</style>