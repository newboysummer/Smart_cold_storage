"use strict";
const common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  data() {
    return {
      isLoggedIn: false,
      isLoginModalVisible: false,
      isRegisterModalVisible: false,
      username: "",
      password: "",
      newUsername: "",
      newPassword: "",
      lastLoginTime: "",
      loginHistory: []
    };
  },
  onLoad() {
    const loginInfo = common_vendor.index.getStorageSync("loginInfo");
    if (loginInfo) {
      this.isLoggedIn = true;
      this.username = loginInfo.username;
      this.lastLoginTime = common_vendor.index.getStorageSync("lastLoginTime") || "无记录";
      this.loginHistory = common_vendor.index.getStorageSync("loginHistory") || [];
    }
  },
  methods: {
    showLoginModal() {
      this.isLoginModalVisible = true;
    },
    hideLoginModal() {
      this.isLoginModalVisible = false;
    },
    showRegisterModal() {
      this.isRegisterModalVisible = true;
    },
    hideRegisterModal() {
      this.isRegisterModalVisible = false;
    },
    login() {
      const users = common_vendor.index.getStorageSync("users") || {};
      if (users[this.username] === this.password) {
        this.isLoggedIn = true;
        this.isLoginModalVisible = false;
        common_vendor.index.setStorageSync("loginInfo", { username: this.username });
        const now = /* @__PURE__ */ new Date();
        const formattedTime = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, "0")}-${String(now.getDate()).padStart(2, "0")} ${String(now.getHours()).padStart(2, "0")}:${String(now.getMinutes()).padStart(2, "0")}`;
        common_vendor.index.setStorageSync("lastLoginTime", formattedTime);
        this.lastLoginTime = formattedTime;
        const newLoginRecord = `${this.username} - ${formattedTime}`;
        const loginHistory = common_vendor.index.getStorageSync("loginHistory") || [];
        loginHistory.unshift(newLoginRecord);
        common_vendor.index.setStorageSync("loginHistory", loginHistory);
        this.loginHistory = loginHistory;
      } else {
        common_vendor.index.showToast({
          title: "用户名或密码错误",
          icon: "none"
        });
      }
    },
    register() {
      if (this.newUsername && this.newPassword) {
        const users = common_vendor.index.getStorageSync("users") || {};
        if (users[this.newUsername]) {
          common_vendor.index.showToast({
            title: "用户名已存在",
            icon: "none"
          });
        } else {
          users[this.newUsername] = this.newPassword;
          common_vendor.index.setStorageSync("users", users);
          common_vendor.index.showToast({
            title: "注册成功，请登录",
            icon: "success"
          });
          this.hideRegisterModal();
        }
      } else {
        common_vendor.index.showToast({
          title: "请输入用户名和密码",
          icon: "none"
        });
      }
    },
    logout() {
      this.isLoggedIn = false;
      this.username = "";
      this.password = "";
      common_vendor.index.removeStorageSync("loginInfo");
      common_vendor.index.removeStorageSync("lastLoginTime");
    },
    onLoginHistoryChange(e) {
      const index = e.detail.value;
      const selectedRecord = this.loginHistory[index];
      common_vendor.index.showToast({
        title: `选中登录记录: ${selectedRecord}`,
        icon: "none"
      });
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return common_vendor.e({
    a: !$data.isLoggedIn
  }, !$data.isLoggedIn ? {
    b: common_vendor.o((...args) => $options.showLoginModal && $options.showLoginModal(...args)),
    c: common_vendor.o((...args) => $options.showRegisterModal && $options.showRegisterModal(...args))
  } : {
    d: common_vendor.t($data.username),
    e: common_vendor.t($data.username),
    f: common_vendor.t($data.lastLoginTime),
    g: $data.loginHistory,
    h: common_vendor.o((...args) => $options.onLoginHistoryChange && $options.onLoginHistoryChange(...args)),
    i: common_vendor.o((...args) => $options.logout && $options.logout(...args))
  }, {
    j: $data.isLoginModalVisible
  }, $data.isLoginModalVisible ? {
    k: $data.username,
    l: common_vendor.o(($event) => $data.username = $event.detail.value),
    m: $data.password,
    n: common_vendor.o(($event) => $data.password = $event.detail.value),
    o: common_vendor.o((...args) => $options.login && $options.login(...args)),
    p: common_vendor.o((...args) => $options.hideLoginModal && $options.hideLoginModal(...args))
  } : {}, {
    q: $data.isRegisterModalVisible
  }, $data.isRegisterModalVisible ? {
    r: $data.newUsername,
    s: common_vendor.o(($event) => $data.newUsername = $event.detail.value),
    t: $data.newPassword,
    v: common_vendor.o(($event) => $data.newPassword = $event.detail.value),
    w: common_vendor.o((...args) => $options.register && $options.register(...args)),
    x: common_vendor.o((...args) => $options.hideRegisterModal && $options.hideRegisterModal(...args))
  } : {});
}
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__scopeId", "data-v-e189be9e"], ["__file", "D:/Desktop/Onenet/APP_TST/sensor_app1/pages/index/person_page.vue"]]);
wx.createPage(MiniProgramPage);
