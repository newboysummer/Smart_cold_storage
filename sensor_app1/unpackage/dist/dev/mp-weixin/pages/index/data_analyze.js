"use strict";
const common_vendor = require("../../common/vendor.js");
const isH5 = false;
const isWeapp = true;
const isApp = false;
const product_id = "I988L1s0QY";
const _sfc_main = {
  data() {
    return {
      token: "version=2022-05-01&res=products%2FI988L1s0QY&et=2066470834&method=sha1&sign=STalyy41ghlNncU9RxWM9ZChzZ4%3D",
      loading: true,
      error: false,
      refreshInterval: null,
      // 设备列表数据
      deviceList: ["A", "B", "C"],
      // 示例设备列表，实际设备名称
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
    this.deviceList.forEach((device) => {
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
    }, 3e4);
  },
  onUnload() {
    clearInterval(this.refreshInterval);
    if (this.resizeTimer) {
      clearTimeout(this.resizeTimer);
    }
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
      const promises = this.deviceList.map((device) => {
        return this.fetchDeviceData(device);
      });
      Promise.all(promises).then(() => {
        this.drawCharts();
        this.loading = false;
      }).catch((err) => {
        console.error("获取数据失败:", err);
        this.error = true;
        this.loading = false;
      });
    },
    fetchDeviceData(device) {
      return new Promise((resolve, reject) => {
        const endTime = /* @__PURE__ */ new Date();
        const startTime = new Date(endTime.getTime() - 24 * 60 * 60 * 1e3 * 5);
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
            device_name: "dev_l610",
            start,
            end,
            limit: 100
          },
          header: {
            authorization: this.token
          },
          success: (res) => {
            var _a;
            console.log(`设备 ${device} 历史数据获取成功:`, res.data);
            if ((_a = res.data.data) == null ? void 0 : _a.datastreams) {
              const datastreams = res.data.data.datastreams;
              const tempStream = datastreams.find((s) => s.id === `SHT31_T_${device}`);
              const humiStream = datastreams.find((s) => s.id === `SHT31_H_${device}`);
              const carooStream = datastreams.find((s) => s.id === `SGP30_${device}`);
              const deviceData = {
                tempData: (tempStream == null ? void 0 : tempStream.datapoints.map((point) => parseFloat(point.value))) || [],
                humiData: (humiStream == null ? void 0 : humiStream.datapoints.map((point) => parseFloat(point.value))) || [],
                carooData: (carooStream == null ? void 0 : carooStream.datapoints.map((point) => parseFloat(point.value))) || [],
                timeData: (tempStream == null ? void 0 : tempStream.datapoints.map((point) => new Date(point.at).toLocaleTimeString())) || []
              };
              this.$set(this.deviceData, device, deviceData);
              resolve();
            } else {
              console.warn("API返回数据格式不符合预期:", res.data);
              reject(new Error("数据格式错误"));
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
      this.disposeCharts();
      {
        this.initChartsForMiniProgram();
      }
    },
    initChartsForH5() {
      this.charts.tempChart = common_vendor.init(document.getElementById("temp-chart"));
      this.charts.humiChart = common_vendor.init(document.getElementById("humi-chart"));
      this.charts.carooChart = common_vendor.init(document.getElementById("caroo-chart"));
      this.setChartOptions();
    },
    initChartsForMiniProgram() {
      common_vendor.index.createSelectorQuery().in(this).select(".temp-chart-container").boundingClientRect((rect) => {
        if (!rect)
          return;
        const tempCtx = common_vendor.index.createCanvasContext("temp-chart", this);
        this.charts.tempChart = common_vendor.init(tempCtx, null, {
          width: rect.width,
          height: rect.height,
          renderer: "canvas"
        });
        common_vendor.index.createSelectorQuery().in(this).select(".humi-chart-container").boundingClientRect((humiRect) => {
          if (!humiRect)
            return;
          const humiCtx = common_vendor.index.createCanvasContext("humi-chart", this);
          this.charts.humiChart = common_vendor.init(humiCtx, null, {
            width: humiRect.width,
            height: humiRect.height,
            renderer: "canvas"
          });
          common_vendor.index.createSelectorQuery().in(this).select(".caroo-chart-container").boundingClientRect((carooRect) => {
            if (!carooRect)
              return;
            const carooCtx = common_vendor.index.createCanvasContext("caroo-chart", this);
            this.charts.carooChart = common_vendor.init(carooCtx, null, {
              width: carooRect.width,
              height: carooRect.height,
              renderer: "canvas"
            });
            this.setChartOptions();
          }).exec();
        }).exec();
      }).exec();
    },
    setChartOptions() {
      const { tempChart, humiChart, carooChart } = this.charts;
      const device = this.currentDevice;
      const deviceData = this.currentDeviceData;
      if (!tempChart || !humiChart || !carooChart)
        return;
      const tempOption = {
        title: {
          text: `设备 ${device} - 温度变化趋势`,
          left: "center"
        },
        tooltip: {
          trigger: "axis",
          formatter: "{b}<br/>温度: {c}°C"
        },
        grid: {
          left: "3%",
          right: "4%",
          bottom: "3%",
          containLabel: true
        },
        xAxis: {
          type: "category",
          boundaryGap: false,
          data: deviceData.timeData
        },
        yAxis: {
          type: "value",
          name: "温度(°C)"
        },
        series: [{
          name: "温度",
          data: deviceData.tempData,
          type: "line",
          color: "#ef4444",
          smooth: true,
          symbol: "circle",
          symbolSize: 6,
          areaStyle: {}
        }]
      };
      tempChart.setOption(tempOption);
      const humiOption = {
        title: {
          text: `设备 ${device} - 湿度变化趋势`,
          left: "center"
        },
        tooltip: {
          trigger: "axis",
          formatter: "{b}<br/>湿度: {c}%"
        },
        grid: {
          left: "3%",
          right: "4%",
          bottom: "3%",
          containLabel: true
        },
        xAxis: {
          type: "category",
          boundaryGap: false,
          data: deviceData.timeData
        },
        yAxis: {
          type: "value",
          name: "湿度(%)"
        },
        series: [{
          name: "湿度",
          data: deviceData.humiData,
          type: "line",
          color: "#3b82f6",
          smooth: true,
          symbol: "circle",
          symbolSize: 6,
          areaStyle: {}
        }]
      };
      humiChart.setOption(humiOption);
      const carooOption = {
        title: {
          text: `设备 ${device} - 二氧化碳浓度变化趋势`,
          left: "center"
        },
        tooltip: {
          trigger: "axis",
          formatter: "{b}<br/>CO₂: {c} ppm"
        },
        grid: {
          left: "3%",
          right: "4%",
          bottom: "3%",
          containLabel: true
        },
        xAxis: {
          type: "category",
          boundaryGap: false,
          data: deviceData.timeData
        },
        yAxis: {
          type: "value",
          name: "CO₂(ppm)"
        },
        series: [{
          name: "CO₂",
          data: deviceData.carooData,
          type: "line",
          color: "#10b981",
          smooth: true,
          symbol: "circle",
          symbolSize: 6,
          areaStyle: {}
        }]
      };
      carooChart.setOption(carooOption);
    },
    handleResize() {
      if (this.resizeTimer) {
        clearTimeout(this.resizeTimer);
      }
      this.resizeTimer = setTimeout(() => {
        this.resizeCharts();
      }, 300);
    },
    resizeCharts() {
      const { tempChart, humiChart, carooChart } = this.charts;
      if (!tempChart || !humiChart || !carooChart)
        return;
      {
        common_vendor.index.createSelectorQuery().in(this).select(".temp-chart-container").boundingClientRect((rect) => {
          if (rect)
            tempChart.resize({ width: rect.width, height: rect.height });
        }).exec();
        common_vendor.index.createSelectorQuery().in(this).select(".humi-chart-container").boundingClientRect((rect) => {
          if (rect)
            humiChart.resize({ width: rect.width, height: rect.height });
        }).exec();
        common_vendor.index.createSelectorQuery().in(this).select(".caroo-chart-container").boundingClientRect((rect) => {
          if (rect)
            carooChart.resize({ width: rect.width, height: rect.height });
        }).exec();
      }
    },
    disposeCharts() {
      const { tempChart, humiChart, carooChart } = this.charts;
      if (tempChart)
        tempChart.dispose();
      if (humiChart)
        humiChart.dispose();
      if (carooChart)
        carooChart.dispose();
      this.charts = {
        tempChart: null,
        humiChart: null,
        carooChart: null
      };
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return common_vendor.e({
    a: common_vendor.t($data.deviceList[$data.currentDeviceIndex]),
    b: common_vendor.o((...args) => $options.onDeviceChange && $options.onDeviceChange(...args)),
    c: $data.currentDeviceIndex,
    d: $data.deviceList,
    e: $options.isWeapp || $options.isApp
  }, $options.isWeapp || $options.isApp ? {} : {}, {
    f: $options.isWeapp || $options.isApp
  }, $options.isWeapp || $options.isApp ? {} : {}, {
    g: $options.isWeapp || $options.isApp
  }, $options.isWeapp || $options.isApp ? {} : {}, {
    h: common_vendor.o((...args) => $options.fetchData && $options.fetchData(...args)),
    i: $data.error
  }, $data.error ? {} : {});
}
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__scopeId", "data-v-dad362b1"], ["__file", "D:/Desktop/Onenet/APP_TST/sensor_app1/pages/index/data_analyze.vue"]]);
wx.createPage(MiniProgramPage);
