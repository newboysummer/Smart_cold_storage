"use strict";
const common_vendor = require("../../common/vendor.js");
const product_id = "I988L1s0QY";
const device_name = "dev_l610";
const _sfc_main = {
  data() {
    return {
      deviceId: "",
      // 存储设备ID
      currentData: {
        temp: "--",
        humi: "--",
        caroo: "--"
      },
      token: "version=2022-05-01&res=products%2FI988L1s0QY&et=2066470834&method=sha1&sign=STalyy41ghlNncU9RxWM9ZChzZ4%3D",
      loading: true,
      error: false,
      refreshInterval: null,
      // 用于调试的数据结构
      apiDebug: {
        response: null,
        parsedData: null
      }
    };
  },
  onLoad(options) {
    this.deviceId = options.deviceId;
    this.fetchDevData();
    this.refreshInterval = setInterval(() => {
      this.fetchDevData();
    }, 3e4);
  },
  onUnload() {
    clearInterval(this.refreshInterval);
  },
  methods: {
    fetchDevData() {
      this.loading = true;
      this.error = false;
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
          limit: 1e4
        },
        header: {
          authorization: this.token
        },
        success: (res) => {
          var _a, _b, _c, _d;
          console.log("历史数据获取成功:", res.data);
          this.apiDebug.response = res.data;
          if ((_a = res.data.data) == null ? void 0 : _a.datastreams) {
            const datastreams = res.data.data.datastreams;
            const deviceSuffix = `_${this.deviceId}`;
            const tempStream = datastreams.find(
              (s) => {
                var _a2, _b2;
                return ((_a2 = s.id) == null ? void 0 : _a2.includes("SHT31_T")) && ((_b2 = s.id) == null ? void 0 : _b2.endsWith(deviceSuffix));
              }
            );
            const humiStream = datastreams.find(
              (s) => {
                var _a2, _b2;
                return ((_a2 = s.id) == null ? void 0 : _a2.includes("SHT31_H")) && ((_b2 = s.id) == null ? void 0 : _b2.endsWith(deviceSuffix));
              }
            );
            const carooStream = datastreams.find(
              (s) => {
                var _a2, _b2;
                return ((_a2 = s.id) == null ? void 0 : _a2.includes("SGP30")) && ((_b2 = s.id) == null ? void 0 : _b2.endsWith(deviceSuffix));
              }
            );
            console.log("carooStream:", carooStream);
            this.currentData.temp = this.formatValue((_b = tempStream == null ? void 0 : tempStream.datapoints[0]) == null ? void 0 : _b.value);
            this.currentData.humi = this.formatValue((_c = humiStream == null ? void 0 : humiStream.datapoints[0]) == null ? void 0 : _c.value);
            this.currentData.caroo = this.formatValue((_d = carooStream == null ? void 0 : carooStream.datapoints[0]) == null ? void 0 : _d.value);
            console.log("currentData:", this.currentData);
            this.apiDebug.parsedData = {
              tempStream,
              humiStream,
              carooStream
            };
          } else {
            console.warn("API返回数据格式不符合预期:", res.data);
            this.error = true;
          }
          this.loading = false;
        },
        fail: (err) => {
          console.error("获取历史数据失败:", err);
          this.error = true;
          this.loading = false;
        }
      });
    },
    formatValue(value) {
      if (value === void 0 || value === null)
        return "--";
      if (typeof value === "string" && value.trim() === "")
        return "--";
      return parseFloat(value).toFixed(1);
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return common_vendor.e({
    a: $data.loading
  }, $data.loading ? {} : {
    b: common_vendor.t($data.currentData.temp)
  }, {
    c: $data.loading
  }, $data.loading ? {} : {
    d: common_vendor.t($data.currentData.humi)
  }, {
    e: $data.loading
  }, $data.loading ? {} : {
    f: common_vendor.t($data.currentData.caroo)
  }, {
    g: common_vendor.o((...args) => $options.fetchDevData && $options.fetchDevData(...args)),
    h: $data.error
  }, $data.error ? {} : {});
}
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "D:/Desktop/Onenet/APP_TST/sensor_app1/pages/index/node_page.vue"]]);
wx.createPage(MiniProgramPage);
