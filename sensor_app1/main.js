// import App from './App'

// // #ifndef VUE3
// import Vue from 'vue'
// import './uni.promisify.adaptor'
// Vue.config.productionTip = false
// App.mpType = 'app'
// const app = new Vue({
//   ...App
// })
// app.$mount()
// // #endif

// // #ifdef VUE3
// import { createSSRApp } from 'vue'
// export function createApp() {
//   const app = createSSRApp(App)
//   return {
//     app
//   }
// }
// // #endif
// sensor_app1/main.js
import App from './App'

// #ifndef VUE3
import Vue from 'vue'
import './uni.promisify.adaptor'

// 全局路由守卫
Vue.mixin({
  onShow() {
    const loginInfo = uni.getStorageSync('loginInfo');
    if (!loginInfo && this.$route.path!== '/pages/index/person_page') {
      uni.showModal({
        title: '提示',
        content: '您还未登录，请先登录。',
        confirmText: '去登录',
        success: (res) => {
          if (res.confirm) {
            uni.navigateTo({
              url: '/pages/index/person_page'
            });
          }
        }
      });
    }
  }
});

Vue.config.productionTip = false
App.mpType = 'app'
const app = new Vue({
  ...App
})
app.$mount()
// #endif

// #ifdef VUE3
import { createSSRApp } from 'vue'
export function createApp() {
  const app = createSSRApp(App)
  return {
    app
  }
}
// #endif
