<template>
	<view class="wrap">
		<view class="page-title">冷库环境实时监测数据</view>
		<view class="dev-vessel">
			<!-- 温度卡片 -->
			<view v-if="loading" class="loading-placeholder"></view>
			<view v-else class="dev-card">
				<view class="dev-header">
					<view class="dev-name">温度</view>
					<image class="dev-logo" src="/static/temp-icon.png" mode=""></image>
				</view>
				<view class="dev-data">{{currentData.temp}}℃</view>
			</view>

			<!-- 湿度卡片 -->
			<view v-if="loading" class="loading-placeholder"></view>
			<view v-else class="dev-card">
				<view class="dev-header">
					<view class="dev-name">湿度</view>
					<image class="dev-logo" src="/static/humi-icon.png" mode=""></image>
				</view>
				<view class="dev-data">{{currentData.humi}}%</view>
			</view>

			<!-- 二氧化碳卡片 -->
			<view v-if="loading" class="loading-placeholder"></view>
			<view v-else class="dev-card">
				<view class="dev-header">
					<view class="dev-name">二氧化碳浓度</view>
					<image class="dev-logo" src="/static/caroo-icon.png" mode=""></image>
				</view>
				<view class="dev-data">{{currentData.caroo}}ppm</view>
			</view>
		</view>

		<!-- 刷新按钮 -->
		<button @click="fetchDevData">立即刷新</button>

		<!-- 错误提示 -->
		<view v-if="error" class="error-message">
			数据加载失败，请稍后重试
		</view>
	</view>
</template>

<script>
	const product_id = 'I988L1s0QY';
	const device_name = 'dev_l610';
	export default {
		data() {
			return {
				deviceId: '', // 存储设备ID
				currentData: {
					temp: '--',
					humi: '--',
					caroo: '--'
				},
				token: '隐私数据保密',
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
			// 同时接收设备ID和设备名称
			this.deviceId = options.deviceId;
			this.fetchDevData();
			this.refreshInterval = setInterval(() => {
				this.fetchDevData();
			}, 30000);
		},
		onUnload() {
			clearInterval(this.refreshInterval);
		},
		methods: {
			fetchDevData() {
				this.loading = true;
				this.error = false;
				// 计算时间范围：过去1小时
				const endTime = new Date();
				const startTime = new Date(endTime.getTime() - 60 * 60 * 10000*5);

				// 格式化 start 和 end 时间
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
						limit: 10000
					},
					header: {
						authorization: this.token
					},
					success: (res) => {
						console.log('历史数据获取成功:', res.data);
						this.apiDebug.response = res.data; // 保存原始响应用于调试

						if (res.data.data?.datastreams) {
							const datastreams = res.data.data.datastreams;

							// 根据设备ID动态匹配数据流
							const deviceSuffix = `_${this.deviceId}`;

							const tempStream = datastreams.find(s =>
								s.id?.includes('SHT31_T') && s.id?.endsWith(deviceSuffix)
							);

							const humiStream = datastreams.find(s =>
								s.id?.includes('SHT31_H') && s.id?.endsWith(deviceSuffix)
							);

							const carooStream = datastreams.find(s =>
								s.id?.includes("SGP30") && s.id?.endsWith(deviceSuffix)
							);
							console.log('carooStream:', carooStream);

							// 更新当前值
							this.currentData.temp = this.formatValue(tempStream?.datapoints[0]?.value);
							this.currentData.humi = this.formatValue(humiStream?.datapoints[0]?.value);
							this.currentData.caroo = this.formatValue(carooStream?.datapoints[0]?.value);
							// 打印 currentData 的值
							console.log('currentData:', this.currentData);

							// 保存解析后的数据用于调试
							this.apiDebug.parsedData = {
								tempStream,
								humiStream,
								carooStream
							};
						} else {
							console.warn('API返回数据格式不符合预期:', res.data);
							this.error = true;
						}
						this.loading = false;
					},
					fail: (err) => {
						console.error('获取历史数据失败:', err);
						this.error = true;
						this.loading = false;
					}
				});
			},
			formatValue(value) {
				// 更健壮的格式处理
				if (value === undefined || value === null) return '--';
				if (typeof value === 'string' && value.trim() === '') return '--';

				// 保留一位小数
				return parseFloat(value).toFixed(1);
			}
		}
	};
</script>

<style>
	/* 引入外部CSS */
	@import url("/css/node_page.css");
</style>