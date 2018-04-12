	var datatable;
	var condJsonData = {
		productName:'',
		productTypeId:'',
		aoData : null
	};
	var j=0;
		function goListOrder(){
			location.href = ctx + "/admin/orderInfo/go/list-order";
		}
		/*$("#deliver").click(function(){
			$("#myModal").modal("show");
		});*/
		function deliver(orderId){
			//弹框初始化
			$("#all").click();
			$(".radio-inline #batches").attr("disabled",false);
			$(".product-table tbody tr").remove();
			$("#orderId").val(orderId);
			
			$.ajax({
		       	url: ctx + "/admin/orderInfo/get-order-product-quantity",
		           dataType: "json",
		           type: "post",
		           data: {
		               id: orderId,
		           },
		           success: function(data) {
		           	if(data.success){
		           		$("#myModal").modal("show");
		           		if(data.number==1){
		           			//console.log("123")
		           			$(".radio-inline #batches").attr("disabled","disabled");
		           		}
		           	}
		           },
		           error: function(text) {
		           	layer.msg("failed");
		           }
		   		});	
		}
		
		$("#all").click(function(){
			$(".all").show();
			$(".batches").hide();
		})
		$("#batches").click(function(){
			$(".batches").show();
			$(".all").hide();
		})
		$("#newPackage").click(function(){
			$("#add-product-modal").modal("show");
			$(".i-checks").show();
			loadData(condJsonData);
		});
		//全选/全不选
	    function selectAll(_this){
	    	var $this=$(_this);
	    	if($this.prop("checked")){
	    		$("input[name='productId']").prop("checked",true);
	    	}else{
	    		$("input[name='productId']").prop("checked",false);
	    	}
	    }
		 //搜索
	    $('#product-search').click(function() {
	        condJsonData['productTypeId'] = $("#productTypeId").val();
	        condJsonData['productName'] = $("#productName").val();
	        loadData(condJsonData);
	    });
		 
	    function loadData(condJsonData) {
			if (datatable) {
				datatable.destroy();
			}
			
			var proJson = {};
    		$(".product-table tbody tr").each(function(){
    			var itemId = $(this).find("td:eq(0) input[type='hidden']").val();
    			var quantity = $(this).find("td:eq(2) input[type='hidden']").val();
    			
    			var itemArray = itemId.split(",");
    			var quantityArray = quantity.split(",");
    			for(var i = 0; i < itemArray.length; i++){
    				itemId = itemArray[i];
    				quantity = quantityArray[i];
    				if(proJson[itemId] == undefined){
        				proJson[itemId] = quantity;
        			}else{
        				proJson[itemId] = parseFloat(quantity) + parseFloat(proJson[itemId]);
        			}
    			}
    		});
			
			var orderId = $("#orderId").val(); 
			datatable = $('.select-product-table').DataTable({
	 				"bLengthChange" : false,//去掉每页多少条框体
					"bFilter" : false,
					"serverSide" : true,
					"processing" : false,
					"pagingType":   "full_numbers",
					"ajax" : {
						"async" : true,
						"url" : ctx + "/admin/orderInfo/list-product-pool?orderId="+orderId,
						"type" : "post",
						"data" : condJsonData,
					},
					"ordering":false,
					"columns":[
					           	{"data" : "id",
					           		"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
				                    	var html = '';
				                    	  html+='<div class="checkbox-inline ids "><input type="checkbox" class="selected" value="'+sData+'" name="productId"></div>';
			   		                    $(nTd).html(html);
			    		        	   }
					           	},
			        	        {"data" : "productTypeNames" },
			        	        {"data" : "productSerial"},        	   
			        	        {"data" : "productName"},
			        	        {"data": "notDelivered",
					            	"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
					            		var quantity = sData;
					            		if(proJson[oData.id] != undefined){
					            			quantity = parseFloat(sData) - parseFloat(proJson[oData.id]);
					            		}
					            		
					                    $(nTd).html(quantity);
					                }			
					            },
					            {"data": "id",
					            	"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
					                    var html = '';
					                    var quantity = oData.notDelivered;
					                    if(proJson[oData.id] != undefined){
					                    	quantity = parseFloat(quantity) - parseFloat(proJson[oData.id]);
					            		}
					                    
					                    html+=' <input type="number" value="'+quantity+'"  name="orderId" class="form-control quantityInput"> ';
					                    $(nTd).html(html);
					                    if(quantity==0){
					                    	$(nTd).parent().css("display","none");
					                    	return;
					                    }
					                }			
					            }
					]
				});
			$("input[name='selectAll']").prop("checked",false);
			$("input[name='productId']").prop("checked",false);
			}
	    function del(_this){
	    	j--;
	    	_this.closest("tbody tr").remove();
	    }
	    //清关
	    function customsClearance(state,orderId){
	    	layer.confirm("确认清关？",{skin : 'layui-layer-molv',title : '系统提示'},function(layero,index){
   	    	 $.ajax({
	                    url: ctx + "/admin/orderInfo/customs-clearance",
	                    type: 'post',
	                    dataType: 'json',
	                    data: {
	                    	orderId: orderId,
	                    	state:state
	                    },
	                    success: function(data) {
	                        $(".ui-button").removeAttr("disabled");
	                        if (data.success) {
	                           layer.msg("清关成功!");
	                           var html =  $(".order-"+orderId+" a").html();
	                           if(html){
	                        	   $(".order-"+orderId).html("<p>清关中<a style='color:red'>"+html+"</a></p>"); 
	                           }else{
	                        	   $(".order-"+orderId).html("<p>清关中</p>"); 
	                           }
	                           $(".clearance-"+orderId).hide();
	                           $(".deliver-"+orderId).show();
	                        } else {
	                          layer.msg(data.info);
	                        }
	                    },
	                    error: function(data) {
	                        $(".ui-button").removeAttr("disabled");
	                        layer.msg(data.info);
	                    }
	                });
   	    	});
	    }
	    //关闭发货弹框，数据清空
	    $("#closePackage").click(function(){
	    	$("#companyId").val('');
	 		$("#companyNumber").val('');
	    	$('.batches table tbody tr').remove();
	    	$('#myModal').modal('hide');
	    })
	    //保存包裹
	    $("#savePackage").click(function(){
	    	var id = $("#orderId").val();
	    	if($('input:radio[name="state"]:checked').val()==0){
	    		if($('#companyNumber').val().length==0){
	    			layer.confirm("请输入物流编号",{skin : 'layui-layer-molv',title : '系统提示'},function(layero,index){
	    				$("#myModal").modal("show");
	    				layer.closeAll();
	    			});
	    			return;
	    		}
	    		if($('#companyId').val().length==0){
	    			layer.confirm("请选择物流公司",{skin : 'layui-layer-molv',title : '系统提示'},function(layero,index){
	    				$("#myModal").modal("show");
	    				layer.closeAll();
	    			});
	    			return;
	    		}
			}
	    	for ( var i = 0; i < $('.batches tr td:nth-child(4)').length; i++) {
	    		if($($('.batches tr td:nth-child(4)')[i]).find('select').val().length==0){
	    			layer.confirm("请选择物流公司",{skin : 'layui-layer-molv',title : '系统提示'},function(layero,index){
	    				$("#myModal").modal("show");
	    				layer.closeAll();
	    			});
	    			return;
	    		}
			}
	    	for ( var i = 0; i < $('.batches tr td:nth-child(5)').length; i++) {
	    		if($($('.batches tr td:nth-child(5)')[i]).find('input').val().length==0){
	    			layer.confirm("请输入物流编号",{skin : 'layui-layer-molv',title : '系统提示'},function(layero,index){
	    				$("#myModal").modal("show");
	    				layer.closeAll();
	    			});
	    			return;
	    		}
			}
	    	$("#submitSave").find("input:submit").attr("disabled", true);
			var formData = $("#submitSave").serialize();
	 		$.ajax({
	 			url : ctx + "/admin/orderInfo/new-delivery-record",
	 			type : 'post',
	 			dataType : 'Json',
	 			data : formData,
	 			success : function(data) {
	 				if (data.success) {
                        layer.msg("发货成功!");
                        //setTimeout('goDetailOrder('+id+')', 800);
                        var html =  $(".order-"+id+" a").html();
                        if(html){
                     	   $(".order-"+id).html("<p>已发货<a style='color:red'>"+html+"</a></p>"); 
                        }else{
                     	   $(".order-"+id).html("<p>已发货</p>"); 
                        }
                        $(".btn-deliver-"+id).hide();
                        $(".deliver-"+id).hide();
                     } else {
                    	 if(null!=data.info){
                    		 layer.confirm(data.info,{skin : 'layui-layer-molv',title : '系统提示'},function(layero,index){
                    			 $("#myModal").modal("show");
                    			 layer.closeAll();
                    		 });
                    	 }
                     }
	 				
	 			},
	 			error : function(data) {
	 				layer.msg(data.info);
	 			},
	 		});
	 		$("#companyId").val('');
	 		$("#companyNumber").val('');
	 		$('#myModal').modal('hide');
	    	
	    });
	//修改物流弹框赋值
   function editCompany(_this){
	   var companyNumber = $(_this).parent().prev().prev().find('a').html();
	   
		  // $('.delivery-record tbody tr td a').html();
	   var companyId = $(_this).parent().prev().prev().prev().find('.companyId').val();
		   //$('.delivery-record tbody tr td .companyId').val();
	   var deliveryId = $(_this).parent().prev().prev().prev().find('.delivery-id').val();
		   //$('.delivery-record tbody tr td .delivery-id').val();
	   $("#deliveryId").val(deliveryId);
	   $("#editCompanyNumber").val(companyNumber);
	   //下拉框赋值
	   $("#eidtCompanyId option[value="+companyId+"]").prop("selected","selected");
	   $("#edit-logistics").modal("show"); 
   }  
   $("#saveLogistics").click(function(){
	   var id = $("#orderId").val();
	   var companyNumber = $('#editCompanyNumber').val();
	   var companyId = $('#eidtCompanyId').val();
	   var deliveryId = $('#deliveryId').val();
	   layer.confirm("确认修改物流信息？",{skin : 'layui-layer-molv',title : '系统提示'},function(layero,index){
 	    	 $.ajax({
                    url: ctx + "/admin/orderInfo/edit-delivery-record",
                    type: 'post',
                    dataType: 'json',
                    data: {
                    	companyNumber: companyNumber,
                    	companyId:companyId,
                    	id:deliveryId
                    },
                    success: function(data) {
                        $(".ui-button").removeAttr("disabled");
                        if (data.success) {
                           layer.msg("修改成功!");
                           setTimeout('goDetailOrder('+id+')', 800);
                        } else {
                          layer.msg(data.info);
                        }
                    },
                    error: function(data) {
                        $(".ui-button").removeAttr("disabled");
                        layer.msg(data.info);
                    }
                });
 	    	});
	   $("#edit-logistics").modal("hide"); 
   });
   function goDetailOrder(id){
   	location.href = ctx + '/admin/orderInfo/go/detail-order?id='+id;
   } 
   //显示后台备注弹框
   function backgroundRemark(id){
	   $("#orderId").val(id);
	   $.ajax({
       	url: ctx + "/admin/orderInfo/get-order-info",
           dataType: "json",
           type: "post",
           data: {
               id: id,
           },
           success: function(data) {
           	if(data.success){
           		$("#background-remark").modal("show");
           		$(":radio[name=backgroundMemoMark][value="+data.orderInfo.backgroundMemoMark+"]").attr("checked","true");
	            $("#backgroundRemark").html(data.orderInfo.backgroundRemark);
           	}
           },
           error: function(text) {
           	layer.msg("failed");
           }
   		});   
   }
   //物流信息
   function logisticsDetails(_this){
	   var id = _this.attr("data-id");
	   //var companyCode = _this.attr("name");
	  // alert(companyCode);
	   $(".log_item").remove();
	   $.ajax({
       	url: ctx + "/admin/postcompany/get-logistics-details",
           dataType: "json",
           type: "post",
           data: {
        	   id: id,
           },
           success: function(data) {
        	   if(data.success){
        		   var list = data.logisticsdetails.result.list;
        		   if(!list){
         			  alert("物流编号不存在");
         			  return;
         		   }
        		   var html = '';
        		   for(var i = 0; i < list.length; i++){
        			   var obj = list[i];
        			   html += '<div class="log_item"><div class="log_status">'+ obj.status +'</div><div class="log_time">'+ obj.time +'</div></div>';
        		   }
        		   $("#logistics-detail .content").html(html);
        		   $("#logistics-detail").modal("show");
        	   }
           },
           error: function(text) {
           	layer.msg("failed");
           }
   		});   
	   
   }
   //显示 修改收货人信息 弹框
	function editConsignee(id){
		$("#edit-consignee").modal("show");
	} 
	//修改收货人信息
	$("#save-consignee").click(function(){
		var id = $("#orderId").val();
		var city =$("#input_city").val(); 
		/*if(city=="市辖区"){
			city='';
		}*/
		var receivePhone = $("#receivePhone").val();
		var receiveName = $("#receiveName").val();
		var receiveIdCard = $("#receiveIdCard").val();
		var province = $("#input_province").val();
		var area = $("#input_area").val();
		var receiveAddress = $("#receiveAddress").val();
		if(''==receiveName){
			alert("请输入收货人姓名");
			return;
		}
		if(''==receiveIdCard){
			alert("请输入身份证号");
			return;
		}
		if(''==receivePhone){
			alert("请输入手机号码");
			return;
		}
		if(''==$("#receiveAddress").val()){
			alert("请输入详细地址");
			return;
		}
		 $.ajax({
		       url: ctx + "/admin/orderInfo/edit-consignee",
	           dataType: "json",
	           type: "post",
	           data: {
	        	   receiveAddress: receiveAddress,
	        	   provinceCode :province,
	        	   cityCode:city,
	        	   areaCode:area,
	        	   receivePhone:receivePhone,
	        	   receiveName:receiveName,
	        	   receiveIdCard:receiveIdCard,
	        	   id:id,
	        	   
	           },
	           success: function(data) {
	        	   if(data.success){
	        		   $("#edit-consignee").modal("hide");
	        		   layer.msg("保存成功");
	        		   setTimeout('goDetailOrder('+id+')', 800);
	        	   }
	           },
	           error: function(data) {
	           	layer.msg("failed");
	           }
	   		});  
	});
	//显示修改订单金额弹框
	function orderAmount(id){
		$("#edit-order-amount").modal("show");
	}
	//保存订单金额
	$("#saveOrderAmount").click(function(){
		var id = $("#orderId").val();
		$("#submitOrderAmount").find("input:submit").attr("disabled", true);
		var formData = $("#submitOrderAmount").serialize();
 		$.ajax({
 			url : ctx + "/admin/orderInfo/edit-order-amount",
 			type : 'post',
 			dataType : 'Json',
 			data : formData,
 			success : function(data) {
 				 if(data.success) {
 					$("#edit-order-amount").modal("hide");
                    layer.msg("修改成功!");
                    setTimeout('goDetailOrder('+id+')', 800);
                 }else{
                	 layer.msg(data.info); 
                 }
 			},
 			error : function(data) {
 				layer.msg(data.info);
 			},
 		});
	})
	