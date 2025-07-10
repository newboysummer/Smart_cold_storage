"use strict";
const common_vendor = require("../../common/vendor.js");
const product_id = "I988L1s0QY";
const device_name = "dev_l610";
const _sfc_main = {
  data() {
    return {
      title: "工业物联网网关平台",
      subtitle: "实时监控 · 智能分析 · 高效管理",
      // onlineDevices: 3,
      totalDevices: 32,
      systemStatus: "运行中",
      gatewayVersion: "V1.0.0",
      cpuUsage: 42,
      memoryUsage: 25,
      networkThroughput: 125,
      packetsPerSecond: 2450,
      sensorCount: 3,
      actuatorCount: 1,
      todayAlerts: 0,
      dataLatency: 28,
      devices: [{
        id: "MACHINE",
        name: "制冷设备1",
        device_name: "machine_node_001",
        product_id: "I988L1s0QY",
        icon: "fas fa-tint",
        status: "online",
        statusText: "在线"
      }],
      cloudData: null,
      loading: false,
      error: false,
      isAddDeviceModalVisible: false,
      newDeviceId: "",
      newDeviceProductId: "",
      newDeviceX: "",
      newDeviceY: "",
      newDeviceZ: "",
      // 指令下发相关
      isCommandModalVisible: false,
      currentDevice: null,
      commandContent: "",
      timeoutSeconds: 15,
      isResponseVisible: false,
      responseData: null,
      decodedResponse: "",
      WarningCount: 0,
      globalRefreshInterval: null,
      // 全局刷新定时器
      newDeviceType: "",
      // 新增设备类型状态
      rxByte: 8630.91,
      txByte: 149.9
    };
  },
  onLoad() {
    this.setupGlobalRefresh();
    this.fetchDevData();
    this.dataRefreshInterval = setInterval(() => {
      this.fetchDevData();
    }, 5e3);
  },
  onUnload() {
    if (this.globalRefreshInterval) {
      clearInterval(this.globalRefreshInterval);
    }
    if (this.dataRefreshInterval) {
      clearInterval(this.dataRefreshInterval);
    }
  },
  methods: {
    // 修改fetchDevData方法
    fetchDevData() {
      this.loading = true;
      this.error = false;
      common_vendor.index.request({
        url: "https://iot-api.heclouds.com/datapoint/current-datapoints",
        method: "GET",
        data: {
          product_id,
          device_name
        },
        header: {
          authorization: "version=2022-05-01&res=products%2FI988L1s0QY&et=2066470834&method=sha1&sign=STalyy41ghlNncU9RxWM9ZChzZ4%3D"
        },
        success: (res) => {
          var _a, _b, _c;
          console.log("获取数据成功", res);
          console.log(res.data.data);
          if ((_c = (_b = (_a = res.data.data) == null ? void 0 : _a.devices) == null ? void 0 : _b[0]) == null ? void 0 : _c.datastreams) {
            console.log(res.data.data.devices[0].datastreams);
          }
        },
        fail: (err) => {
          console.error("获取数据失败:", err);
          this.error = true;
          this.loading = false;
        }
      });
    },
    // 修改processDeviceData方法
    // processDeviceData(datastreams) {
    // 	if (!Array.isArray(datastreams)) return;
    // 	let totalDevices = 0;
    // 	let onlineDevices = 0;
    // 	let sensorCount = 0;
    // 	let txByte = 0;
    // 	let rxByte = 0;
    // 	const deviceStatusUpdates = {};
    // 	datastreams.forEach(stream => {
    // 		const streamId = stream.id || '';
    // 		const value = stream.datapoints?.[0]?.value;
    // 		// 改进状态字段匹配（不区分大小写）
    // 		if (/^STATUS_/i.test(streamId)) {
    // 			totalDevices++;
    // 			const deviceId = streamId.split('_')[1]; // 提取设备ID（A/B/C等）
    // 			const isOnline = value === "1" || value === 1;
    // 			if (isOnline) onlineDevices++;
    // 			if (isOnline && deviceId && /^[A-Z]$/.test(deviceId)) {
    // 				sensorCount++;
    // 			}
    // 			deviceStatusUpdates[deviceId] = isOnline;
    // 		}
    // 		// 处理网络数据
    // 		else if (streamId === 'TX_BYTE' || streamId === 'TX_BYTES') {
    // 			txByte = parseInt(value || 0);
    // 		} else if (streamId === 'RX_BYTE' || streamId === 'RX_BYTES') {
    // 			rxByte = parseInt(value || 0);
    // 		}
    // 	});
    // 	// 更新设备状态
    // 	this.devices.forEach(device => {
    // 		const deviceId = device.id;
    // 		if (deviceStatusUpdates.hasOwnProperty(deviceId)) {
    // 			const isOnline = deviceStatusUpdates[deviceId];
    // 			device.status = isOnline ? 'online' : 'offline';
    // 			device.statusText = isOnline ? '在线' : '离线';
    // 		}
    // 	});
    // 	// 更新统计数据
    // 	this.totalDevices = totalDevices;
    // 	this.onlineDevices = onlineDevices;
    // 	this.sensorCount = sensorCount;
    // 	this.txByte = Math.round(txByte / 1024);
    // 	this.rxByte = Math.round(rxByte / 1024);
    // },
    // 添加重新连接设备的方法
    reconnectDevice(device) {
      this.sendMqttCommand(`RENEW ${device.id}`);
      const deviceIndex = this.devices.findIndex((d) => d.id === device.id);
      if (deviceIndex !== -1) {
        this.$set(this.devices, deviceIndex, {
          ...device,
          status: "online",
          statusText: "在线"
        });
      }
      common_vendor.index.showToast({
        title: `正在重新连接 ${device.name}`,
        icon: "loading",
        duration: 200
      });
    },
    setupGlobalRefresh() {
      if (this.globalRefreshTimeout) {
        clearTimeout(this.globalRefreshTimeout);
      }
      const settings = common_vendor.index.getStorageSync("warningSettings") || {};
      const intervalSeconds = settings.refreshIntervalSeconds || 5;
      const interval = Math.max(1e3, intervalSeconds * 1e3);
      this.checkWarnings();
      this.globalRefreshTimeout = setTimeout(() => {
        this.setupGlobalRefresh();
      }, interval);
    },
    // 全局告警检查方法
    checkWarnings() {
      const settings = common_vendor.index.getStorageSync("warningSettings") || {};
      if (settings.tempMin === void 0 || settings.tempMax === void 0 || settings.humiMin === void 0 || settings.humiMax === void 0 || settings.carooMin === void 0 || settings.carooMax === void 0) {
        return;
      }
      const product_id2 = "I988L1s0QY";
      const device_name2 = "dev_l610";
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
          product_id: product_id2,
          device_name: device_name2,
          start,
          end,
          limit: 100
        },
        header: {
          authorization: "version=2022-05-01&res=products%2FI988L1s0QY&et=2066470834&method=sha1&sign=STalyy41ghlNncU9RxWM9ZChzZ4%3D"
        },
        success: (res) => {
          var _a;
          console.log("全局告警检查成功:", res);
          if ((_a = res.data.data) == null ? void 0 : _a.datastreams) {
            const datastreams = res.data.data.datastreams;
            let warningCount = 0;
            datastreams.forEach((stream) => {
              var _a2;
              const streamId = stream.id || "";
              const latestValue = parseFloat((_a2 = stream.datapoints[0]) == null ? void 0 : _a2.value);
              if (streamId.includes("SHT31_T")) {
                if (latestValue < settings.tempMin || latestValue > settings.tempMax) {
                  warningCount++;
                }
              } else if (streamId.includes("SHT31_H")) {
                if (latestValue < settings.humiMin || latestValue > settings.humiMax) {
                  warningCount++;
                }
              } else if (streamId.includes("SGP30")) {
                if (latestValue < settings.carooMin || latestValue > settings.carooMax) {
                  warningCount++;
                }
              }
            });
            this.WarningCount = warningCount;
            common_vendor.index.setStorageSync("warningCount", warningCount);
            this.sendMqttCommand(`WARN ${warningCount}`);
          }
        },
        fail: (err) => {
          console.error("全局告警检查失败:", err);
        }
      });
    },
    selectDevice(device) {
      const loginInfo = common_vendor.index.getStorageSync("loginInfo");
      if (!loginInfo) {
        common_vendor.index.showModal({
          title: "提示",
          content: "您还未登录，请先登录。",
          confirmText: "去登录",
          success: (res) => {
            if (res.confirm) {
              common_vendor.index.navigateTo({
                url: "/pages/index/person_page"
              });
            }
          }
        });
      } else {
        if (device.name.startsWith("传感节点")) {
          common_vendor.index.navigateTo({
            url: `/pages/index/node_page?deviceId=${device.id}`
          });
        } else if (device.name.startsWith("制冷设备")) {
          common_vendor.index.showActionSheet({
            itemList: ["启动设备", "停止设备"],
            success: (res) => {
              const actionIndex = res.tapIndex;
              device.id;
              if (actionIndex === 0) {
                this.sendMqttCommand(`START`);
                common_vendor.index.showToast({
                  title: `已启动 ${device.name}`,
                  icon: "success"
                });
              } else if (actionIndex === 1) {
                this.sendMqttCommand(`STOP`);
                common_vendor.index.showToast({
                  title: `已停止 ${device.name}`,
                  icon: "success"
                });
              }
            }
          });
        }
      }
    },
    goToWarningCenter() {
      const loginInfo = common_vendor.index.getStorageSync("loginInfo");
      if (!loginInfo) {
        common_vendor.index.showModal({
          title: "提示",
          content: "您还未登录，请先登录。",
          confirmText: "去登录",
          success: (res) => {
            if (res.confirm) {
              common_vendor.index.navigateTo({
                url: "/pages/index/person_page"
              });
            }
          }
        });
      } else {
        common_vendor.index.navigateTo({
          url: "/pages/index/warning_page"
        });
      }
    },
    goToDataAnalysis() {
      const loginInfo = common_vendor.index.getStorageSync("loginInfo");
      if (!loginInfo) {
        common_vendor.index.showModal({
          title: "提示",
          content: "您还未登录，请先登录。",
          confirmText: "去登录",
          success: (res) => {
            if (res.confirm) {
              common_vendor.index.navigateTo({
                url: "/pages/index/person_page"
              });
            }
          }
        });
      } else {
        common_vendor.index.navigateTo({
          url: "/pages/index/data_analyze"
        });
      }
    },
    goToPersonalCenter() {
      const loginInfo = common_vendor.index.getStorageSync("loginInfo");
      if (!loginInfo) {
        common_vendor.index.showModal({
          title: "提示",
          content: "您还未登录，请先登录。",
          confirmText: "去登录",
          success: (res) => {
            if (res.confirm) {
              common_vendor.index.navigateTo({
                url: "/pages/index/person_page"
              });
            }
          }
        });
      } else {
        common_vendor.index.navigateTo({
          url: "/pages/index/person_page"
        });
      }
    },
    showAddDeviceModal() {
      this.isAddDeviceModalVisible = true;
    },
    hideAddDeviceModal() {
      this.isAddDeviceModalVisible = false;
      this.newDeviceId = "";
      this.newDeviceProductId = "";
      this.newDeviceX = "";
      this.newDeviceY = "";
      this.newDeviceZ = "";
    },
    addDevice() {
      if (this.newDeviceId && this.newDeviceX && this.newDeviceY && this.newDeviceZ) {
        const devicePrefix = this.newDeviceType === "sensor" ? "传感节点" : "制冷节点";
        const newDevice = {
          id: this.newDeviceId,
          name: `${devicePrefix}${this.newDeviceId}`,
          // 将类型添加到名称
          device_name: `device_${this.newDeviceId}`,
          icon: "fas fa-tint",
          status: "online",
          statusText: "在线",
          position: {
            x: parseFloat(this.newDeviceX),
            y: parseFloat(this.newDeviceY),
            z: parseFloat(this.newDeviceZ)
          },
          type: this.newDeviceType
          // 保存设备类型
        };
        this.devices.push(newDevice);
        this.sendMqttCommand(`ADD ${newDevice.id}`);
        this.hideAddDeviceModal();
      } else {
        common_vendor.index.showToast({
          title: "请输入完整的设备信息",
          icon: "none"
        });
      }
    },
    // 删除设备方法
    deleteDevice(device) {
      const deviceId = device.id;
      this.devices = this.devices.filter((item) => item.id !== device.id);
      this.sendMqttCommand(`DEL ${deviceId}`);
    },
    showCommandModal(device) {
      if (device.status !== "online") {
        common_vendor.index.showToast({
          title: "设备不在线，无法下发指令",
          icon: "none"
        });
        return;
      }
      this.currentDevice = device;
      this.commandContent = "";
      this.timeoutSeconds = 5;
      this.isCommandModalVisible = true;
    },
    hideCommandModal() {
      this.isCommandModalVisible = false;
      this.currentDevice = null;
    },
    sendMqttCommand(commandString, timeout = 5) {
      if (!commandString.trim()) {
        common_vendor.index.showToast({
          title: "指令内容为空",
          icon: "none"
        });
        return;
      }
      const commandSize = new TextEncoder().encode(commandString).length;
      if (commandSize > 20 * 1024) {
        common_vendor.index.showToast({
          title: `指令内容超过20KB限制 (${(commandSize / 1024).toFixed(1)}KB)`,
          icon: "none"
        });
        return;
      }
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
        success: (res) => {
          common_vendor.index.hideLoading();
          console.log("指令下发成功:");
        },
        fail: (err) => {
          common_vendor.index.hideLoading();
          console.error("请求失败:", err);
          let errorMsg = "指令下发失败";
          if (err.errMsg) {
            if (err.errMsg.includes("request:fail")) {
              errorMsg += ": 网络请求失败，请检查网络连接";
            } else {
              errorMsg += `: ${err.errMsg}`;
            }
          }
          if (err.statusCode) {
            errorMsg += ` (HTTP状态码: ${err.statusCode})`;
          }
          common_vendor.index.showModal({
            title: "错误",
            content: errorMsg,
            showCancel: false
          });
        }
      });
    }
  },
  onShow() {
    const warningCount = common_vendor.index.getStorageSync("warningCount");
    if (warningCount !== null && warningCount !== void 0) {
      this.WarningCount = warningCount;
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  var _a, _b, _c, _d;
  return common_vendor.e({
    a: common_vendor.t($data.title),
    b: common_vendor.t($data.subtitle),
    c: common_vendor.t($data.systemStatus),
    d: common_vendor.t($data.gatewayVersion),
    e: common_vendor.t($data.cpuUsage),
    f: common_vendor.t($data.memoryUsage),
    g: common_vendor.t($data.txByte),
    h: common_vendor.t($data.rxByte),
    i: common_vendor.t($data.sensorCount),
    j: common_vendor.t($data.actuatorCount),
    k: common_vendor.t($data.WarningCount),
    l: common_vendor.t($data.WarningCount),
    m: common_vendor.o((...args) => $options.showAddDeviceModal && $options.showAddDeviceModal(...args)),
    n: common_vendor.f($data.devices, (device, k0, i0) => {
      return {
        a: common_vendor.o(($event) => $options.reconnectDevice(device), device.id),
        b: common_vendor.t(device.name),
        c: common_vendor.t(device.statusText),
        d: common_vendor.n(device.status),
        e: common_vendor.o(($event) => $options.deleteDevice(device), device.id),
        f: device.id,
        g: common_vendor.o(($event) => $options.selectDevice(device), device.id)
      };
    }),
    o: $data.isCommandModalVisible
  }, $data.isCommandModalVisible ? {
    p: common_vendor.t((_a = $data.currentDevice) == null ? void 0 : _a.name),
    q: $data.commandContent,
    r: common_vendor.o(($event) => $data.commandContent = $event.detail.value),
    s: common_vendor.t($data.timeoutSeconds),
    t: common_vendor.o((...args) => $options.sendMqttCommand && $options.sendMqttCommand(...args)),
    v: common_vendor.o((...args) => $options.hideCommandModal && $options.hideCommandModal(...args))
  } : {}, {
    w: $data.isResponseVisible
  }, $data.isResponseVisible ? {
    x: common_vendor.t((_b = $data.responseData) == null ? void 0 : _b.request_id),
    y: common_vendor.t((_d = (_c = $data.responseData) == null ? void 0 : _c.data) == null ? void 0 : _d.cmd_uuid),
    z: common_vendor.t($data.decodedResponse),
    A: common_vendor.o(($event) => $data.isResponseVisible = false)
  } : {}, {
    B: $data.isAddDeviceModalVisible
  }, $data.isAddDeviceModalVisible ? {
    C: $data.newDeviceId,
    D: common_vendor.o(($event) => $data.newDeviceId = $event.detail.value),
    E: $data.newDeviceType,
    F: common_vendor.o(($event) => $data.newDeviceType = $event.detail.value),
    G: $data.newDeviceX,
    H: common_vendor.o(($event) => $data.newDeviceX = $event.detail.value),
    I: $data.newDeviceY,
    J: common_vendor.o(($event) => $data.newDeviceY = $event.detail.value),
    K: $data.newDeviceZ,
    L: common_vendor.o(($event) => $data.newDeviceZ = $event.detail.value),
    M: common_vendor.o((...args) => $options.addDevice && $options.addDevice(...args)),
    N: common_vendor.o((...args) => $options.hideAddDeviceModal && $options.hideAddDeviceModal(...args))
  } : {}, {
    O: common_vendor.o((...args) => $options.goToDataAnalysis && $options.goToDataAnalysis(...args)),
    P: common_vendor.o((...args) => $options.goToWarningCenter && $options.goToWarningCenter(...args)),
    Q: common_vendor.o((...args) => $options.goToPersonalCenter && $options.goToPersonalCenter(...args))
  });
}
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__scopeId", "data-v-c123d1d3"], ["__file", "D:/Desktop/Onenet/APP_TST/sensor_app1/pages/index/main_page.vue"]]);
wx.createPage(MiniProgramPage);
