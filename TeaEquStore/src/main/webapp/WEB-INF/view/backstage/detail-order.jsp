<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/tool/tool.jsp"%>
<!DOCTYPE html>
<html>

<head>

    <meta>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>订单详情</title>
	
    <link href="${ctx }/template/hplus/css/plugins/iCheck/custom.css?v=${version}" rel="stylesheet">
	<link href="${ctx }/template/hplus/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
	<style>
		.form-two{
			width:200px;
		} 
		.start{
			margin-left:20px;	
		}
		.start span{
			float:left;	
				
		}
		.start>span:last-child{
			margin-top:12px;
			width:140px;
			padding-top:3px;
			height:6px;
			background:#ccc;
		}
		.start>span:last-child span{
			width:140px;
			height:3px;
			background:#ccc;
		}
		.start>span:first-child{
			margin-top:0px;
			width:30px;
			height:30px;
			border-radius:50%;
			background:#ccc;
			color:#fff;
			padding:5px 0 0 5px;
		}
		.start>span:first-child span{
			width:20px;
			height:20px;
			line-height:20px;
			text-align:center;
			border-radius:50%;
			background:#ccc;
			
		}
		.over>span:first-child span,.over>span:last-child span{
			background:green;
		}
		#myModal .modal-body table th{
    		white-space:nowrap
    	}
    	#myModal .modal-body table tbody {  
           display:block;  
           max-height:440px;  
           overflow-y:scroll;
        }    
    	#myModal .modal-body table thead,#myModal .modal-body tbody tr {  
           display:table;  
           width:100%;
           table-layout:fixed;  
        } 
        #logistics-detail .log_item{
        	line-height: 30px;
        }
	</style>
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h3>订单详情</h3>
                        <div class="ibox-tools">
							<a class="collapse-link" onclick="myRefresh()">
                                <i class="glyphicon glyphicon-refresh"></i>
                            </a>
                            <a class="close-link" onclick="myHistory()">
                                <i class="glyphicon glyphicon-menu-left"></i>
                            </a>
						</div>
                        <!-- <button type="button" onclick="javascript:history.go(-1);"  class="btn btn-danger"
                     style="float:right;margin-top: -32px;">返回订单列表</button>  --> 
                    </div>
                    <input type="hidden" name="orderId" id="orderId" value="${orderInfo.id }">
	                 <div class="ibox-content">
	                 	<div class="panel-body  bg-from pad0B">
	                 		<h3>订单状态：
	                 			
	                 			<c:if test="${orderInfo.state==5 }">已发货
	                 				<c:if test="${notDelivered >0 }">(<a style="color:red">部分发货</a>)</c:if>
	                 			</c:if>
	                 			<c:if test="${orderInfo.state!=5 }">${orderInfo.stateStr }</c:if>
	                 			<c:if test="${not empty orderRefund }">
	                 				<c:if test="${orderRefund.refundState==1 }">(<a style="color:red">买家申请售后</a>)</c:if>
		                 			<c:if test="${orderRefund.refundState==2 }">(<a style="color:red">等待买家退货</a>)</c:if>
		                 			<c:if test="${orderRefund.refundState==3 }">(<a style="color:red">买家退货中</a>)</c:if>
		                 			<c:if test="${orderRefund.refundState==4 }">(<a style="color:red">买家等待退款</a>)</c:if>
		                 			<c:if test="${orderRefund.refundState==5 }">(<a style="color:red">完成售后</a>)</c:if>
		                 			<c:if test="${orderRefund.refundState==6 }">(<a style="color:red">拒绝售后</a>)</c:if>
		                 			<c:if test="${orderRefund.refundState==8 }">(<a style="color:red">售后退款中</a>)</c:if>
	                 			</c:if>
	                 		 &nbsp;&nbsp;&nbsp;&nbsp;
	                 		订单总额：￥${orderInfo.payPrice }
		                 		<%-- <c:if test="${empty orderRefund }"> --%>
			                 		<shiro:hasPermission name="orderInfo:order:detail:deliver">
				                 		<c:if test="${orderInfo.state==5 }">
			                 				<c:if test="${notDelivered >0 }">
			                 					<button  style="float:right;" onclick="deliver(${orderInfo.id });" class = "btn btn-primary btn-outline glyphicon">发货</button>  
			                 				</c:if>
				                 			
				                 		</c:if>
			                 		<c:if test="${orderInfo.state==3 && orderInfo.isAbord==0 ||orderInfo.state==4  }">
			                 			<button  style="float:right;"  onclick="deliver(${orderInfo.id });" class = "btn btn-primary btn-outline glyphicon">发货</button> 
			                 		</c:if>
			                 		</shiro:hasPermission>
			                 		<shiro:hasPermission name="orderInfo:order:detail:clearance">
			                 		<c:if test="${orderInfo.state==3 && orderInfo.isAbord==1 }">
			                 			<button  style="float:right;" onclick="customsClearance(4,${orderInfo.id});" class = "btn btn-primary btn-outline glyphicon">清关</button> 
			                 		</c:if>
			                 		</shiro:hasPermission>
			                 		<shiro:hasPermission name="orderInfo:order:detail:consignee">
			                 		<c:if test="${orderInfo.state < 5}">
			                 			<button  style="float:right;margin-right: 5px;" onclick="editConsignee(${orderInfo.id });" class = "btn btn-primary btn-outline glyphicon">修改收货人信息</button>
			                 		</c:if>
			                 		</shiro:hasPermission>
			                 		<shiro:hasPermission name="orderInfo:order:detail:amount">
			                 		<c:if test="${orderInfo.state == 1}">
			                 			<button  style="float:right;margin-right: 5px;" onclick="orderAmount(${orderInfo.id });" class = "btn btn-primary btn-outline glyphicon">修改订单金额</button>
			                 		</c:if>
			                 		</shiro:hasPermission>
		                 		<%-- </c:if> --%>
	                 		</h3>
	                 	</div>
	                 	<div class="panel-body  bg-from pad0B">
	                 		<h3>订单流程：</h3>
	                 	</div>
	                 	<div class="panel-body  bg-from pad0B">
	                 		<div class="col-sm-1 form-group form-two" ></div>
	                 		<c:if test="${orderInfo.state<= 8 }">
								<div class="col-sm-1 form-group form-two" >
									<p>提交订单</p>
									<c:if test="${orderInfo.state<2 }">
									<p class="start over"><span><span>1</span></span><span><span style="width: 50%"></span></span></p>
									</c:if>
									<c:if test="${orderInfo.state>=2 }">
									<p class="start over"><span><span>1</span></span><span><span style="width: 100%"></span></span></p>
									</c:if>						
								</div>
								<div class="col-sm-1 form-group form-two" style="margin-left: -30px">
									<p>确认付款</p>
									<c:if test="${orderInfo.state==3 || orderInfo.state==4 }">
									<p class="start over"><span><span>2</span></span><span><span style="width: 50%"></span></span></p>	
									</c:if>	
									<c:if test="${orderInfo.state<3 }">
									<p class="start"><span><span>2</span></span><span><span></span></span></p>
									</c:if>	
									<c:if test="${orderInfo.state>4 }">
									<p class="start over"><span><span>2</span></span><span><span style="width: 100%"></span></span></p>
									</c:if>						
								</div>
								<div class="col-sm-1 form-group form-two" style="margin-left: -30px">
									<p>填写物流</p>	
									<c:if test="${orderInfo.state==5 }">
									<p class="start over"><span><span>3</span></span><span><span style="width: 50%"></span></span></p>	
									</c:if>	
									<c:if test="${orderInfo.state<5 }">
									<p class="start"><span><span>3</span></span><span><span></span></span></p>
									</c:if>	
									<c:if test="${orderInfo.state>5 }">
									<p class="start over"><span><span>3</span></span><span><span style="width: 100%"></span></span></p>
									</c:if>							
								</div>
								<div class="col-sm-1 form-group form-two" style="margin-left: -30px">
									<p>确认收货</p>
									<c:if test="${orderInfo.state==6 }">
									<p class="start over"><span><span>4</span></span><span><span style="width: 50%"></span></span></p>	
									</c:if>	
									<c:if test="${orderInfo.state<6 }">
									<p class="start"><span><span>4</span></span><span><span></span></span></p>
									</c:if>	
									<c:if test="${orderInfo.state>6 }">
									<p class="start over"><span><span>4</span></span><span><span style="width: 100%"></span></span></p>
									</c:if>								
								</div>
								<div class="col-sm-1 form-group form-two" style="margin-left: -30px">
									<p>订单归档</p>
									<c:if test="${orderInfo.state<7 }">
									<p class="start"><span><span>5</span></span></p>
									</c:if>	
									<c:if test="${orderInfo.state>=7 }">
									<p class="start over"><span><span>5</span></span></p>
									</c:if>							
								</div>
							</c:if>
							<c:if test="${orderInfo.state>=9 }">
								<div class="col-sm-1 form-group form-two" style="margin-left: -30px">
									<p>提交订单</p>
									<p class="start over"><span><span>1</span></span><span><span style="width: 100%"></span></span></p>						
								</div>
								<div class="col-sm-1 form-group form-two" style="margin-left: -30px">
									<p>取消订单/超时付款</p>
									<p class="start over"><span><span>2</span></span><span><span style="width: 100%"></span></span></p>						
								</div>
								<div class="col-sm-1 form-group form-two" style="margin-left: -30px">
									<p>订单关闭</p>
									<p class="start over"><span><span>3</span></span></p>
								</div>
							</c:if>
	                 	</div>
	                 	<div class="panel-body  bg-from pad0B">
	                 		 <table class="table table-striped table-bordered table-hover">
	                            <thead>
	                                <tr>
	                                    <th class="col-sm-3" style="text-align: center;">客户信息</th>
										<th class="col-sm-3" style="text-align: center;">订单信息</th>
										<th class="col-sm-3" style="text-align: center;">评价信息</th> 
										<th class="col-sm-3" style="text-align: center;">订单备注</th>
	                                </tr>
	                             </thead>
	                            <tbody>
	                            	<tr>
	                            		<td>
	                            			编号：${orderInfo.userSerial }<br>
	                            			昵称：${orderInfo.userName }<br>
	                            			收货人：${orderInfo.receiveName }<br>
	                            			身份证号码：${orderInfo.receiveIdCard }<br>
	                            			手机号：${orderInfo.receivePhone }<br>
	                            			收货地址：${orderInfo.receiveAddress }
	                            		</td>
	                            		<td>
	                            			订单类型：${orderInfo.typeStr }
	                            			<br>
	                            			订单编号：${orderInfo.orderNumber }<br>
	                            			下单时间：${fn:split(orderInfo.createTime,".")[0] }<br>
	                            			<c:if test="${not empty orderInfo.payTime }">
		                            			付款时间：${fn:split(orderInfo.payTime,".")[0] }<br>			
	                            			</c:if>
	                            			<c:if test="${not empty orderInfo.sendTime }">
		                            			发货时间：${fn:split(orderInfo.sendTime,".")[0] }<br>
	                            			</c:if>
	                            			<%-- <c:if test="${not empty orderInfo.storePayTime }">
		                            			店铺的付款时间：${fn:split(orderInfo.storePayTime,".")[0] }<br>
	                            			</c:if> --%>
	                            			<c:if test="${not empty orderInfo.confirmTime }">
		                            			确认收货时间：${fn:split(orderInfo.confirmTime,".")[0] }<br>
	                            			</c:if>
	                            			<c:if test="${not empty orderInfo.cancelTime }">
		                            			取消订单时间：${fn:split(orderInfo.cancelTime,".")[0] }<br>
	                            			</c:if>
	                            			买家备注：${orderInfo.remark }
	                            		</td>
	                            		<td>
		                            		<c:if test="${ not empty evaluate }">
		                            			评价时间：${fn:split(evaluate.createTime,".")[0]}<br>
		                            			评价用户：${evaluate.userName }<br>
		                            			评价内容：${evaluate.content }<br>
		                            			评价星级：${evaluate.score }
		                            				
		                            			星<br>
		                            			图片：<c:forEach items="${picList }" var="pic" >
		                            					<img src="${img_ctx }/${pic}@80w_80h_1e_1c_75Q.jpg">	
		                            			</c:forEach>
		                            		</c:if>
	                            		</td>
	                            		<td>
	                            		<div style="width: 300px;white-space:pre-wrap;word-wrap : break-word ;">
	                            		<span style="width:80%;word-break:normal;white-space:pre-wrap;overflow:hidden;">${orderInfo.backgroundRemark }</span><br>
	                            		</div>
	                            		<shiro:hasPermission name="orderInfo:order:detail:remark">
	                            			<button  class = "btn btn-primary btn-outline glyphicon" onclick = "backgroundRemark(${orderInfo.id});">修改备注 </button>
	                            		</shiro:hasPermission>
	                            		</td>
	                            	</tr>
                            	</tbody>
                        	</table>
	                 	</div>
	                 	<div class="panel-body  bg-from pad0B" >
	                 	
	                 		 <table class="table table-striped table-bordered table-hover">
	                 		  	<thead>
	                                <tr>
	                                    <th><h3>商品信息</h3></th>
										<%-- <th colspan="8">店铺：${orderInfo.storeName }(${orderInfo.storeSerial})</th> --%>
										
	                                </tr>
	                             </thead>
	                            <thead>
	                                <tr>
	                                    <th>商品图片</th>
										<th>商品名称</th>
										<th>商品编号</th> 
										<th>商品类别</th>
										<th>供货类型</th>
										<th>单价（元）</th>
										<th>数量</th> 
										<th>总价</th>
										<th>操作</th>
	                                </tr>
	                             </thead>
	                             <tbody>
	                             	<c:forEach items="${listOrderItem }" var="li">
		                             	<tr>
		                                    <td><img src="${li.productPic }@80w_80h_1e_1c_75Q.jpg"></td>
											<td>${li.productName }</td>
											<td>${li.productSerial }</td>
											<td>${li.productTypeNames }</td>
											<td>
												${li.isSelf==0?'非自营':'自营' }
											</td>
											<td>${li.price }</td>
											<td>${li.quantity }</td>
											<td>${li.price*li.quantity }</td> 
											<td>
												<c:if test="${li.isRefund==0 && orderInfo.state>1}">
													<button title="协助售后" class = " btn btn-primary btn-outline glyphicon" onclick="assistAfterSale(this);"  data-id="${li.id }">协助售后</button>											
												</c:if>
												<c:if test="${li.isRefund > 0 && li.refundState < 5}">
													<button title="关闭售后" class = " btn btn-primary btn-outline glyphicon" onclick="closeRefund(this);"  data-id="${li.id }">关闭售后</button>
												</c:if>
												<c:if test="${li.isRefund>0 && li.refundState==5}">
													已完成
												</c:if>
												<c:if test="${li.isRefund>0 && li.refundState==6}">
													已拒绝
												</c:if>
												<c:if test="${li.isRefund>0 && li.refundState==7}">
													已关闭
												</c:if>
												<c:if test="${li.isRefund>0 && li.refundState==8}">
													退款中
												</c:if>
												<c:if test="${orderInfo.state==1 }">
													未付款
												</c:if>
											</td>
		                                </tr>
	                             	
	                             	</c:forEach>
	                             </tbody>
	                            <tbody>
	                            	<tr>
	                            		<td colspan="9">

	                            			<p style="text-align: right;">商品总价：￥${orderInfo.totalPrice }&nbsp;&nbsp;&nbsp;&nbsp;</p>
	                            			<p style="text-align: right;">运费：￥${orderInfo.freight }&nbsp;&nbsp;&nbsp;&nbsp;</p>
	                            			<p style="text-align: right;">使用优惠卷：-￥${orderInfo.couponPrice }&nbsp;&nbsp;&nbsp;&nbsp;</p>	                            			
	                            			<p style="text-align: right;font-size: 18px;">订单合计：<span style="color: red;">￥${orderInfo.payPrice }</span>&nbsp;&nbsp;&nbsp;&nbsp;</p>
	                            			<h3 style="text-align: right;">付款信息：&nbsp;&nbsp;&nbsp;&nbsp;</h3>
											
	                            			<c:if test="${orderInfo.walletPay > 0 }">
	                            				<p style="text-align: right;">使用小金库：￥${orderInfo.walletPay }&nbsp;&nbsp;&nbsp;&nbsp;</p>
	                            			</c:if>
	                            			<c:if test="${orderInfo.thirdPay >0 && orderInfo.payWay==1  }">
	                            				<p style="text-align: right;">支付宝支付：￥${orderInfo.thirdPay }&nbsp;&nbsp;&nbsp;&nbsp;</p>
	                            			</c:if>
	                            			<c:if test="${orderInfo.thirdPay >0 && orderInfo.payWay==2  }">
	                            				<p style="text-align: right;">微信支付：￥${orderInfo.thirdPay }&nbsp;&nbsp;&nbsp;&nbsp;</p>
	                            			</c:if>
	                            			<c:if test="${orderInfo.incomePay >0 }">
	                            				<p style="text-align: right;">收益支付：￥${orderInfo.incomePay }&nbsp;&nbsp;&nbsp;&nbsp;</p>
	                            			</c:if>
	                            		</td>
	                            	</tr>
                            	</tbody>
                        	</table>
	                 	</div>
	                 	<div class="panel-body  bg-from pad0B">

	                 		 <table class="table table-striped table-bordered table-hover delivery-record">
	                 		  <thead>
	                                <tr>
	                                    <th colspan="6">发货记录</th>
									
	                                </tr>
	                             </thead>
	                            <thead>
	                                <tr>
	                                    <th>商品信息</th>
										<th>建立时间</th>
										<th>配送方式</th> 
										<th>物流单号</th>
										<th>收货人</th>
										<c:if test="${orderInfo.state <= 6 }">
											<th>操作</th>
										</c:if>
	                                </tr>
	                             </thead>
	                            <tbody>
		                            <c:forEach items="${listOrderDeliver }" var="li">
		                            	<tr>
		                                    <td>${li.productInformation }</td>
											<td>${li.createTime }</td>
											<td>${li.companyName }
											<input type="hidden" class="companyId" name="companyId" value="${li.companyId }">
											<input type="hidden" class="delivery-id"  value="${li.id }">
											</td> 
											<td><a onclick="logisticsDetails($(this));" data-id="${li.id }" >${li.companyNumber }</a></td>
											<td>${li.receiveName }</td>
											<c:if test="${orderInfo.state <= 6 }">
												<td><a onclick="editCompany(this);">修改物流</a></td>
											</c:if>
		                                </tr>
		                            </c:forEach>
                            	</tbody>
                        	</table>
	                 	</div>
	                 </div>
                 </div>
             </div>
         </div>        
	</div>
	<!-- 发货弹窗 -->
	<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog"   style="width:800px;">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <div class="col-md-12 modal-title">
						<div class="col-md-4 modal-title-info">填写物流</div>
					</div>
                </div>
                <form id="submitSave">
                <div class="modal-body">
                    <div class="form-group">
                    	<label class="col-sm-3 control-label">配送形式：</label>
				        <div class="col-sm-8">
				            <label class="radio-inline">
				                <input type="radio" checked="" style="margin-left: -15px;margin-top: 2px;" value="0" id="all" name="state">全部配送</label>
				            <label class="radio-inline">
				                <input type="radio" value="1" style="margin-left: -15px;margin-top: 2px;" id="batches" name="state">分批配送</label>
				        </div>
                    </div>
                </div>
                <div class="modal-body all">
                    <div class="form-group">
                    	<label class="col-sm-3 control-label">物流公司：</label>
				        <div class="col-sm-8">
				            <select id="companyId" name="companyId" class="form-control">
						    	<option value="">请选择</option>
								<c:forEach items="${company }" var="li">
									<option value="${li.id }">${li.company }</option>
								</c:forEach>
							</select>
				        </div>
                    </div>
                </div>
                <div class="modal-body all">
                    <div class="form-group">
                    	<label class="col-sm-3 control-label">物流单号：</label>
				        <div class="col-sm-8">
				            <input type="text" id="companyNumber" name="companyNumber" class="form-control trimInput">
				        </div>
                    </div>
                </div>
                
                <div class="modal-body batches" style="display: none;height: 30px;">
                    <div class="form-group" style="margin-top: -20px;">
                    	<div id="newPackage" class = "btn btn-primary btn-outline glyphicon">添加包裹</div>
                    </div>
                </div><input type="hidden" id="orderId" name="orderId" value="${orderInfo.id }">
                <div class="modal-body batches" style="display: none;">
                    <table class="table table-striped datatable check-group table-bordered table-hover product-table" style="text-align:center" >
						<thead>
							<tr >
								<th style="text-align:center">包裹</th>
								<th style="text-align:center">商品</th>
								<th style="text-align:center">数量</th>
								<th style="text-align:center">物流公司</th>
								<th style="text-align:center">物流单号</th>
								<th style="text-align:center">操作</th>
							</tr>
						</thead>
						
						<tbody>
							
						</tbody>
					</table>
                </div>
                </form>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" id="closePackage" data-dismiss="modal">关闭</button>
                    <div type="button" class="btn btn-primary" id="savePackage">保存</div>
                </div>
            </div>
        </div>
    </div>
    <!-- 选择商品弹窗 -->
	<div class="modal inmodal" id="add-product-modal"  tabindex="-1" role="dialog" aria-hidden="true" >
		<div class="modal-dialog" style="width:800px;">
			<div class="modal-content animated bounceInRight">
				<div class="modal-header">
					<div class="col-md-12 modal-title">
						<div class="col-md-4 modal-title-info">选择商品</div>
						<div class="col-md-7"></div>
						<div class="col-md-1">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
							</button>
						</div>
					</div>
					<form  id="submitForm">
					<div class="col-md-12 modal-search">
					 	<div class="col-md-5" >
			               	<div class="input-group">
		                       <span class="input-group-btn">
									<button class="btn btn-primary" type="button">
										<font>商品类别：</font>
									</button>
								</span>
								<div class="productType-group">
		                       		<input type="text" class="productTypeName form-control trimInput" readonly  name="productTypeName" placeholder="商品类别" >
		                      		<input type="hidden" class="productTypeId" name="productTypeId" id="productTypeId">
		                       		<div class="dd productType-nestable" ></div>
		                       </div>
		                   </div>
		                </div>
		                <div class="col-md-5 form-group">
		                   <div class="input-group">
		                   		<span class="input-group-btn">
									<button class="btn btn-primary" type="button">
										<font>商品名称：</font>
									</button>
								</span>
		                       <input type="text" id="productName" name="productName" class="form-control trimInput names" placeholder="商品名称">
		                   </div>
		                </div>
			            <div class="col-sm-1 form-group" style="margin-bottom:0px;">
			               <div id="product-search" title="搜索" class="btn btn-sm btn-primary btn-outline ">搜索</div>
			           </div>
		           </div>
		           </form>
				</div>
				<div class="modal-body">
					<table class="table table-striped datatable check-group table-bordered table-hover select-product-table" style="text-align:center" >
						<thead>
							<tr >
								<th style="text-align:center">
									<div class="checkbox i-checks ids" title="全选/全不选">
                                        <label >
                                            <input type="checkbox" style="margin-top: 3px;" class="check-all-btn" onclick="selectAll(this)" name="selectAll" />
                                        </label>
                                    </div>
								</th>
								<th style="text-align:center">商品类别</th>
								<th style="text-align:center">商品编号</th>
								<th style="text-align:center">商品名称</th>
								<th style="text-align:center">订购商品数量</th>
								<th style="text-align:center">实际发货数量</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					<div id="add-product-submit-btn" type="button" class="btn btn-primary">保存</div>
				</div>
			</div>
		</div>
	</div>
    <!-- 修改物流弹窗 -->
    <div class="modal inmodal" id="edit-logistics" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <div class="col-md-12 modal-title">
						<div class="col-md-4 modal-title-info">修改物流</div>
					</div>
                </div>
                <div class="modal-body all">
                    <div class="form-group">
                    	<label class="col-sm-3 control-label">物流公司：</label>
				        <div class="col-sm-8">
				            <select id="eidtCompanyId" name="eidtCompanyId" class="form-control">
						    	<option value="">请选择</option>
								<c:forEach items="${company }" var="li">
									<option value="${li.id }">${li.company }</option>
								</c:forEach>
							</select>
				        </div>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                    	<label class="col-sm-3 control-label">物流单号：</label>
				        <div class="col-sm-8">
				            <input type="text" id="editCompanyNumber" name="editCompanyNumber" class="form-control trimInput">
				        </div>
                    </div>
                </div>  
                <input type="hidden" id="deliveryId" name="deliveryId">           
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <div type="button" class="btn btn-primary" id="saveLogistics">保存</div>
                </div>
            </div>
        </div>
    </div>
    <!-- 后台备注弹框 -->
	<div class="modal inmodal" id="background-remark" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <div class="col-md-12 modal-title">
						<div class="col-md-4 modal-title-info">备注</div>
					</div>
                </div>
                <div class="modal-body all">
                    <div class="form-group">
                    	<label class="col-sm-2 control-label">标记：</label>
				        <div class="col-sm-10">
				            <label class="radio-inline" style="margin-right: -5px;">
				                <input type="radio" checked="" value="1" name="backgroundMemoMark"  style="margin-top: 5px;">&nbsp;
				                <img src="${ctx }/images/flag/pic1.png">
			                </label>
						    
			                <label class="radio-inline" style="margin-right: -5px;">
				                <input type="radio" value="2" name="backgroundMemoMark"  style="margin-top: 5px;">&nbsp;
								<img src="${ctx }/images/flag/pic2.png">
							</label>
							<label class="radio-inline" style="margin-right: -5px;">
				                <input type="radio" value="3" name="backgroundMemoMark"  style="margin-top: 5px;">&nbsp;
								<img src="${ctx }/images/flag/pic3.png">
							</label>
							<label class="radio-inline"  style="margin-right: -5px;">
				                <input type="radio" value="4" name="backgroundMemoMark"  style="margin-top: 5px;">&nbsp;
								<img src="${ctx }/images/flag/pic4.png">
							</label>
							<label class="radio-inline" style="margin-right: -5px;">
				                <input type="radio" value="5" name="backgroundMemoMark"  style="margin-top: 5px;">&nbsp;
								<img src="${ctx }/images/flag/pic5.png">
							</label>
							<label class="radio-inline" style="margin-right: -5px;">
				                <input type="radio" value="6" name="backgroundMemoMark"  style="margin-top: 5px;">&nbsp;
								<img src="${ctx }/images/flag/pic6.png">
							</label>
				        </div>
                    </div>
                </div>
                <div class="modal-body " style="height: 150px;">
                    <div class="form-group">
                    	<label class="col-sm-2 control-label">备注：</label>
				        <div class="col-sm-10">
				            <textarea rows="4" cols="50" id="backgroundRemark" name="backgroundRemark"></textarea>
				        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <div type="button" class="btn btn-primary" id="saveRemark">保存</div>
                </div>
            </div>
        </div>
    </div>
    <!-- 查看物流详情 -->
    <div class="modal inmodal" id="logistics-detail" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <div class="col-md-12 modal-title">
						<div class="col-md-4 modal-title-info">订单跟踪</div>
					</div>
                </div>
                <div class="col-md-12 modal-body all">
                    <div class="form-group">
				        <div class="col-sm-12 content">
				            
				        </div>
                    </div>
                </div>          
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div> 
    <!-- 修改收货人信息弹框 -->
    <div class="modal inmodal" id="edit-consignee" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" style="width: 800px;">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <div class="col-md-12 modal-title">
						<div class="col-md-4 modal-title-info">修改收货人信息</div>
					</div>
                </div>
                <div class="col-md-12 modal-body" style="height: 50px;">
                    <div class="form-group">
				        <label class="col-sm-3 " style="text-align: right;margin-top: 8px;"><font color=red>*</font>收货人姓名：</label>
						<div class="col-sm-8">
						    <input type="text" id="receiveName" name="receiveName" class="form-control" value="${orderInfo.receiveName }">
						</div>
                    </div>
                </div> 
                <div class="col-md-12 modal-body" style="height: 50px;">
                	<div class="form-group">
				        <label class="col-sm-3 control-label" style="text-align: right;margin-top: 8px;"><font color=red>*</font>身份证号码：</label>
						<div class="col-sm-8">
						    <input type="text" id="receiveIdCard" name="receiveIdCard" class="form-control" value="${orderInfo.receiveIdCard }">
						</div>
                    </div>
                </div>
                <div class="col-md-12 modal-body" style="height: 50px;">
                    <div class="form-group">
				        <label class="col-sm-3 " style="text-align: right;margin-top: 8px;"><font color=red>*</font>手机号码：</label>
						<div class="col-sm-8">
						    <input type="text" id="receivePhone" name="receivePhone" class="form-control" value="${orderInfo.receivePhone }">
						</div>
                    </div>
                </div> 
                <!-- <div class="col-md-12 modal-body" style="height: 50px;">
                    <div class="form-group">
				        <label class="col-sm-3 " style="text-align: right;margin-top: 8px;"><font color=red>*</font>邮政编码：</label>
						<div class="col-sm-8">
						    <input type="text" name="priceSale" class="form-control" value="">
						</div>
                    </div>
                </div> --> 
                <div class="col-md-12 modal-body" style="height: 50px;">
                    <div class="form-group">
				        <label class="col-sm-3 " style="text-align: right;margin-top: 8px;"><font color=red>*</font>所在区域：</label>
						<div class="col-sm-8">
						    <div class="col-sm-4">
								<!-- <select id="provinceCode" class="eAddress form-control" name="provinceCode">
									<option value="0">请选择省份</option>
									
								</select> -->
								<select class="form-control m-b pType"  id="input_province" data-id="" >
				                     <option value="">--请选择--</option>
				                     <c:forEach items="${provinces}" var="p">
										<option value = "${p.provinceCode}" data-id="${p.provinceCode}"  data-name="${p.name}" >${p.name}</option>
				                     </c:forEach>
				                </select>
							</div>
							<div class="col-sm-4">
								<!-- <select id="cityCode" class="eAddress form-control" name="cityCode">
									<option value="0">请选择市</option>
									
								</select> -->
								<select class="form-control m-b pType" id="input_city" data-id=""  >
				                     <option value="">--请选择--</option>
				                     <c:forEach items="${cities}" var="c">
										<option value = "${c.cityCode}" data-id="${c.cityCode}" parentCode="${c.provinceCode}"  data-name="${c.name}">${c.name}</option>
				                     </c:forEach>
				                </select>
							</div>
							<div class="col-sm-4">
								<!-- <select id="areaCode" class="eAddress form-control" name="areaCode">
									<option value="0">请选择区/县</option>
									
								</select> -->
								<select class="form-control m-b pType"  id="input_area" >
				                     <option value="">--请选择--</option>
				                     <c:forEach items="${areas}" var="a">
										<option value = "${a.areaCode}" data-id="${a.areaCode}" parentCode="${a.cityCode}"  data-name="${a.name}">${a.name}</option>
				                     </c:forEach>
				                </select>
							</div>
						</div>
                    </div>
                </div> 
                <div class="col-md-12 modal-body">
                    <div class="form-group">
				        <label class="col-sm-3 " style="text-align: right;margin-top: 8px;"><font color=red>*</font>详细地址：</label>
						<div class="col-sm-8">
						    <textarea cols="10" rows="4" class="form-control" id="receiveAddress"  name="receiveAddress" >${orderInfo.receiveAddress }</textarea>
						</div>
                    </div>
                </div>         
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <div type="button" class="btn btn-primary" id="save-consignee">确定</div>
                </div>
            </div>
        </div>
    </div> 
     <!-- 修改订单金额-->
    <div class="modal inmodal" id="edit-order-amount" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" style="width: 800px;">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <div class="col-md-12 modal-title">
						<div class="col-md-4 modal-title-info">修改订单金额</div>
					</div>
                </div>
                <form id="submitOrderAmount">
                <div class="modal-body all">
                    <div class="form-group">
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
								<th>商品名称</th>
								<th>数量</th> 
								<th>单价（元）</th>
								<th>实际付款价格（元）</th>
								<th>修改后的单价（元）</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listOrderItem }" var="li" varStatus="status">
									<tr>
										<td>${li.productName }</td>
										<td>${li.quantity }</td>
										<td>${li.price }</td>
										<td>${li.payPrice }</td>
										<td>
											<input type="hidden" name="orderItems[${status.index }].orderId" value="${li.orderId }">
											<input type="hidden"  name="orderItems[${status.index }].id" value="${li.id }" />
											<input type="number"  name="orderItems[${status.index }].price" value="${li.price }" />
										</td> 
									</tr>					
								</c:forEach>
								<tr>
									<td colspan="3">订单运费</td>
									<td>${orderInfo.freight }</td>
									<td><input type="number" id="freight" name="freight" value="${orderInfo.freight }" /></td> 
								</tr>
								<tr>
									
								</tr>
							</tbody>
						</table>
						实际付款总金额:${orderInfo.payPrice }
                    </div>
                </div>
                <input type="hidden" name="state" value="${orderInfo.state }">
                </form>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <div type="button" class="btn btn-primary" id="saveOrderAmount">保存</div>
                </div>
            </div>
        </div>
    </div>
    <!-- 协助售后弹框 -->
    <div class="modal inmodal" id="assist-after-sale" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <div class="col-md-12 modal-title">
						<div class="col-md-4 modal-title-info">协助售后</div>
					</div>
                </div>
                <form id="submit-assist-after-sale">
                <div class="modal-body all">
                    <div class="form-group">
                    	<label class="col-sm-5 control-label">申请售后方式：</label>
				        <div class="col-sm-7">
				            <label class="radio-inline">
				                <input type="radio" checked="" value="0" name="refundType"  style="margin-top: 2px;">&nbsp;&nbsp;仅退款</label>
				            	<label class="radio-inline">
				                <input type="radio" value="1"  name="refundType"  style="margin-top: 2px;">&nbsp;&nbsp;退货退款</label>
				        </div>
                    </div>
                </div>
                <div class="modal-body all">
                    <div class="form-group">
                    	<label class="col-sm-5 control-label">申请售后原因：</label>
				        <div class="col-sm-7">
				            <select id="refundReason" name="refundReason" class="form-control">
						    	<option value="多拍/拍错/不想要">多拍/拍错/不想要</option>
								<option value="商品质量问题">商品质量问题</option>
								<option value="商品描述不符">商品描述不符</option>
								<option value="卖家发错货">卖家发错货</option>
								<option value="收到商品少件或破损">收到商品少件或破损</option>
								<option value="其他">其他</option>
							</select>
				        </div>
                    </div>
                </div>
                <div class="modal-body all">
                    <div class="form-group">
                    	<label class="col-sm-5 control-label">退款金额（最多￥：<a id="max-money"></a>）：</label>
				        <div class="col-sm-7">
				        	<input type="hidden" name="maxRefundPrice" id="maxRefundPrice">
				            <input type="text" id="refundApplyPrice" name="refundApplyPrice" class="form-control trimInput">
				        </div>
                    </div>
                </div>  
                <div class="modal-body all">
                    <div class="form-group" style="height: 40px;">
                    	<label class="col-sm-3 control-label">退款说明：</label>
				        <div class="col-sm-9">
						    <textarea cols="10" rows="3" class="form-control" id="refundRemark"  name="refundRemark" ></textarea>
						</div>
                    </div>
                </div> 
                <div class="modal-body all" style="height: 120px;" >
                    <div class="form-group">
                    	<label class="col-sm-3 control-label">上传凭证：</label>
			        	<div class="col-sm-3 m-section1">
							<div class="relative">
								<label class="upload pic" style="background: url('${ctx}/images/store/gicon8.png') no-repeat center center;">
									<input type="file" id="fileupload1" name="file"  onchange="ajaxFileUpload($(this))">
									<input type="hidden" class="hidePicValue" name="previewImage"  >
								</label>
							</div>
						</div>
						<div class="col-sm-3 m-section1">
							<div class="relative">
								<label class="upload pic" style="background: url('${ctx}/images/store/gicon8.png') no-repeat center center;">
									<input type="file" id="fileupload2" name="file"  onchange="ajaxFileUpload($(this))">
									<input type="hidden" class="hidePicValue" name="previewImage"  >
								</label>
							</div>
						</div>
						<div class="col-sm-3 m-section1">
							<div class="relative">
								<label class="upload pic" style="background: url('${ctx}/images/store/gicon8.png') no-repeat center center;">
									<input type="file" id="fileupload3" name="file"  onchange="ajaxFileUpload($(this))">
									<input type="hidden" class="hidePicValue" name="previewImage" >
								</label>
							</div>
						</div>
                    </div>
                </div>
                <input type="hidden" id="itemId" name="id" >
                </form>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <div type="button" class="btn btn-primary" id="save-assist-refund">保存</div>
                </div>
            </div>
        </div>
    </div>
    <script src="${ctx }/template/hplus/js/plugins/jeditable/jquery.jeditable.js?v=${version}"></script>
	<script src="${ctx }/template/hplus/js/plugins/layer/laydate/laydate.js?v=${version}"></script>
    <!-- Data Tables -->
    <script src="${ctx }/template/hplus/js/plugins/dataTables/jquery.dataTables.js?v=${version}"></script>
    <script src="${ctx }/template/hplus/js/plugins/dataTables/dataTables.bootstrap.js?v=${version}"></script>
    <!-- iCheck -->
    <script src="${ctx }/template/hplus/js/plugins/iCheck/icheck.min.js?v=${version}"></script>
        <script src="${ctx }/template/hplus/js/jquery-ui.js?v=${version}"></script>
    <script src="${ctx }/js/custom/admin/order/detail-order.js?v=${version}"></script>
    <script type="text/javascript" src="${ctx }/js/setting/fileUpload.js?v=${version}"></script> 
  <script type="text/javascript">
		  
		
		
	    $("#add-product-submit-btn").click(function(){
	    	ids=$("input:checkbox[name='productId']:checked").map(function(index,elem) {
	    		return $(elem).val();
	    	}).get().join(',');
	    	if(ids==""){
	    		layer.alert("未选择要发送的商品");
	    		return ;
	    	}
	    	var productType ="" ;
	    	var productSerial ="";
	    	var productName ="";
	    	var quantity ="";
	    	for(var i=0;i<$('.select-product-table tbody tr td:first-child+td').length;i++){
	    		if($($('.selected')[i]).is(':checked')){
	    			var selQuantity = $($('.select-product-table tbody tr td .quantityInput')[i]).val();
	    			var oldQuantity =  $($('.select-product-table tbody tr td:first-child+td+td+td+td')[i]).html();
	    			if(selQuantity >oldQuantity){
	    				layer.alert("选择商品数量大于订购数量，请重新选择。");
	    	    		return ;
	    			}
	    			if(selQuantity <= 0){
	    				layer.alert("要发货的商品数量应大于零。");
	    	    		return ;
	    			}
		    		productType += $($('.select-product-table tbody tr td:first-child+td')[i]).html();
		    		productSerial += $($('.select-product-table tbody tr td:first-child+td+td')[i]).html();
		    		productName += $($('.select-product-table tbody tr td:first-child+td+td+td')[i]).html()+",";
		    		quantity += selQuantity+",";
	    		}
	    	}
	    	productName=(productName.substring(productName.length-1)==',')?productName.substring(0,productName.length-1):productName;
	    	quantity=(quantity.substring(quantity.length-1)==',')?quantity.substring(0,quantity.length-1):quantity;
	    	j++;
			var html = '<tr><td>'+j+'<input type="hidden" name="listOrderDeliveryRecord['+(j-1)+'].itemIds" value="'+ids+'"></td>' +
						'<td><input type="hidden" name="listOrderDeliveryRecord['+(j-1)+'].productNames" value="'+productName+'"><a style="color:black;" >'+productName+'</a></td>' +
						'<td><input type="hidden" name="listOrderDeliveryRecord['+(j-1)+'].quantitys" value="'+quantity+'"><a style="color:black;">'+quantity+'</a></td>'+
				'<td>'+
				'<select name="listOrderDeliveryRecord['+(j-1)+'].companyId" class="form-control">'+
		    	'<option value="">全部</option><c:forEach items="${company }" var="li">'+
				'<option value="${li.id }">${li.company }</option></c:forEach></select></td>'+
				
				'<td><input type="text" name="listOrderDeliveryRecord['+(j-1)+'].companyNumber" class="form-control quantityInput"></td>'+
				'<td><button class="btn btn-danger" type="button" onclick="del(this);" ><font>删除</font>'+
				'</button></td></tr>';
			$(".product-table tbody").append(html);
			$("#add-product-modal").modal("hide");
	    })	
	   $("#saveRemark").click(function(){
		   	var id = $("#orderId").val();
		   	var backgroundMemoMark =$('input:radio[name="backgroundMemoMark"]:checked').val();
		   	var backgroundRemark =$("#backgroundRemark").val();
		   	$.ajax({
		           url: ctx + "/admin/orderInfo/edit-background-remark",
		           type: 'post',
		           dataType: 'json',
		           data: {
		               id: id,
		               backgroundMemoMark:backgroundMemoMark,
		               backgroundRemark:backgroundRemark,
		           },
		           success: function(data) {
		               //$(".ui-button").removeAttr("disabled");
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
		   	$("#backgroundMemoMark").val(0);
		   	$("#backgroundRemark").val('');
		   	$("#background-remark").modal("hide");
		   });
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~·····
		$(document).ready(function () {
			//类别下拉筛选（城市三级联动）
	    	/**************************     start        *********************/
	    	var levelType0Options = {};
	    	var levelType1Options = new Array();
	    	var levelType2Options = new Array();
	    	var levelType3Options = {};
	    	var intoptions = $(".pType[id='input_province'] option");
	    	for ( var i = 0; i < intoptions.length; i++) {
	    		var val = $(intoptions[i]);
	    		//console.log(val.val());
	    		val = val.val();
	    		levelType0Options[val] = $(intoptions[i]);
	    		//levelType0Options.push($(intoptions[i]));
	    	}
	    	//console.log(levelType0Options);
	    	 intoptions = $(".pType[id='input_city'] option");
	    	for ( var i = 0; i < intoptions.length; i++) {
	    		var val = $(intoptions[i]);
	    		//console.log(val.val());
	    		levelType1Options.push($(intoptions[i]));
	    	}
	    	//console.log(levelType1Options);
	    	for ( var i = 0; i < intoptions.length; i++) {
	    		var val = $(intoptions[i]);
	    		val = val.val();
	    		levelType3Options[val] = $(intoptions[i]);
	    		//levelType0Options.push($(intoptions[i]));
	    	}
	    	intoptions = $(".pType[id='input_area'] option");
	    	for ( var i = 0; i < intoptions.length; i++) {
	    		levelType2Options.push($(intoptions[i]));
	    	}
	    	$(".pType[id='input_city'] option:eq(0)").nextAll().remove();
	    	$(".pType[id='input_area'] option:eq(0)").nextAll().remove();
			if($("#id").val()!=0){
				
			}
	    	
	    	$(".pType[id='input_province']").change(function() {
	    		//console.log($(this).attr("data-id"));
	    		//console.log($(this)) 
	    		$(".pType[id='input_city'] option:eq(0)").nextAll().remove();
	    		$(".pType[id='input_area'] option:eq(0)").nextAll().remove();
	    		if(levelType0Options[$(this).val()] != null){
	    			var _this = levelType0Options[$(this).val()];
	    			console.log($(_this).attr("data-id"));
	    		}
	    		for ( var i = 0; i < levelType1Options.length; i++) {
	    			if ($(levelType1Options[i]).attr("parentCode") == $(_this).attr("data-id")) {
	    				$(".pType[id='input_city']").append($(levelType1Options[i]));
	    			}
	    		}
	    		var city = $("#cityName").val();
	    		if(city == ''){
	        		// 默认选中第一项
	        		$(".pType[id='input_city'] option:eq(0)").attr("selected",true);
	    		}else{
	    			$(".pType[id='input_city']").find("option[value="+city+"]").attr("selected",true).change();
	    			$("#cityName").val('');
	    		}
	    	});
	    	
	    	$(".pType[id='input_city']").change(function() {
	    		var checkedCity=$(".pType[id='input_city'] option:selected");
	    		$(".pType[id='input_area'] option:eq(0)").nextAll().remove();
	    		if(levelType3Options[$(checkedCity).attr("data-id")] != null){
	    			var _this = levelType3Options[$(checkedCity).attr("data-id")];
	    			//console.log($(_this).attr("data-id"));
	    		}
	    		for ( var i = 0; i < levelType2Options.length; i++) {
	    			if ($(levelType2Options[i]).attr("parentCode") == $(checkedCity).attr("data-id")) {
	    				$(".pType[id='input_area']").append($(levelType2Options[i]));
	    			}
	    		}
	    		var area = $("#areaName").val();
	    		if(area == ''){
	        		// 默认选中第一项
	        		$(".pType[id='input_area'] option:eq(0)").attr("selected",true);
	    		}else{
	    			$(".pType[id='input_area']").find("option[value="+area+"]").attr("selected",true).change();
	    			$("#areaName").val('');
	    		}
	    	});
	    	$(".pType[id='input_province']").find("option[data-id="+'${orderInfo.provinceCode}'+"]").attr("selected",true).change();
	    	$(".pType[id='input_city']").find("option[data-id="+'${orderInfo.cityCode}'+"]").attr("selected",true).change();
	    	$(".pType[id='input_area']").find("option[data-id="+'${orderInfo.areaCode}'+"]").attr("selected",true).change();
		});
	    	
	    	/*****************************  end ********************************/
	    
	    	 	
    	
    	$(document).on("show.bs.modal", ".modal", function() {
    		 $(this).draggable({
    			/*  handle: ".modal-header", // 只能点击头部拖动 */
    			 cursor: "crosshair"
    		 });
    		 $(this).css("overflow", "hidden"); // 防止出现滚动条
    	})
	    	
	    	
	</script>
</body>

</html>
