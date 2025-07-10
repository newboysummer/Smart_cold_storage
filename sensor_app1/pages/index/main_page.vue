<template>
	<view id="app">
		<view class="container">
			<!-- 顶部栏 -->
			<view class="header">
				<view class="logo">
					<view class="logo-icon pulse">
						<image class="logo-icon-next" src="/static/top_icon.png" mode=""></image>
					</view>
					<view class="logo-text">
						<text class="title">{{ title }}</text>
						<text class="subtitle">{{ subtitle }}</text>
					</view>
				</view>
				<view class="status-bar">
					<!-- <view class="status-item">
						<text class="label">设备在线</text>
						<text class="value">{{ onlineDevices }}/{{ totalDevices }}</text>
					</view> -->
					<view class="status-item">
						<text class="label">系统状态</text>
						<text class="value">{{ systemStatus }}</text>
					</view>
					<view class="status-item">
						<text class="label">网关版本</text>
						<text class="value">{{ gatewayVersion }}</text>
					</view>
				</view>
			</view>

			<!-- 主内容区 -->
			<view class="dashboard">
				<!-- 网关状态概览和设备状态在一行 -->
				<view class="card-row">
					<!-- 网关状态卡片 -->
					<view class="card">
						<view class="card-title">
							<text class="fas fa-microchip"></text>
							<text>网关状态概览</text>
						</view>
						<view class="stats-container">
							<view class="stat-item">
								<text class="stat-label">CPU 使用率</text>
								<text class="stat-value">{{ cpuUsage }}%</text>
								<text class="stat-trend">
									<text class="fas fa-arrow-down">2.5% 较昨日</text>
								</text>
							</view>
							<view class="stat-item">
								<text class="stat-label">信号强度</text>
								<text class="stat-value">{{ memoryUsage }}rssi</text>
								<text class="stat-trend">
									<text class="fas fa-arrow-up">1.2% 较昨日</text>
								</text>
							</view>
							<view class="stat-item">
								<text class="stat-label">上行数据</text>
								<text class="stat-value">{{ txByte }} KB</text>
								<text class="stat-trend">
									<text class="fas fa-arrow-up">15% 较昨日</text>
								</text>
							</view>
							<view class="stat-item">
								<text class="stat-label">下行数据</text>
								<text class="stat-value">{{ rxByte }} KB</text>
								<text class="stat-trend">
									<text class="fas fa-arrow-down">8% 较昨日</text>
								</text>
							</view>
						</view>
					</view>

					<!-- 设备状态卡片 -->
					<view class="card">
						<view class="card-title">
							<text class="fas fa-satellite-dish"></text>
							<text>设备状态</text>
						</view>
						<view class="stats-container">
							<view class="stat-item">
								<text class="stat-label">传感器总数</text>
								<text class="stat-value">{{ sensorCount }}</text>
								<text class="stat-trend">
									<text class="fas fa-plus">新增 3 个</text>
								</text>
							</view>
							<view class="stat-item">
								<text class="stat-label">制冷设备总数</text>
								<text class="stat-value">{{ actuatorCount }}</text>
								<text class="stat-trend">
									<text class="fas fa-plus">新增 1 个</text>
								</text>
							</view>
							<view class="stat-item">
								<text class="stat-label">当前告警</text>
								<text class="stat-value">{{WarningCount}}</text>
								<text class="stat-trend">
									<text class="fas fa-plus">新增{{WarningCount}}个</text>
								</text>
							</view>
						</view>
					</view>
				</view>

				<!-- 设备列表单独占一行 -->
				<view class="card">
					<view class="card-title">
						<text class="fas fa-plug"></text>
						<text>设备列表</text>
						<!-- 添加增加节点的按钮 -->
						<view class="button-group">
							<button @click="showAddDeviceModal">增加节点</button>
						</view>
					</view>
					<view class="devices-grid">
						<view v-for="device in devices" :key="device.id" class="device-card"
							@click="selectDevice(device)">
							<!-- 添加重新连接按钮 -->
							<button class="reconnect-btn" @click.stop="reconnectDevice(device)">↻</button>

							<view class="device-icon">
								<image class="device-pic" src="/static/machine.png"></image>
							</view>
							<text class="device-name">{{ device.name }}</text>
							<text :class="['device-status', device.status]">{{ device.statusText }}</text>
							<!-- 新增：删除按钮 -->
							<button class="delete-btn" @click.stop="deleteDevice(device)">x</button>
						</view>
					</view>
				</view>
			</view>

			<!-- 指令下发模态框 -->
			<view v-if="isCommandModalVisible" class="modal">
				<view class="modal-content">
					<text class="modal-title">向 {{ currentDevice?.name }} 下发指令</text>
					<input v-model="commandContent" placeholder="请输入指令字符串（最大20KB）" class="input-field" />
					<view class="timeout-setting">
						<text>超时时间：{{ timeoutSeconds }}秒</text>
					</view>
					<view class="button-group">
						<button @click="sendMqttCommand">发送指令</button>
						<button @click="hideCommandModal">取消</button>
					</view>
				</view>
			</view>

			<!-- 指令响应弹窗 -->
			<view v-if="isResponseVisible" class="modal">
				<view class="modal-content">
					<text class="modal-title">指令响应</text>
					<view class="response-info">
						<text>请求ID：{{ responseData?.request_id }}</text>
						<text>命令ID：{{ responseData?.data?.cmd_uuid }}</text>
						<text>设备应答：{{ decodedResponse }}</text>
					</view>
					<button @click="isResponseVisible = false">关闭</button>
				</view>
			</view>

			<!-- 添加设备模态框 -->
			<view v-if="isAddDeviceModalVisible" class="modal">
				<view class="modal-content">
					<text class="modal-title">添加设备</text>
					<input v-model="newDeviceId" placeholder="设备 ID" class="input-field" />
					<input v-model="newDeviceType" placeholder="设备类型" class="input-field" />
					<input v-model="newDeviceX" placeholder="X 坐标" class="input-field" />
					<input v-model="newDeviceY" placeholder="Y 坐标" class="input-field" />
					<input v-model="newDeviceZ" placeholder="Z 坐标" class="input-field" />
					<view class="button-group">
						<button @click="addDevice">确定</button>
						<button @click="hideAddDeviceModal">取消</button>
					</view>
				</view>
			</view>

			<!-- 底部导航 -->
			<view class="nav-footer">
				<view class="nav-item active">
					<text class="fas fa-home"></text>
					<text>首页</text>
				</view>
				<view class="nav-item" @click="goToDataAnalysis">
					<text class="fas fa-chart-line"></text>
					<text>数据分析</text>
				</view>
				<!-- <view class="nav-item">
					<text class="fas fa-cog"></text>
					<text>设备管理</text>
				</view> -->
				<view class="nav-item" @click="goToWarningCenter">
					<text class="fas fa-bell"></text>
					<text>告警中心</text>
				</view>
				<view class="nav-item" @click="goToPersonalCenter">
					<text class="fas fa-user"></text>
					<text>个人中心</text>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	const product_id = 'I988L1s0QY';
	const device_name = 'dev_l610';
	export default {
		data() {
			return {
				title: '工业物联网网关平台',
				subtitle: '实时监控 · 智能分析 · 高效管理',
				// onlineDevices: 3,
				totalDevices: 32,
				systemStatus: '运行中',
				gatewayVersion: 'V1.0.0',
				cpuUsage: 42,
				memoryUsage: 25,
				networkThroughput: 125,
				packetsPerSecond: 2450,
				sensorCount: 3,
				actuatorCount: 1,
				todayAlerts: 0,
				dataLatency: 28,
				devices: [{
					id: 'MACHINE',
					name: '制冷设备1',
					device_name: 'machine_node_001',
					product_id: 'I988L1s0QY',
					icon: 'fas fa-tint',
					status: 'online',
					statusText: '在线'
				}, ],
				cloudData: null,
				loading: false,
				error: false,
				isAddDeviceModalVisible: false,
				newDeviceId: '',
				newDeviceProductId: '',
				newDeviceX: '',
				newDeviceY: '',
				newDeviceZ: '',
				// 指令下发相关
				isCommandModalVisible: false,
				currentDevice: null,
				commandContent: '',
				timeoutSeconds: 15,
				isResponseVisible: false,
				responseData: null,
				decodedResponse: '',
				WarningCount: 0,
				globalRefreshInterval: null, // 全局刷新定时器
				newDeviceType: '', // 新增设备类型状态
				rxByte: 8630.91,
				txByte: 149.90
			};
		},
		onLoad() {
			this.setupGlobalRefresh();
			this.fetchDevData();

			// 添加5秒定时器
			this.dataRefreshInterval = setInterval(() => {
				this.fetchDevData();
			}, 5000);
		},
		onUnload() {
			if (this.globalRefreshInterval) {
				clearInterval(this.globalRefreshInterval);
			}
			// 清除数据刷新定时器
			if (this.dataRefreshInterval) {
				clearInterval(this.dataRefreshInterval);
			}
		},
		methods: {
			// 修改fetchDevData方法
			fetchDevData() {
				this.loading = true;
				this.error = false;
				uni.request({
					url: 'https://iot-api.heclouds.com/datapoint/current-datapoints',
					method: 'GET',
					data: {
						product_id,
						device_name
					},
					header: {
						authorization: "隐私数据保密"
					},
					success: (res) => {
						console.log("获取数据成功", res);
						// 关键修改：传入datastreams数组而非整个设备对象
						console.log(res.data.data)
						if (res.data.data?.devices?.[0]?.datastreams) {
							console.log(res.data.data.devices[0].datastreams)
							// this.processDeviceData(res.data.data.devices[0].datastreams);
						}
					},
					fail: (err) => {
						console.error('获取数据失败:', err);
						this.error = true;
						this.loading = false;
					}
				});
			},

			// 修改processDeviceData方法
			processDeviceData(datastreams) {
				if (!Array.isArray(datastreams)) return;

				let totalDevices = 0;
				let onlineDevices = 0;
				let sensorCount = 0;
				let txByte = 0;
				let rxByte = 0;
				const deviceStatusUpdates = {};

				datastreams.forEach(stream => {
					const streamId = stream.id || '';
					const value = stream.datapoints?.[0]?.value;

					// 改进状态字段匹配（不区分大小写）
					if (/^STATUS_/i.test(streamId)) {
						totalDevices++;
						const deviceId = streamId.split('_')[1]; // 提取设备ID（A/B/C等）
						const isOnline = value === "1" || value === 1;

						if (isOnline) onlineDevices++;
						if (isOnline && deviceId && /^[A-Z]$/.test(deviceId)) {
							sensorCount++;
						}

						deviceStatusUpdates[deviceId] = isOnline;
					}
					// 处理网络数据
					else if (streamId === 'TX_BYTE' || streamId === 'TX_BYTES') {
						txByte = parseInt(value || 0);
					} else if (streamId === 'RX_BYTE' || streamId === 'RX_BYTES') {
						rxByte = parseInt(value || 0);
					}
				});

				// 更新设备状态
				this.devices.forEach(device => {
					const deviceId = device.id;
					if (deviceStatusUpdates.hasOwnProperty(deviceId)) {
						const isOnline = deviceStatusUpdates[deviceId];
						device.status = isOnline ? 'online' : 'offline';
						device.statusText = isOnline ? '在线' : '离线';
					}
				});

				// 更新统计数据
				this.totalDevices = totalDevices;
				this.onlineDevices = onlineDevices;
				this.sensorCount = sensorCount;
				this.txByte = Math.round(txByte / 1024);
				this.rxByte = Math.round(rxByte / 1024);
			},
			// 添加重新连接设备的方法
			reconnectDevice(device) {
				// 发送RENEW指令
				this.sendMqttCommand(`RENEW ${device.id}`);

				// 更新设备状态为"连接中..."
				const deviceIndex = this.devices.findIndex(d => d.id === device.id);
				if (deviceIndex !== -1) {
					this.$set(this.devices, deviceIndex, {
						...device,
						status: 'online',
						statusText: '在线'
					});
				}

				// 显示操作提示
				uni.showToast({
					title: `正在重新连接 ${device.name}`,
					icon: 'loading',
					duration: 200
				});
			},

			setupGlobalRefresh() {
				// 清除现有定时器
				if (this.globalRefreshTimeout) {
					clearTimeout(this.globalRefreshTimeout);
				}

				// 从本地存储获取刷新间隔设置
				const settings = uni.getStorageSync('warningSettings') || {};
				const intervalSeconds = settings.refreshIntervalSeconds || 5;
				const interval = Math.max(1000, intervalSeconds * 1000);

				// 执行告警检查
				this.checkWarnings();

				// 设置下一次刷新
				this.globalRefreshTimeout = setTimeout(() => {
					this.setupGlobalRefresh(); // 递归调用
				}, interval);
			},

			// 全局告警检查方法
			checkWarnings() {
				const settings = uni.getStorageSync('warningSettings') || {};
				// 如果没有设置阈值，则不检查
				if (
					settings.tempMin === undefined ||
					settings.tempMax === undefined ||
					settings.humiMin === undefined ||
					settings.humiMax === undefined ||
					settings.carooMin === undefined ||
					settings.carooMax === undefined
				) {
					return;
				}

				const product_id = 'I988L1s0QY';
				const device_name = 'dev_l610';
				const endTime = new Date();
				const startTime = new Date(endTime.getTime() - 60 * 60 * 10000 * 5);

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
						authorization: 'version=2022-05-01&res=products%2FI988L1s0QY&et=2066470834&method=sha1&sign=STalyy41ghlNncU9RxWM9ZChzZ4%3D'
					},
					success: (res) => {
						console.log('全局告警检查成功:', res);
						if (res.data.data?.datastreams) {
							const datastreams = res.data.data.datastreams;
							let warningCount = 0;

							// 按类型过滤并处理所有相关数据流
							datastreams.forEach(stream => {
								const streamId = stream.id || '';
								const latestValue = parseFloat(stream.datapoints[0]?.value);

								// 温度类数据流检查
								if (streamId.includes('SHT31_T')) {
									if (latestValue < settings.tempMin || latestValue > settings
										.tempMax) {
										warningCount++;
									}
								}

								// 湿度类数据流检查
								else if (streamId.includes('SHT31_H')) {
									if (latestValue < settings.humiMin || latestValue > settings
										.humiMax) {
										warningCount++;
									}
								}

								// 二氧化碳类数据流检查
								else if (streamId.includes('SGP30')) {
									if (latestValue < settings.carooMin || latestValue > settings
										.carooMax) {
										warningCount++;
									}
								}
							});

							// 更新告警数量
							this.WarningCount = warningCount;
							uni.setStorageSync('warningCount', warningCount);

							// 通过MQTT下发告警数量
							this.sendMqttCommand(`WARN ${warningCount}`);
						}
					},
					fail: (err) => {
						console.error('全局告警检查失败:', err);
					}
				});
			},
			selectDevice(device) {
				const loginInfo = uni.getStorageSync('loginInfo');
				if (!loginInfo) {
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
				} else {
					// 判断设备类型
					if (device.name.startsWith('传感节点')) {
						// 传感节点：跳转到节点页面
						uni.navigateTo({
							url: `/pages/index/node_page?deviceId=${device.id}`
						});
					} else if (device.name.startsWith('制冷设备')) {
						// 制冷节点：弹出操作选择
						uni.showActionSheet({
							itemList: ['启动设备', '停止设备'],
							success: (res) => {
								const actionIndex = res.tapIndex;
								const deviceId = device.id;

								if (actionIndex === 0) {
									// 启动设备
									this.sendMqttCommand(`START`);
									uni.showToast({
										title: `已启动 ${device.name}`,
										icon: 'success'
									});
								} else if (actionIndex === 1) {
									// 停止设备
									this.sendMqttCommand(`STOP`);
									uni.showToast({
										title: `已停止 ${device.name}`,
										icon: 'success'
									});
								}
							}
						});
					}
				}
			},
			goToWarningCenter() {
				const loginInfo = uni.getStorageSync('loginInfo');
				if (!loginInfo) {
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
				} else {
					uni.navigateTo({
						url: '/pages/index/warning_page'
					});
				}
			},
			goToDataAnalysis() {
				const loginInfo = uni.getStorageSync('loginInfo');
				if (!loginInfo) {
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
				} else {
					uni.navigateTo({
						url: '/pages/index/data_analyze'
					});
				}
			},
			goToPersonalCenter() {
				const loginInfo = uni.getStorageSync('loginInfo');
				if (!loginInfo) {
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
				} else {
					uni.navigateTo({
						url: '/pages/index/person_page'
					});
				}
			},
			showAddDeviceModal() {
				this.isAddDeviceModalVisible = true;
			},
			hideAddDeviceModal() {
				this.isAddDeviceModalVisible = false;
				this.newDeviceId = '';
				this.newDeviceProductId = '';
				this.newDeviceX = '';
				this.newDeviceY = '';
				this.newDeviceZ = '';
			},
			addDevice() {
				if (this.newDeviceId && this.newDeviceX && this.newDeviceY && this.newDeviceZ) {
					// 根据设备类型生成不同的名称前缀
					const devicePrefix = this.newDeviceType === 'sensor' ? '传感节点' : '制冷节点';

					const newDevice = {
						id: this.newDeviceId,
						name: `${devicePrefix}${this.newDeviceId}`, // 将类型添加到名称
						device_name: `device_${this.newDeviceId}`,
						icon: 'fas fa-tint',
						status: 'online',
						statusText: '在线',
						position: {
							x: parseFloat(this.newDeviceX),
							y: parseFloat(this.newDeviceY),
							z: parseFloat(this.newDeviceZ)
						},
						type: this.newDeviceType // 保存设备类型
					};
					this.devices.push(newDevice);

					// 添加成功后发送ADD指令
					this.sendMqttCommand(`ADD ${newDevice.id}`);

					this.hideAddDeviceModal();
				} else {
					uni.showToast({
						title: '请输入完整的设备信息',
						icon: 'none'
					});
				}
			},
			// 删除设备方法
			deleteDevice(device) {
				const deviceId = device.id;
				this.devices = this.devices.filter((item) => item.id !== device.id);

				// 删除成功后发送DEL指令
				this.sendMqttCommand(`DEL ${deviceId}`);
			},
			showCommandModal(device) {
				// 检查设备是否在线
				if (device.status !== 'online') {
					uni.showToast({
						title: '设备不在线，无法下发指令',
						icon: 'none'
					});
					return;
				}
				this.currentDevice = device;
				this.commandContent = '';
				this.timeoutSeconds = 5;
				this.isCommandModalVisible = true;
			},
			hideCommandModal() {
				this.isCommandModalVisible = false;
				this.currentDevice = null;
			},
			sendMqttCommand(commandString, timeout = 5) {
				// 验证指令内容
				if (!commandString.trim()) {
					uni.showToast({
						title: '指令内容为空',
						icon: 'none'
					});
					return;
				}

				// 验证指令长度
				const commandSize = new TextEncoder().encode(commandString).length;
				if (commandSize > 20 * 1024) {
					uni.showToast({
						title: `指令内容超过20KB限制 (${(commandSize / 1024).toFixed(1)}KB)`,
						icon: 'none'
					});
					return;
				}

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
				// 显示加载提示
				// uni.showLoading({
				// 	title: '指令发送中...',
				// 	mask: true
				// });

				// 发送请求
				uni.request({
					url: apiUrl,
					method: 'POST',
					data: commandString,
					header: {
						'Content-Type': 'text/plain',
						authorization: '隐私数据保密'
					success: (res) => {
						uni.hideLoading();
						console.log('指令下发成功:');
					},
					fail: (err) => {
						uni.hideLoading();
						console.error('请求失败:', err);

						let errorMsg = '指令下发失败';
						if (err.errMsg) {
							if (err.errMsg.includes('request:fail')) {
								errorMsg += ': 网络请求失败，请检查网络连接';
							} else {
								errorMsg += `: ${err.errMsg}`;
							}
						}
						if (err.statusCode) {
							errorMsg += ` (HTTP状态码: ${err.statusCode})`;
						}

						// 显示错误提示
						uni.showModal({
							title: '错误',
							content: errorMsg,
							showCancel: false
						});
					}
				});
			},


		},
		onShow() {
			// 从本地存储读取告警数量
			const warningCount = uni.getStorageSync('warningCount');
			if (warningCount !== null && warningCount !== undefined) {
				this.WarningCount = warningCount;
			}
		}
	};
