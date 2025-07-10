<template>
  <view class="wrap">
    <view class="page-title">告警中心</view>
    
    <!-- 刷新间隔设置 -->
    <view class="setting-item">
      <text>刷新间隔 (秒)</text>
      <input v-model="refreshIntervalSeconds" placeholder="刷新间隔" type="number" />
    </view>
    
    <!-- 温度范围设置 -->
    <view class="setting-item">
      <text>温度范围 (℃)</text>
      <input v-model="tempMin" placeholder="最小值" type="number" />
      <input v-model="tempMax" placeholder="最大值" type="number" />
    </view>
    
    <!-- 湿度范围设置 -->
    <view class="setting-item">
      <text>湿度范围 (%)</text>
      <input v-model="humiMin" placeholder="最小值" type="number" />
      <input v-model="humiMax" placeholder="最大值" type="number" />
    </view>
    
    <!-- 二氧化碳浓度范围设置 -->
    <view class="setting-item">
      <text>二氧化碳浓度范围 (ppm)</text>
      <input v-model="carooMin" placeholder="最小值" type="number" />
      <input v-model="carooMax" placeholder="最大值" type="number" />
    </view>
    
    <!-- 按钮区域 -->
    <view class="button-group">
      <button @click="saveSettings">保存设置</button>
      <button @click="forceRefresh">立即刷新</button>
    </view>
    
    <!-- 告警列表 -->
    <view class="warning-list">
      <view v-for="(warning, index) in warnings" :key="index" class="warning-item">
        <text>{{ warning }}</text>
      </view>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      tempMin: null,
      tempMax: null,
      humiMin: null,
      humiMax: null,
      carooMin: null,
      carooMax: null,
      refreshIntervalSeconds: 5, // 默认5秒
      warnings: [],
      refreshInterval: null
    };
  },
  onLoad() {
    this.loadSettings();
    this.setupRefreshTimer();
  },
  onUnload() {
    clearInterval(this.refreshInterval);
  },
  methods: {
    loadSettings() {
      const settings = uni.getStorageSync('warningSettings');
      if (settings) {
        this.tempMin = settings.tempMin;
        this.tempMax = settings.tempMax;
        this.humiMin = settings.humiMin;
        this.humiMax = settings.humiMax;
        this.carooMin = settings.carooMin;
        this.carooMax = settings.carooMax;
        this.refreshIntervalSeconds = settings.refreshIntervalSeconds || 5;
      }
    },
    saveSettings() {
      const settings = {
        tempMin: this.tempMin,
        tempMax: this.tempMax,
        humiMin: this.humiMin,
        humiMax: this.humiMax,
        carooMin: this.carooMin,
        carooMax: this.carooMax,
        refreshIntervalSeconds: this.refreshIntervalSeconds
      };
      uni.setStorageSync('warningSettings', settings);
      
      // 保存后重新设置定时器
      this.setupRefreshTimer();
      
      uni.showToast({
        title: '设置保存成功',
        icon: 'success'
      });
    },
    // 设置定时刷新
    setupRefreshTimer() {
      if (this.refreshInterval) {
        clearInterval(this.refreshInterval);
      }
      
      // 确保最小间隔为1秒
      const interval = Math.max(1000, this.refreshIntervalSeconds * 1000);
      
      this.refreshInterval = setInterval(() => {
        this.checkWarnings();
      }, interval);
    },
    // 强制立即刷新
    forceRefresh() {
      this.checkWarnings();
      uni.showToast({
        title: '正在刷新告警数据',
        icon: 'loading'
      });
    },
    // 发送MQTT指令的方法
        sendMqttCommand(commandString, timeout = 5) {
          // 硬编码的产品ID和设备名称
          const HARDCODED_PRODUCT_ID = 'I988L1s0QY';
          const HARDCODED_DEVICE_NAME = 'dev_l610';
          // 构建请求参数
          const queryParams = {
            product_id: HARDCODED_PRODUCT_ID,
            device_name: HARDCODED_DEVICE_NAME,
            timeout: timeout.toString()
          };
          
          // 构建查询字符串
          const queryString = Object.keys(queryParams)
            .map((key) => `${key}=${encodeURIComponent(queryParams[key])}`)
            .join('&');
          
          // 构建API URL
          const apiUrl = `https://iot-api.heclouds.com/datapoint/synccmds?${queryString}`;
          
          // 发送请求
          uni.request({
            url: apiUrl,
            method: 'POST',
            data: commandString,
            header: {
              'Content-Type': 'text/plain',
              authorization: '隐私数据保密'
            },
            success: () => {
              console.log('告警数量指令下发成功:', commandString);
            },
            fail: (err) => {
              console.error('告警数量指令下发失败:', err);
            }
          });
        },
        checkWarnings() {
          const product_id = 'I988L1s0QY';
          const device_name = 'dev_l610';
          const endTime = new Date();
          const startTime = new Date(endTime.getTime() - 60 * 60 * 10000*5);
    
          const formatDate = (date) => {
            const year = date.getFullYear();
            const month = String(date.getMonth() + 1).padStart(2, '0');
            const day = String(date.getDate()).padStart(2, '0');
            const hours = String(date.getHours()).padStart(2, '0');
            const minutes = String(date.getMinutes()).padStart(2, '0');
            const seconds = String(date.getSeconds()).padStart(2, '0');
            return `${year}-${month}-${day}T${hours}:${minutes}:${seconds}`;
          };
    
          const start = formatDate(startTime);
          const end = formatDate(endTime);
    
          uni.request({
            url: 'https://iot-api.heclouds.com/datapoint/history-datapoints',
            method: 'GET',
            data: {
              product_id,
              device_name,
              start,
              end,
              limit: 100
            },
            header: {
              authorization: '隐私数据保密'
            },
            success: (res) => {
              console.log(res);
              if (res.data.data?.datastreams) {
                const datastreams = res.data.data.datastreams;
                const warnings = [];
                
                // 按类型过滤并处理所有相关数据流
                datastreams.forEach(stream => {
                  const streamId = stream.id || '';
                  const deviceNodeId = device_name; // 使用固定设备名或从ID解析
                  const latestValue = parseFloat(stream.datapoints[0]?.value);
                  
                  // 温度类数据流检查
                  if (streamId.includes('SHT31_T')) {
                    if (latestValue < this.tempMin || latestValue > this.tempMax) {
                      warnings.push(`设备节点${streamId} 温度不正常: ${latestValue}℃`);
                    }
                  }
                  
                  // 湿度类数据流检查
                  else if (streamId.includes('SHT31_H')) {
                    if (latestValue < this.humiMin || latestValue > this.humiMax) {
                      warnings.push(`设备节点${streamId} 湿度不正常: ${latestValue}%`);
                    }
                  }
                  
                  // 二氧化碳类数据流检查
                  else if (streamId.includes('SGP30')) {
                    if (latestValue < this.carooMin || latestValue > this.carooMax) {
                      warnings.push(`设备节点${streamId} 二氧化碳浓度不正常: ${latestValue}ppm`);
                    }
                  }
                });
                
                this.warnings = warnings;
                
                // 1. 存储告警数量到本地
                uni.setStorageSync('warningCount', warnings.length);
                
                // 2. 通过MQTT下发告警数量
                this.sendMqttCommand(`WARN ${warnings.length}`);
              }
            },
            fail: (err) => {
              console.error('获取历史数据失败:', err);
            }
          });
        }
  }
};
</script>

