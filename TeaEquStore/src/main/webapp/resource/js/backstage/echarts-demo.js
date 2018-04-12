$(document).ready(function() {
	
})

$(function() {
	var xdata = [];
	var ydata = [];
	// 商品类目占比销售总数
	var pieChart = echarts.init(document.getElementById("echarts-pie-chart"));
	var pieoption = {
		tooltip : {
			trigger : 'item',
			formatter : "{a} <br/>{b} : {c} ({d}%)"
		},
		legend : {
			x : 'center',
			y : 'bottom',
			data : [ '总题数', '答对数' ]
		},
		calculable : true,
		series : [ {
			name : '数据',
			type : 'pie',
			radius : '55%',
			center : [ '50%', '40%' ],
			data : [ {
				value : 5,
				name : '总题数'
			}, {
				value : 3,
				name : '答对数'
			}, ]
		} ]
	};
	pieChart.setOption(pieoption);
	$(window).resize(pieChart.resize);

	
	
	
	
	$.ajax({
		url : ctx + "/backgoods/echarts",
		type : 'post',
		dataType : "json",
		data : {
			
		},
		success : function(data) {
			if (data.success) {
				xdata = [];
				ydata = [];
				for (var i = 0; i < data.list.length; i++) {
					var item = data.list[i];
					xdata.push(item.equName);
					ydata.push({
						value : item.sellNumber,
						name : item.equName
					});
				}
				pieChart.setOption({
					legend : {
						data : xdata
					},
					series : [ {
						name : '数据',
						data : ydata
					} ]
				});
			}
		}
	});
	/*
	 * //分销商订单占总单量 var barChart =
	 * echarts.init(document.getElementById("echarts-bar-chart")); var baroption = {
	 * tooltip : { trigger: 'item', formatter: "{a} <br/>{b} : {c} ({d}%)" },
	 * legend: { orient : 'vertical', x : 'left',
	 * data:['rose1','rose2','rose3','rose4','rose5','rose6','rose7','rose8'] },
	 * calculable : true, series : [ { name:'数据', type:'pie', radius : [20, 60],
	 * center : ['60%', '65%'], roseType : 'radius', data:[ {value:10,
	 * name:'rose1'}, {value:5, name:'rose2'}, {value:15, name:'rose3'},
	 * {value:25, name:'rose4'}, {value:20, name:'rose5'}, {value:35,
	 * name:'rose6'}, {value:30, name:'rose7'}, {value:40, name:'rose8'} ] } ] };
	 * 
	 * barChart.setOption(baroption); $(window).resize(barChart.resize);
	 */

	function gd(year, month, day) {
		return new Date(year, month - 1, day).getTime();
	}

	// 上一个月
	$(".time-left").click(function() {
		var _parent = $(this).parent(".ibox-tools");
		var type = _parent.attr("data-type");
		var time = _parent.find(".time-value").text() + "-01";
		time = getPreMonth(time);

		var arr = time.split('-');
		var year = arr[0]; // 获取当前日期的年份
		var month = arr[1]; // 获取当前日期的月份
		monthStr = year + "-" + month;
		_parent.find(".time-value").text(monthStr);
		loadData(monthStr, type);
	});

	// 下一个月
	$(".time-right").click(function() {
		var _parent = $(this).parent(".ibox-tools");
		var type = _parent.attr("data-type");
		var time = _parent.find(".time-value").text() + "-01";
		time = getNextMonth(time);
		var arr = time.split('-');
		var year = arr[0]; // 获取当前日期的年份
		var month = arr[1]; // 获取当前日期的月份
		monthStr = year + "-" + month;
		_parent.find(".time-value").text(monthStr);
		loadData(monthStr, type);
	});
	var now = new Date();
	var monthStr = now.getFullYear() + '-' + (now.getMonth() <= 8 ? '0' : '') + (now.getMonth() + 1);
	$(".time-value").text(monthStr);
	loadData(monthStr, 1);
	loadData(monthStr, 3);
	function loadData(time, type) {
		if (type == 1) {
			// 商品类目占比
			$.ajax({
				url : ctx + "/admin/exam/exam-chart",
				type : 'post',
				dataType : "json",
				data : {
					time : time
				},
				success : function(data) {
					if (data.success) {
						xdata = [];
						ydata = [];
						for (var i = 0; i < data.list.length; i++) {
							var item = data.list[i];
							xdata.push(item.name);

							ydata.push({
								value : item.value,
								name : item.name
							});
						}
						pieChart.setOption({
							legend : {
								data : xdata
							},
							series : [ {
								name : '数据',
								data : ydata
							} ]
						});
					}
				}
			});

		} else if (type == 3) {
			// 月度销售趋势

			$.ajax({
				url : ctx + "/admin/orderInfo/list-monthOrder",
				type : 'post',
				dataType : "json",
				data : {
					time : time
				},
				success : function(data) {
					if (data.success) {

						// 月度销售趋势图
						var data2 = [];
						var data3 = [];
						for (var i = 0; i < data.list.length; i++) {
							var item = data.list[i];
							data2.push([ gd(item.year, item.month, item.day), item.payCount ]);
							data3.push([ gd(item.year, item.month, item.day), item.count ]);
						}

						var dataset = [ {
							label : "订单数",
							data : data3,
							color : "#1ab394",
							bars : {
								show : true,
								align : "center",
								barWidth : 24 * 60 * 60 * 600,
								lineWidth : 0
							}

						}, {
							label : "付款数",
							data : data2,
							yaxis : 2,
							color : "#464f88",
							lines : {
								lineWidth : 1,
								show : true,
								fill : true,
								fillColor : {
									colors : [ {
										opacity : 0.2
									}, {
										opacity : 0.2
									} ]
								}
							},
							splines : {
								show : false,
								tension : 0.6,
								lineWidth : 1,
								fill : 0.1
							},
						} ];

						var options = {
							xaxis : {
								mode : "time",
								tickSize : [ 3, "day" ],
								tickLength : 0,
								axisLabel : "Date",
								axisLabelUseCanvas : true,
								axisLabelFontSizePixels : 12,
								axisLabelFontFamily : 'Arial',
								axisLabelPadding : 10,
								color : "#838383"
							},
							yaxes : [ {
								position : "left",
								color : "#838383",
								axisLabelUseCanvas : true,
								axisLabelFontSizePixels : 12,
								axisLabelFontFamily : 'Arial',
								axisLabelPadding : 3
							}, {
								position : "right",
								clolor : "#838383",
								axisLabelUseCanvas : true,
								axisLabelFontSizePixels : 12,
								axisLabelFontFamily : ' Arial',
								axisLabelPadding : 67
							} ],
							legend : {
								noColumns : 1,
								labelBoxBorderColor : "#000000",
								position : "nw"
							},
							grid : {
								hoverable : false,
								borderWidth : 0,
								color : '#838383'
							}
						};

						$.plot($("#flot-dashboard-chart"), dataset, options);

					}
				}
			});
		}
	}
});