</script>

<style lang="scss" scoped>
	/* 导入 CSS 文件 */
	@import '/css/main_page.css';

	/* 添加重新连接按钮样式 */
	.reconnect-btn {
		position: absolute;
		top: 8px;
		left: 8px;
		background-color: #007aff;
		color: white;
		border: none;
		border-radius: 50%;
		width: 32px;
		height: 32px;
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 16px;
		cursor: pointer;
		box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
		z-index: 10;
		transition: all 0.2s ease;
	}

	.reconnect-btn:hover {
		background-color: #0051a8;
		transform: scale(1.1);
	}

	/* 调整设备卡片内边距，为按钮留出空间 */
	.device-card {
		position: fixed;
		padding-top: 40px;
		/* 为顶部按钮留出空间 */
	}

	.card-title {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}

	.button-group {
		display: flex;
		gap: 10px;
	}

	.modal {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.5);
		display: flex;
		justify-content: center;
		align-items: center;
		z-index: 9999;
		/* 确保在最上层 */
	}

	.modal-content {
		background-color: white;
		padding: 20px;
		border-radius: 10px;
		width: 80%;
		max-width: 300px;
	}

	.modal-title {
		font-size: 18px;
		font-weight: bold;
		margin-bottom: 10px;
		color: #007aff;
	}

	.input-field {
		width: 90%;
		padding: 10px;
		margin-bottom: 10px;
		border: 1px solid #ccc;
		border-radius: 5px;
		color: #0000ff;
	}

	/* 删除按钮样式 - 红色圆形 */
	.delete-btn {
		position: absolute;
		top: 8px;
		right: 8px;
		background-color: #ff3b30;
		color: white;
		border: none;
		border-radius: 50%;
		width: 32px;
		height: 32px;
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 20px;
		cursor: pointer;
		box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
		z-index: 10;
		transition: all 0.2s ease;
	}

	.device-card {
		position: relative;
	}

	/* 新增样式，让网关状态概览和设备状态在一行 */
	.card-row {
		display: flex;
		gap: 20px;
		margin-bottom: 20px;
	}

	.card-row .card {
		flex: 1;
	}

	/* 新增：响应式布局调整 */
	@media (max-width: 768px) {
		.card-row {
			flex-direction: column;
		}
	}

	/* 新增设备类型选择样式 */
	.device-type-selection {
		display: flex;
		align-items: center;
		margin-bottom: 15px;
	}

	.type-label {
		font-size: 14px;
		color: #333;
		margin-right: 10px;
	}

	.type-options {
		display: flex;
		gap: 10px;
	}

	.type-option {
		padding: 6px 12px;
		border: 1px solid #ddd;
		border-radius: 4px;
		font-size: 14px;
		cursor: pointer;
		transition: all 0.2s;
	}

	.type-option.selected {
		background-color: #007aff;
		color: white;
		border-color: #007aff;
	}
</style>