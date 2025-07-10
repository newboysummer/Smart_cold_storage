<template>
  <view class="personal-container">
    <!-- 未登录状态 -->
    <view v-if="!isLoggedIn">
      <view class="login-prompt">
        <text>您还未登录，请先登录。</text>
        <button @click="showLoginModal">登录</button>
        <button @click="showRegisterModal">注册</button>
      </view>
    </view>
    <!-- 登录后状态 -->
    <view v-else>
      <view class="logged-in-content">
        <text class="welcome-text">欢迎，{{ username }}！</text>
        <view class="user-info">
          <text>用户名: {{ username }}</text>
          <text>上次登录时间: {{ lastLoginTime }}</text>
        </view>
        <picker mode="selector" :range="loginHistory" @change="onLoginHistoryChange">
          <button>查看历次登录信息</button>
        </picker>
        <button @click="logout">退出登录</button>
      </view>
    </view>

    <!-- 登录弹窗 -->
    <view v-if="isLoginModalVisible" class="login-modal">
      <view class="modal-content">
        <text class="modal-title">登录</text>
        <input v-model="username" placeholder="用户名" class="login-input" />
        <input v-model="password" placeholder="密码" type="password" class="login-input" />
        <view class="button-group">
          <button @click="login">登录</button>
          <button @click="hideLoginModal">取消</button>
        </view>
      </view>
    </view>

    <!-- 注册弹窗 -->
    <view v-if="isRegisterModalVisible" class="login-modal">
      <view class="modal-content">
        <text class="modal-title">注册</text>
        <input v-model="newUsername" placeholder="用户名" class="login-input" />
        <input v-model="newPassword" placeholder="密码" type="password" class="login-input" />
        <view class="button-group">
          <button @click="register">注册</button>
          <button @click="hideRegisterModal">取消</button>
        </view>
      </view>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      isLoggedIn: false,
      isLoginModalVisible: false,
      isRegisterModalVisible: false,
      username: '',
      password: '',
      newUsername: '',
      newPassword: '',
      lastLoginTime: '',
      loginHistory: []
    };
  },
  onLoad() {
    // 检查本地存储中的登录信息
    const loginInfo = uni.getStorageSync('loginInfo');
    if (loginInfo) {
      this.isLoggedIn = true;
      this.username = loginInfo.username;
      this.lastLoginTime = uni.getStorageSync('lastLoginTime') || '无记录';
      this.loginHistory = uni.getStorageSync('loginHistory') || [];
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
      // 模拟登录认证
      const users = uni.getStorageSync('users') || {};
      if (users[this.username] === this.password) {
        this.isLoggedIn = true;
        this.isLoginModalVisible = false;
        // 保存登录信息到本地存储
        uni.setStorageSync('loginInfo', { username: this.username });
        // 记录当前登录时间作为下次的上次登录时间
        const now = new Date();
        const formattedTime = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')} ${String(now.getHours()).padStart(2, '0')}:${String(now.getMinutes()).padStart(2, '0')}`;
        uni.setStorageSync('lastLoginTime', formattedTime);
        this.lastLoginTime = formattedTime;
        // 更新登录历史
        const newLoginRecord = `${this.username} - ${formattedTime}`;
        const loginHistory = uni.getStorageSync('loginHistory') || [];
        loginHistory.unshift(newLoginRecord);
        uni.setStorageSync('loginHistory', loginHistory);
        this.loginHistory = loginHistory;
      } else {
        uni.showToast({
          title: '用户名或密码错误',
          icon: 'none'
        });
      }
    },
    register() {
      if (this.newUsername && this.newPassword) {
        const users = uni.getStorageSync('users') || {};
        if (users[this.newUsername]) {
          uni.showToast({
            title: '用户名已存在',
            icon: 'none'
          });
        } else {
          users[this.newUsername] = this.newPassword;
          uni.setStorageSync('users', users);
          uni.showToast({
            title: '注册成功，请登录',
            icon: 'success'
          });
          this.hideRegisterModal();
        }
      } else {
        uni.showToast({
          title: '请输入用户名和密码',
          icon: 'none'
        });
      }
    },
    logout() {
      this.isLoggedIn = false;
      this.username = '';
      this.password = '';
      // 清除本地存储中的登录信息
      uni.removeStorageSync('loginInfo');
      uni.removeStorageSync('lastLoginTime');
    },
    onLoginHistoryChange(e) {
      const index = e.detail.value;
      const selectedRecord = this.loginHistory[index];
      uni.showToast({
        title: `选中登录记录: ${selectedRecord}`,
        icon: 'none'
      });
    }
  }
};
</script>

<style lang="scss" scoped>
:root {
  --tech-blue: #007aff;
  --light-gray: #f5f5f5;
  --dark-gray: #333;
  --white: #fff;
  --input-bg: #e0e0e0; /* 输入框背景色 */
}

.personal-container {
  padding: 40px;
  background: var(--light-gray);
  border-radius: 20px;
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
  border: none;
  transition: all 0.3s ease;
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 50px auto;
  max-width: 400px;
}

.login-prompt {
  text-align: center;
  margin-top: 30px;
}

.login-prompt text {
  font-size: 20px;
  color: var(--dark-gray);
  margin-bottom: 30px;
  display: block;
}

.login-prompt button {
  background-color: var(--tech-blue);
  color: var(--white);
  border: none;
  border-radius: 15px;
  padding: 15px 30px;
  font-size: 18px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  box-shadow: 0 5px 15px rgba(0, 122, 255, 0.3);
  margin-bottom: 10px;
}

.login-prompt button:hover {
  background-color: #0056b3;
}

.login-modal {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.1); /* 调整背景颜色 */
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
}

.modal-content {
  background-color: var(--white);
  padding: 30px;
  border-radius: 20px;
  width: 80%;
  max-width: 350px;
  text-align: center;
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
}

.modal-title {
  font-size: 24px;
  font-weight: 600;
  margin-bottom: 30px;
  color: var(--dark-gray);
}

.login-input {
  // 添加左右margin自动居中
  margin-left: auto;
  margin-right: auto;
  // 设置合适宽度
  width: 90%;
  
  // 保持其他样式不变
  padding: 15px;
  margin-bottom: 20px;
  border: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: 10px;
  font-size: 16px;
  background-color: var(--input-bg);
}

.button-group {
  display: flex;
  justify-content: space-around;
  margin-top: 20px;
}

.login-modal button {
  background-color: var(--tech-blue);
  color: var(--white);
  border: none;
  border-radius: 15px;
  padding: 15px 30px;
  font-size: 18px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  box-shadow: 0 5px 15px rgba(0, 122, 255, 0.3);
}

.login-modal button:hover {
  background-color: #0056b3;
}

.logged-in-content {
  text-align: center;
}

.welcome-text {
  font-size: 24px;
  color: var(--dark-gray);
  margin-bottom: 30px;
}

.user-info {
  margin-bottom: 30px;
}

.user-info text {
  display: block;
  margin-bottom: 10px;
  color: var(--dark-gray);
}

.logged-in-content button {
  background-color: var(--tech-blue);
  color: var(--white);
  border: none;
  border-radius: 15px;
  padding: 15px 30px;
  font-size: 18px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  box-shadow: 0 5px 15px rgba(0, 122, 255, 0.3);
  margin-bottom: 10px;
}

.logged-in-content button:hover {
  background-color: #0056b3;
}
</style>