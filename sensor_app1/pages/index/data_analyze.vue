<template>
  <view class="wrap">
    <view class="page-title">冷库环境数据分析</view>
    
    <!-- 设备选择器 -->
    <view class="device-selector">
      <text>选择设备节点: </text>
      <picker @change="onDeviceChange" :value="currentDeviceIndex" :range="deviceList">
        <view class="picker">{{ deviceList[currentDeviceIndex] }}</view>
      </picker>
    </view>
    
    <!-- 温度图表 -->
    <view class="chart-container">
      <view class="chart-title">温度数据分析</view>
      <view class="temp-chart-container">
        <canvas v-if="isWeapp || isApp" canvas-id="temp-chart" class="echart-canvas"></canvas>
        <view v-else id="temp-chart" class="echart-container"></view>
      </view>
    </view>
    <!-- 湿度图表 -->
    <view class="chart-container">
      <view class="chart-title">湿度数据分析</view>
      <view class="humi-chart-container">
        <canvas v-if="isWeapp || isApp" canvas-id="humi-chart" class="echart-canvas"></canvas>
        <view v-else id="humi-chart" class="echart-container"></view>
      </view>
    </view>
    <!-- 二氧化碳浓度图表 -->
    <view class="chart-container">
      <view class="chart-title">二氧化碳浓度数据分析</view>
      <view class="caroo-chart-container">
        <canvas v-if="isWeapp || isApp" canvas-id="caroo-chart" class="echart-canvas"></canvas>
        <view v-else id="caroo-chart" class="echart-container"></view>
      </view>
    </view>
    <!-- 刷新按钮 -->
    <button @click="fetchData">立即刷新</button>
    <!-- 错误提示 -->
    <view v-if="error" class="error-message">
      数据加载失败，请稍后重试
    </view>
  </view>
</template>

<script>
import * as echarts from 'echarts';

// 环境判断
const isH5 = process.env.VUE_APP_PLATFORM === 'h5';
const isWeapp = process.env.VUE_APP_PLATFORM === 'mp-weixin';
const isApp = process.env.VUE_APP_PLATFORM === 'app-plus';

const product_id = 'I988L1s0QY';