<style>
.wrap {
  padding: 40rpx;
  display: flex;
  flex-direction: column;
  align-items: center;
  min-height: 100vh;
  background-color: #f8fafc;
}

.page-title {
  font-size: 48rpx;
  font-weight: bold;
  color: #1e3a8a;
  margin-bottom: 40rpx;
  text-shadow: 1rpx 1rpx 2rpx rgba(0,0,0,0.1);
}

.setting-item {
  display: flex;
  align-items: center;
  margin-bottom: 20rpx;
  width: 100%;
}

.setting-item text {

  display: flex;
  margin-right: 20rpx;
  min-width: 250rpx;
}

.setting-item input {
  width: 150rpx;
  border: 1px solid #ccc;
  border-radius: 5rpx;
  padding: 10rpx;
  margin-right: 10rpx;
}

.button-group {
  display: flex;
  width: 100%;
  justify-content: space-between;
  margin: 20rpx 0;
}

.button-group button {
  width: 48%;
  background-color: #1e3a8a;
  color: white;
  border: none;
  border-radius: 12rpx;
  padding: 15rpx 30rpx;
  font-size: 28rpx;
  font-weight: 500;
}

.warning-list {
  width: 100%;
  margin-top: 20rpx;
}

.warning-item {
  background-color: #fee2e2;
  color: #ef4444;
  border-radius: 10rpx;
  padding: 15rpx 20rpx;
  margin-bottom: 10rpx;
}
</style>