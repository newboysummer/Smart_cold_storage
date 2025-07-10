"use strict";
const common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  data() {
    return {
      tempMin: null,
      tempMax: null,
      humiMin: null,
      humiMax: null,
      carooMin: null,
      carooMax: null,
      refreshIntervalSeconds: 5,
      // 默认5秒
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
      const settings = common_vendor.index.getStorageSync("warningSettings");
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
      common_vendor.index.setStorageSync("warningSettings", settings);
      this.setupRefreshTimer();
      common_vendor.index.showToast({
        title: "设置保存成功",
        icon: "success"
      });
    },
    // 设置定时刷新
    setupRefreshTimer() {
      if (this.refreshInterval) {
        clearInterval(this.refreshInterval);
      }
      const interval = Math.max(1e3, this.refreshIntervalSeconds * 1e3);
      this.refreshInterval = setInterval(() => {
        this.checkWarnings();
      }, interval);
    },
    // 强制立即刷新
    forceRefresh() {
      this.checkWarnings();
      common_vendor.index.showToast({
        title: "正在刷新告警数据",
        icon: "loading"
      });
    },
    // 发送MQTT指令的方法
    sendMqttCommand(commandString, timeout = 5) {
      const HARDCODED_PRODUCT_ID = "I988L1s0QY";
      const HARDCODED_DEVICE_NAME = "dev_l610";
      const queryParams = {
        product_id: HARDCODED_PRODUCT_ID,
        device_name: HARDCODED_DEVICE_NAME,
        timeout: timeout.toString()
      };
      const queryString = Object.keys(queryParams).map((key) => `${key}=${encodeURIComponent(queryParams[key])}`).join("&");
      const apiUrl = `https://iot-api.heclouds.com/datapoint/synccmds?${queryString}`;
      common_vendor.index.request({
        url: apiUrl,
        method: "POST",
        data: commandString,
        header: {
          "Content-Type": "text/plain",
          authorization: "version=2022-05-01&res=products%2FI988L1s0QY&et=2066470834&method=sha1&sign=STalyy41ghlNncU9RxWM9ZChzZ4%3D"
        },
        success: () => {
          console.log("告警数量指令下发成功:", commandString);
        },
        fail: (err) => {
          console.error("告警数量指令下发失败:", err);
        }
      });
    },
    checkWarnings() {
      const product_id = "I988L1s0QY";
      const device_name = "dev_l610";
      const endTime = /* @__PURE__ */ new Date();
      const startTime = new Date(endTime.getTime() - 60 * 60 * 1e4 * 5);
      const formatDate = (date) => {
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, "0");
        const day = String(date.getDate()).padStart(2, "0");
        const hours = String(date.getHours()).padStart(2, "0");
        const minutes = String(date.getMinutes()).padStart(2, "0");
        const seconds = String(date.getSeconds()).padStart(2, "0");
        return `${year}-${month}-${day}T${hours}:${minutes}:${seconds}`;
      };
      const start = formatDate(startTime);
      const end = formatDate(endTime);
      common_vendor.index.request({
        url: "https://iot-api.heclouds.com/datapoint/history-datapoints",
        method: "GET",
        data: {
          product_id,
          device_name,
          start,
          end,
          limit: 100
        },
        header: {
          authorization: "version=2022-05-01&res=products%2FI988L1s0QY&et=2066470834&method=sha1&sign=STalyy41ghlNncU9RxWM9ZChzZ4%3D"
        },
        success: (res) => {
          var _a;
          console.log(res);
          if ((_a = res.data.data) == null ? void 0 : _a.datastreams) {
            const datastreams = res.data.data.datastreams;
            const warnings = [];
            datastreams.forEach((stream) => {
              var _a2;
              const streamId = stream.id || "";
              const latestValue = parseFloat((_a2 = stream.datapoints[0]) == null ? void 0 : _a2.value);
              if (streamId.includes("SHT31_T")) {
                if (latestValue < this.tempMin || latestValue > this.tempMax) {
                  warnings.push(`设备节点${streamId} 温度不正常: ${latestValue}℃`);
                }
              } else if (streamId.includes("SHT31_H")) {
                if (latestValue < this.humiMin || latestValue > this.humiMax) {
                  warnings.push(`设备节点${streamId} 湿度不正常: ${latestValue}%`);
                }
              } else if (streamId.includes("SGP30")) {
                if (latestValue < this.carooMin || latestValue > this.carooMax) {
                  warnings.push(`设备节点${streamId} 二氧化碳浓度不正常: ${latestValue}ppm`);
                }
              }
            });
            this.warnings = warnings;
            common_vendor.index.setStorageSync("warningCount", warnings.length);
            this.sendMqttCommand(`WARN ${warnings.length}`);
          }
        },
        fail: (err) => {
          console.error("获取历史数据失败:", err);
        }
      });
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return {
    a: $data.refreshIntervalSeconds,
    b: common_vendor.o(($event) => $data.refreshIntervalSeconds = $event.detail.value),
    c: $data.tempMin,
    d: common_vendor.o(($event) => $data.tempMin = $event.detail.value),
    e: $data.tempMax,
    f: common_vendor.o(($event) => $data.tempMax = $event.detail.value),
    g: $data.humiMin,
    h: common_vendor.o(($event) => $data.humiMin = $event.detail.value),
    i: $data.humiMax,
    j: common_vendor.o(($event) => $data.humiMax = $event.detail.value),
    k: $data.carooMin,
    l: common_vendor.o(($event) => $data.carooMin = $event.detail.value),
    m: $data.carooMax,
    n: common_vendor.o(($event) => $data.carooMax = $event.detail.value),
    o: common_vendor.o((...args) => $options.saveSettings && $options.saveSettings(...args)),
    p: common_vendor.o((...args) => $options.forceRefresh && $options.forceRefresh(...args)),
    q: common_vendor.f($data.warnings, (warning, index, i0) => {
      return {
        a: common_vendor.t(warning),
        b: index
      };
    })
  };
}
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "D:/Desktop/Onenet/APP_TST/sensor_app1/pages/index/warning_page.vue"]]);
wx.createPage(MiniProgramPage);