export default {
  data() {
    return {
      token: '隐私数据保密',
      loading: true,
      error: false,
      refreshInterval: null,
      // 设备列表数据
      deviceList: ['A', 'B', 'C'], // 示例设备列表，实际设备名称
      currentDeviceIndex: 0,
      // 按设备存储的数据
      deviceData: {
        // 示例数据结构：
        // 'A': {
        //   tempData: [],
        //   humiData: [],
        //   carooData: [],
        //   timeData: []
        // },
        // 'B': { ... }
      },
      charts: {
        tempChart: null,
        humiChart: null,
        carooChart: null
      },
      resizeTimer: null
    };
  },
  computed: {
    isWeapp() {
      return isWeapp;
    },
    isApp() {
      return isApp;
    },
    isH5() {
      return isH5;
    },
    // 当前选中的设备
    currentDevice() {
      return this.deviceList[this.currentDeviceIndex];
    },
    // 当前设备的数据
    currentDeviceData() {
      return this.deviceData[this.currentDevice] || {
        tempData: [],
        humiData: [],
        carooData: [],
        timeData: []
      };
    }
  },
  onLoad() {
    // 初始化设备数据
    this.deviceList.forEach(device => {
      this.$set(this.deviceData, device, {
        tempData: [],
        humiData: [],
        carooData: [],
        timeData: []
      });
    });
    
    this.fetchData();
    this.refreshInterval = setInterval(() => {
      this.fetchData();
    }, 30000);
    
    // 监听窗口大小变化
    if (isH5 || isApp) {
      window.addEventListener('resize', this.handleResize);
    }
  },
  onUnload() {
    clearInterval(this.refreshInterval);
    
    // 移除事件监听
    if (isH5 || isApp) {
      window.removeEventListener('resize', this.handleResize);
    }
    
    // 清理定时器
    if (this.resizeTimer) {
      clearTimeout(this.resizeTimer);
    }
    
    // 销毁图表实例
    this.disposeCharts();
  },
  methods: {
    // 设备切换处理
    onDeviceChange(e) {
      const index = e.detail.value;
      this.currentDeviceIndex = index;
      this.$nextTick(() => {
        this.drawCharts();
      });
    },
    
    fetchData() {
      this.loading = true;
      this.error = false;

      // 为每个设备获取数据
      const promises = this.deviceList.map(device => {
        return this.fetchDeviceData(device);
      });

      Promise.all(promises)
        .then(() => {
          this.drawCharts();
          this.loading = false;
        })
        .catch(err => {
          console.error('获取数据失败:', err);
          this.error = true;
          this.loading = false;
        });
    },
    
    fetchDeviceData(device) {
      return new Promise((resolve, reject) => {
        const endTime = new Date();
        const startTime = new Date(endTime.getTime() - 24 * 60 * 60 * 1000 * 5);

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
            device_name: 'dev_l610',
            start,
            end,
            limit: 100
          },
          header: {
            authorization: this.token
          },
          success: (res) => {
            console.log(`设备 ${device} 历史数据获取成功:`, res.data);

            if (res.data.data?.datastreams) {
              const datastreams = res.data.data.datastreams;
              
              const tempStream = datastreams.find(s => s.id === `SHT31_T_${device}`);
              const humiStream = datastreams.find(s => s.id === `SHT31_H_${device}`);
              const carooStream = datastreams.find(s => s.id === `SGP30_${device}`);

              const deviceData = {
                tempData: tempStream?.datapoints.map(point => parseFloat(point.value)) || [],
                humiData: humiStream?.datapoints.map(point => parseFloat(point.value)) || [],
                carooData: carooStream?.datapoints.map(point => parseFloat(point.value)) || [],
                timeData: tempStream?.datapoints.map(point => new Date(point.at).toLocaleTimeString()) || []
              };

              // 更新设备数据
              this.$set(this.deviceData, device, deviceData);
              resolve();
            } else {
              console.warn('API返回数据格式不符合预期:', res.data);
              reject(new Error('数据格式错误'));
            }
          },
          fail: (err) => {
            console.error(`获取设备 ${device} 历史数据失败:`, err);
            reject(err);
          }
        });
      });
    },
    
    drawCharts() {
      this.disposeCharts(); // 销毁现有图表实例
      
      if (isH5) {
        this.initChartsForH5();
      } else if (isWeapp || isApp) {
        this.initChartsForMiniProgram();
      }
    },
    
    initChartsForH5() {
      this.charts.tempChart = echarts.init(document.getElementById('temp-chart'));
      this.charts.humiChart = echarts.init(document.getElementById('humi-chart'));
      this.charts.carooChart = echarts.init(document.getElementById('caroo-chart'));
      
      this.setChartOptions();
    },
    
    initChartsForMiniProgram() {
      const that = this;
      
      // 温度图表
      uni.createSelectorQuery().in(this).select('.temp-chart-container').boundingClientRect(rect => {
        if (!rect) return;
        
        const tempCtx = uni.createCanvasContext('temp-chart', this);
        this.charts.tempChart = echarts.init(tempCtx, null, {
          width: rect.width,
          height: rect.height,
          renderer: 'canvas'
        });
        
        // 湿度图表
        uni.createSelectorQuery().in(this).select('.humi-chart-container').boundingClientRect(humiRect => {
          if (!humiRect) return;
          
          const humiCtx = uni.createCanvasContext('humi-chart', this);
          this.charts.humiChart = echarts.init(humiCtx, null, {
            width: humiRect.width,
            height: humiRect.height,
            renderer: 'canvas'
          });
          
          // 二氧化碳图表
          uni.createSelectorQuery().in(this).select('.caroo-chart-container').boundingClientRect(carooRect => {
            if (!carooRect) return;
            
            const carooCtx = uni.createCanvasContext('caroo-chart', this);
            this.charts.carooChart = echarts.init(carooCtx, null, {
              width: carooRect.width,
              height: carooRect.height,
              renderer: 'canvas'
            });
            
            // 设置图表选项
            this.setChartOptions();
            
            // 监听窗口大小变化
            if (isApp) {
              uni.onWindowResize(() => {
                this.resizeCharts();
              });
            }
          }).exec();
        }).exec();
      }).exec();
    },
    
    setChartOptions() {
      const { tempChart, humiChart, carooChart } = this.charts;
      const device = this.currentDevice;
      const deviceData = this.currentDeviceData;
      
      if (!tempChart || !humiChart || !carooChart) return;
      
      // 温度图表
      const tempOption = {
        title: {
          text: `设备 ${device} - 温度变化趋势`,
          left: 'center'
        },
        tooltip: {
          trigger: 'axis',
          formatter: '{b}<br/>温度: {c}°C'
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: {
          type: 'category',
          boundaryGap: false,
          data: deviceData.timeData
        },
        yAxis: {
          type: 'value',
          name: '温度(°C)'
        },
        series: [{
          name: '温度',
          data: deviceData.tempData,
          type: 'line',
          color: '#ef4444',
          smooth: true,
          symbol: 'circle',
          symbolSize: 6,
          areaStyle: {}
        }]
      };
      tempChart.setOption(tempOption);
      
      // 湿度图表
      const humiOption = {
        title: {
          text: `设备 ${device} - 湿度变化趋势`,
          left: 'center'
        },
        tooltip: {
          trigger: 'axis',
          formatter: '{b}<br/>湿度: {c}%'
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: {
          type: 'category',
          boundaryGap: false,
          data: deviceData.timeData
        },
        yAxis: {
          type: 'value',
          name: '湿度(%)'
        },
        series: [{
          name: '湿度',
          data: deviceData.humiData,
          type: 'line',
          color: '#3b82f6',
          smooth: true,
          symbol: 'circle',
          symbolSize: 6,
          areaStyle: {}
        }]
      };
      humiChart.setOption(humiOption);
      
      // 二氧化碳图表
      const carooOption = {
        title: {
          text: `设备 ${device} - 二氧化碳浓度变化趋势`,
          left: 'center'
        },
        tooltip: {
          trigger: 'axis',
          formatter: '{b}<br/>CO₂: {c} ppm'
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: {
          type: 'category',
          boundaryGap: false,
          data: deviceData.timeData
        },
        yAxis: {
          type: 'value',
          name: 'CO₂(ppm)'
        },
        series: [{
          name: 'CO₂',
          data: deviceData.carooData,
          type: 'line',
          color: '#10b981',
          smooth: true,
          symbol: 'circle',
          symbolSize: 6,
          areaStyle: {}
        }]
      };
      carooChart.setOption(carooOption);
    },
    
    handleResize() {
      // 原生防抖实现
      if (this.resizeTimer) {
        clearTimeout(this.resizeTimer);
      }
      this.resizeTimer = setTimeout(() => {
        this.resizeCharts();
      }, 300);
    },
    
    resizeCharts() {
      const { tempChart, humiChart, carooChart } = this.charts;
      
      if (!tempChart || !humiChart || !carooChart) return;
      
      if (isH5) {
        tempChart.resize();
        humiChart.resize();
        carooChart.resize();
      } else {
        // 小程序环境需要重新获取尺寸
        uni.createSelectorQuery().in(this).select('.temp-chart-container').boundingClientRect(rect => {
          if (rect) tempChart.resize({ width: rect.width, height: rect.height });
        }).exec();
        
        uni.createSelectorQuery().in(this).select('.humi-chart-container').boundingClientRect(rect => {
          if (rect) humiChart.resize({ width: rect.width, height: rect.height });
        }).exec();
        
        uni.createSelectorQuery().in(this).select('.caroo-chart-container').boundingClientRect(rect => {
          if (rect) carooChart.resize({ width: rect.width, height: rect.height });
        }).exec();
      }
    },
    
    disposeCharts() {
      const { tempChart, humiChart, carooChart } = this.charts;
      
      if (tempChart) tempChart.dispose();
      if (humiChart) humiChart.dispose();
      if (carooChart) carooChart.dispose();
      
      this.charts = {
        tempChart: null,
        humiChart: null,
        carooChart: null
      };
    }
  }
};
</script>

<style scoped>
.wrap {
  padding: 20rpx;
  display: flex;
  flex-direction: column;
  align-items: center;
  min-height: 100vh;
  background-color: #f8fafc;
}

.page-title {
  font-size: 36rpx;
  font-weight: bold;
  color: #1e3a8a;
  margin: 20rpx 0;
  text-align: center;
}

/* 设备选择器样式 */
.device-selector {
  display: flex;
  align-items: center;
  margin: 20rpx 0;
  padding: 15rpx 20rpx;
  background-color: white;
  border-radius: 16rpx;
  box-shadow: 0 5rpx 15rpx -3rpx rgba(0, 0, 0, 0.1);
  width: 96%;
}

.device-selector text {
  font-size: 28rpx;
  margin-right: 20rpx;
}

.picker {
  font-size: 28rpx;
  padding: 10rpx 20rpx;
  border: 1rpx solid #ccc;
  border-radius: 10rpx;
  background-color: white;
}

.chart-container {
  width: 96%;
  margin: 15rpx 0;
  background-color: white;
  border-radius: 16rpx;
  box-shadow: 0 5rpx 15rpx -3rpx rgba(0, 0, 0, 0.1);
  padding: 15rpx;
}

.temp-chart-container, .humi-chart-container, .caroo-chart-container {
  width: 100%;
  height: 300rpx;
}

.echart-container, .echart-canvas {
  width: 100%;
  height: 100%;
}

.chart-title {
  font-size: 28rpx;
  font-weight: 500;
  color: #475569;
  margin-bottom: 10rpx;
  text-align: center;
}

button {
  background-color: #1e3a8a;
  color: white;
  border: none;
  border-radius: 12rpx;
  padding: 15rpx 30rpx;
  font-size: 28rpx;
  font-weight: 500;
  margin: 20rpx 0;
  width: 96%;
}

.error-message {
  font-size: 24rpx;
  color: #ef4444;
  margin: 15rpx 0;
  padding: 15rpx 20rpx;
  background-color: #fee2e2;
  border-radius: 10rpx;
  width: 96%;
  text-align: center;
}
</style>