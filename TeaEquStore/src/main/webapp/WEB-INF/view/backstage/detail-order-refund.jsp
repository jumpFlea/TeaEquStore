<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/tool/tool.jsp"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>售后订单详情</title>
    <%--  <%@ include file="/WEB-INF/views/admin/commons/head-meta.jsp" %>
	<%@ include file="/WEB-INF/views/admin/commons/js-meta.jsp" %>
	<%@ include file="/WEB-INF/views/admin/commons/proCategory.jsp" %> --%>
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
                        <!-- <button type="button" onclick="goDetailOrder();"  class="btn btn-danger"
                     style="float:right;margin-top: -32px;">返回售后列表</button>  --> 
                    </div>
	                 <div class="ibox-content">
	                 	<div class="panel-body  bg-from pad0B">
	                 		<h3>订单状态：${orderInfo.stateStr }&nbsp;&nbsp;&nbsp;&nbsp;
	                 		订单总额：￥${orderInfo.payPrice }&nbsp;&nbsp;&nbsp;&nbsp;
	                 		运费：￥${orderInfo.freight }&nbsp;&nbsp;&nbsp;&nbsp;
	                 		使用优惠卷：￥${orderInfo.couponPrice }
	                 		</h3>
	                 	</div>
	                 	<div class="panel-body  bg-from pad0B">
	                 		<h3>退单状态：${orderRefund.refundStateStr }&nbsp;&nbsp;&nbsp;&nbsp;
	                 		退款金额：￥${orderRefund.refundPrice } &nbsp;&nbsp;&nbsp;&nbsp;
	                 		退款原因：${orderRefund.refundReason } 
	                 		<shiro:hasPermission name="orderInfo:refund:deatil:refuse">
		                 		<c:if test="${orderRefund.refundState==1 }">
			                 		<button  style="float:right;" class = "btn btn-primary btn-outline glyphicon" id="refuse">拒绝</button>
		                 		</c:if>
	                 		</shiro:hasPermission>
	                 		<shiro:hasPermission name="orderInfo:refund:deatil:changeRefund">
			                 	<c:if test="${orderRefund.refundState==1&&orderRefund.refundType==0 ||orderRefund.refundState==2}">	
			                 		<button  style="float:right;margin-right: 10px;" onclick="changeRefund();" class = "btn btn-primary btn-outline glyphicon">修改退款金额</button>
			                 	</c:if>	
		                 	</shiro:hasPermission>
		                 	<shiro:hasPermission name="orderInfo:refund:deatil:agree">
			                 	<c:if test="${orderRefund.refundState==1&&orderRefund.refundType==1 }">
		                 			<button  style="float:right;margin-right: 10px;" onclick="changeRefund();"  class = "btn btn-primary btn-outline glyphicon">同意退货退款</button>
		                 		</c:if>
	                 		</shiro:hasPermission>
	                 		<c:if test="${orderRefund.refundState==3 }">
	                 			<shiro:hasPermission name="orderInfo:refund:deatil:changeRefund">
	                 				<button  style="float:right;margin-right: 10px;" onclick="changeRefund();" class = "btn btn-primary btn-outline glyphicon update">修改退款金额</button>
	                 			</shiro:hasPermission>
	                 			<shiro:hasPermission name="orderInfo:refund:deatil:confirmReceipt">
	                 				<button  style="float:right;margin-right: 10px;" id="confirmReceipt"  class = "btn btn-primary btn-outline glyphicon">确认收货</button><br>
	                 			</shiro:hasPermission>
	                 		</c:if>
	                 		<shiro:hasPermission name="orderInfo:refund:deatil:confirmRefund">
		                 		<c:if test="${orderRefund.refundState==4 }">
		                 			<button  style="float:right;margin-right: 10px;" id="confirmRefund"  class = "btn btn-primary btn-outline glyphicon">确认退款</button>
		                 		</c:if>
	                 		</shiro:hasPermission>
	                 			<c:if test="${orderRefund.refundState==2 }">
		                 			<button  style="float:right;margin-right: 10px;" id="assist-delivery"  class = "btn btn-primary btn-outline glyphicon">协助发货</button>
		                 		</c:if>
	                 		</h3>
	                 	</div>
	                 	<div class="panel-body  bg-from pad0B">
	                 		<h4>退单流程：</h4>
	                 	</div>
	                 	<div class="panel-body  bg-from pad0B">
	                 		<div class="col-sm-1 form-group form-two" ></div>
	                 		<c:if test="${orderRefund.refundType==0 && orderRefund.refundState!=6 }">
								<div class="col-sm-1 form-group form-two" style="margin-left: -30px">
									<p>买家发起退款</p>
									<c:if test="${orderRefund.refundState==1 }">
										<p class="start over"><span><span>1</span></span><span><span style="width: 50%"></span></span></p>
									</c:if>	
									<c:if test="${orderRefund.refundState>1 }">
										<p class="start over"><span><span>1</span></span><span><span style="width: 100%"></span></span></p>
									</c:if>						
								</div>
								<div class="col-sm-1 form-group form-two" style="margin-left: -30px">
									<p>待退款</p>
									<c:if test="${orderRefund.refundState < 4 }">
										<p class="start "><span><span>2</span></span><span><span></span></span></p>
									</c:if>
									<c:if test="${orderRefund.refundState==4 }">
										<p class="start over"><span><span>2</span></span><span><span style="width: 50%"></span></span></p>
									</c:if>
									<c:if test="${orderRefund.refundState > 4 }">
										<p class="start over"><span><span>2</span></span><span><span style="width: 100%"></span></span></p>
									</c:if>
								</div>
								<div class="col-sm-1 form-group form-two" style="margin-left: -30px">
									<p>售后完成</p>
									<c:if test="${orderRefund.refundState < 5 }">
										<p class="start "><span><span>3</span></span></p>
									</c:if>
									<c:if test="${orderRefund.refundState==5 }">
										<p class="start over"><span><span>3</span></span></p>
									</c:if>
								</div>
							</c:if>
							<c:if test="${orderRefund.refundType==1 && orderRefund.refundState!=6 }">
								<div class="col-sm-1 form-group form-two" style="margin-left: -30px">
									<p>买家发起退货退款</p>
									<c:if test="${orderRefund.refundState==1 }">
										<p class="start over"><span><span>1</span></span><span><span style="width: 50%"></span></span></p>
									</c:if>	
									<c:if test="${orderRefund.refundState>1 }">
										<p class="start over"><span><span>1</span></span><span><span style="width: 100%"></span></span></p>
									</c:if>
								</div>
								<div class="col-sm-1 form-group form-two" style="margin-left: -30px">
									<p>同意退货退款</p>
									<c:if test="${orderRefund.refundState < 2 }">
										<p class="start "><span><span>2</span></span><span><span></span></span></p>
									</c:if>
									<c:if test="${orderRefund.refundState==2 }">
										<p class="start over"><span><span>2</span></span><span><span style="width: 50%"></span></span></p>
									</c:if>
									<c:if test="${orderRefund.refundState > 2 }">
										<p class="start over"><span><span>2</span></span><span><span style="width: 100%"></span></span></p>
									</c:if>
								</div>
								<div class="col-sm-1 form-group form-two" style="margin-left: -30px">
									<p>买家退货中</p>
									<c:if test="${orderRefund.refundState < 3 }">
										<p class="start "><span><span>3</span></span><span><span></span></span></p>
									</c:if>
									<c:if test="${orderRefund.refundState==3 }">
										<p class="start over"><span><span>3</span></span><span><span style="width: 50%"></span></span></p>
									</c:if>
									<c:if test="${orderRefund.refundState > 3 }">
										<p class="start over"><span><span>3</span></span><span><span style="width: 100%"></span></span></p>
									</c:if>
								</div>
								<div class="col-sm-1 form-group form-two" style="margin-left: -30px">
									<p>待退款</p>
									<c:if test="${orderRefund.refundState < 4 }">
										<p class="start "><span><span>4</span></span><span><span></span></span></p>
									</c:if>
									<c:if test="${orderRefund.refundState==4 }">
										<p class="start over"><span><span>4</span></span><span><span style="width: 50%"></span></span></p>
									</c:if>
									<c:if test="${orderRefund.refundState > 4 }">
										<p class="start over"><span><span>4</span></span><span><span style="width: 100%"></span></span></p>
									</c:if>
								</div>
								<div class="col-sm-1 form-group form-two" style="margin-left: -30px">
									<p>售后完成</p>
									<c:if test="${orderRefund.refundState < 5 }">
										<p class="start "><span><span>3</span></span></p>
									</c:if>
									<c:if test="${orderRefund.refundState==5 }">
										<p class="start over"><span><span>3</span></span></p>
									</c:if>
								</div>
							</c:if>
							<c:if test="${orderRefund.refundState==6 }">
								<div class="col-sm-1 form-group form-two" style="margin-left: -30px">
									<p>买家发起退款(买家发起退货退款)</p>
									<p class="start over"><span><span>1</span></span><span><span style="width: 100%"></span></span></p>						
								</div>
								
								<div class="col-sm-1 form-group form-two" style="margin-left: -30px">
									<p>已拒绝</p>
									<p class="start over"><span><span>5</span></span></p>
								</div>
							</c:if>
	                 	</div> 
	                 	<div class="panel-body  bg-from pad0B">
	                 		 <table class="table table-striped table-bordered table-hover">
	                            <thead>
	                                <tr>
	                                    <th class="col-sm-3" style="text-align: center;">客户信息</th>
										<th class="col-sm-3" style="text-align: center;">原订单信息</th>
										<th class="col-sm-3" style="text-align: center;">售后信息</th> 
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
	                            			订单类型：${orderInfo.typeStr }<br>
	                            			订单编号：${orderInfo.orderNumber }<br>
	                            			下单时间：${orderInfo.createTimeStr }<br>
	                            			买家备注：${orderInfo.remark }<br>
	                            			支付时间：${orderInfo.payTimeStr }<br>
	                            			支付方式：${orderInfo.payWayStr}<br>
	                            			<c:if test="${not empty orderInfo.thirdPayNumber }">支付单号：${orderInfo.thirdPayNumber }</c:if>
	                            			
	                            		</td>
	                            		<td>
		                            		售后编号：${orderRefund.refundNumber }<br>
		                            		售后状态：${orderRefund.refundStateStr}<br>
		                            		售后类型：
		                            		<c:if test="${orderRefund.refundType==0 }">仅退款</c:if>
				                 			<c:if test="${orderRefund.refundType==1 }">退货退款</c:if>
		                            		<br>
		                            		退款金额：￥${orderRefund.refundPrice }<br>
		                            		买家申请退款金额：￥${orderRefund.applyPrice }<br>
		                            		申请时间：${fn:split(orderRefund.applyTime,".")[0]}<br>
		                            		<c:if test="${not empty orderRefund.agreeTime }">
			                            		同意退款时间：${fn:split(orderRefund.agreeTime,".")[0]}<br>		                            		
		                            		</c:if>
		                            		<c:if test="${not empty orderRefund.sendBackTime }">
			                            		货物退货时间：${fn:split(orderRefund.sendBackTime,".")[0]}<br>		                            		
		                            		</c:if>
		                            		<c:if test="${not empty orderRefund.sendReceiveTime }">
			                            		确认收货时间：${fn:split(orderRefund.sendReceiveTime,".")[0]}<br>		                            		
		                            		</c:if>
		                            		<c:if test="${not empty orderRefund.finishTime }">
			                            		财务审核时间：${fn:split(orderRefund.finishTime,".")[0]}<br>		                            		
		                            		</c:if>
		                            		
		                            		退款原因：${orderRefund.refundReason }<br>
		                            		退款说明：${orderRefund.refundRemark }<br>
		                         			凭&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;证：
		                         			<c:forEach items="${listPic }" var="li">
		                         				<img src="${img_ctx }/${li}" onclick="extendPic(this)" style="width: 56px;">	   			
		                         			</c:forEach>
	                            		</td>
	                            		<td>
	                            		${orderRefund.backgroundRemark }<br>
	                            		<shiro:hasPermission name="orderInfo:refund:deatil:remark">
	                            		<button  class = "btn btn-primary btn-outline glyphicon" onclick = "backgroundRemark(${orderRefund.id});">修改备注</button>
	                            		</shiro:hasPermission></td>
	                            	</tr>
                            	</tbody>
                        	</table>
	                 	</div>
	                 	<div class="panel-body  bg-from pad0B" >
	                 	
	                 		 <table class="table table-striped table-bordered table-hover">
	                 		  	<thead>
	                                <tr>
	                                    <th><h3>售后商品信息</h3></th>
										<%-- <th colspan="7">店铺：${orderInfo.storeName }(${orderInfo.storeSerial})</th> --%>
										
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
	                                </tr>
	                             </thead>
	                             <tbody>
		                             	<tr>
		                                    <td><img src="${orderItem.productPic }@80w_80h_1e_1c_75Q.jpg"></td>
											<td>${orderItem.productName }</td>
											<td>${orderItem.productSerial }</td>
											<td>${orderItem.productTypeNames }</td>
											<td>
												<c:if test="${orderItem.isSelf==0 }">非自营</c:if>
												<c:if test="${orderItem.isSelf==1 }">自营</c:if>
											</td>
											<td>${orderItem.price }</td>
											<td>${orderItem.quantity }</td>
											<td>${orderItem.price*orderItem.quantity }</td> 
		                                </tr>

	                             </tbody>
	                            <tbody>
	                            	<tr>
	                            		<td colspan="8">
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

	                 		 <table class="table table-striped table-bordered table-hover">
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
										<th>操作</th>
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
											<td><a onclick="logisticsDetails($(this));" data-id="${li.id }">${li.companyNumber }</a></td>
											<td>${li.receiveName }</td>
											<c:if test="${orderInfo.state <= 6 }">
												<td><a onclick="editCompany(this);">修改物流</a></td>
											</c:if>
		                                </tr>
		                            </c:forEach>
                            	</tbody>
                        	</table>
	                 	</div>
	                 	<div class="panel-body  bg-from pad0B">

	                 		 <table class="table table-striped table-bordered table-hover">
	                 		  <thead>
	                                <tr>
	                                    <th colspan="5">退货记录</th>
									
	                                </tr>
	                             </thead>
	                            <thead>
	                                <tr>
	                                    <th>商品信息</th>
										<th>建立时间</th>
										<th>配送方式</th> 
										<th>物流单号</th>
										<!-- <th>退款凭证</th> -->
	                                </tr>
	                             </thead>
	                            <tbody >
	                            	<c:if test="${orderRefund.refundType==1 && orderRefund.refundState>=3 }">
		                            	<tr>
		                                    <td>${orderItem.productName }*${orderItem.quantity}</td>
											<td>${orderRefund.sendBackTime }</td>
											<td>${orderRefund.postCompany }</td> 
											<td>${orderRefund.postNumber }<%-- <a onclick="logisticsDetails($(this));" data-id="${orderRefund.postNumber }">${orderRefund.postNumber }</a> --%></td>
											<%-- <td>
												<c:forEach items="${listPic }" var="li">
			                         				<img src="${img_ctx }/${li}" style="width: 40px;">	   			
			                         			</c:forEach>
											</td> --%>
		                                </tr>
		                            </c:if>
		                            <c:if test="${orderRefund.refundType==0}">
		                            	<tr>
		                            		<td colspan="5" style="text-align: center;">无数据</td>
		                            	</tr>
		                            </c:if>
                            	</tbody>
                        	</table>
	                 	</div>
	                 	
	                 </div>
                 </div>
             </div>
         </div>        
	</div>
	<!-- 修改退款金额弹框-->
	<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <div class="col-md-12 modal-title">
						<div class="col-md-4 modal-title-info">修改退款金额</div>
					</div>
                </div>
                <div class="modal-body all">
                    <div class="form-group">
                    	<label class="col-sm-3 control-label">退款金额：</label>
				        <div class="col-sm-8">
				            <input type="number" id="refundPrice" name="refundPrice" value="${orderRefund.refundPrice }" class="form-control trimInput">
				        </div>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                    	<label class="col-sm-5 control-label">是否扣除店铺及相关上级收益：</label>
				        <div class="col-sm-7 isDeductIncome">
				        	<c:if test="${orderRefund.isDeductIncome==0 }">
					        	<label class="radio-inline">
					                <input type="radio" checked="" style="margin-left: -15px;margin-top: 2px;" value="0" name="isDeductIncome">是</label>
					            <label class="radio-inline">
					                <input type="radio" value="1" style="margin-left: -15px;margin-top: 2px;" name="isDeductIncome">否</label>
				        	</c:if> 
                    		<c:if test="${orderRefund.isDeductIncome==1 }">
	                    		<label class="radio-inline">
					                <input type="radio"  style="margin-left: -15px;margin-top: 2px;" value="0" name="isDeductIncome">是</label>
					            <label class="radio-inline">
					                <input type="radio" checked="" value="1" style="margin-left: -15px;margin-top: 2px;" name="isDeductIncome">否</label>
                    		</c:if>
				            
				        </div>
                    </div>
                </div>
                <div class="modal-body " style="height: 150px;">
                    <div class="form-group">
                    	<label class="col-sm-3 control-label">备注：</label>
				        <div class="col-sm-8">
				            <textarea rows="4" cols="46" id="remark" name="remark">${orderRefund.remark }</textarea>
				        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <div type="button" class="btn btn-primary" id="saveAmount">保存</div>
                    <c:if test="${orderRefund.refundState<2 }">
	                    <c:if test="${orderRefund.refundType==0 }">
	                    	<div type="button" class="btn btn-primary" onclick="saveExamine(4)" >同意退款</div>
	                    </c:if>
	                    <c:if test="${orderRefund.refundType==1 }">
	                    	<div type="button" class="btn btn-primary" onclick="saveExamine(2)" >同意退货退款</div>
	                    </c:if>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <!-- 确认退款弹框-->
	<div class="modal inmodal" id="myModal2" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <div class="col-md-12 modal-title">
						<div class="col-md-4 modal-title-info">确认退款</div>
					</div>
                </div>
                <div class="modal-body all">
                    <div class="form-group">
                    	<label class="col-sm-3 control-label">退款金额：</label>
				       
				        ${orderRefund.refundPrice } &nbsp;&nbsp;元
				       
                    </div>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                    	<label class="col-sm-12 control-label">是否扣除店铺及相关上级收益：
                    		<c:if test="${orderRefund.isDeductIncome==0 }">是</c:if> 
                    		<c:if test="${orderRefund.isDeductIncome==1 }">否</c:if> 
                    	</label>
				        
                    </div>
                </div>
                <div class="modal-body " style="height: 150px;">
                    <div class="form-group">
                    	<label class="col-sm-3 control-label">备注：</label>
				        <div class="col-sm-8">
				            ${orderRefund.remark }
				        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <div type="button" class="btn btn-primary" id="complete" onclick="confirmRefund();">保存</div>
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
							<label class="radio-inline" style="margin-right: -5px;">
				                <input type="radio" value="4" name="backgroundMemoMark"  style="margin-top: 5px;">&nbsp;
								<img src="${ctx }/images/flag/pic4.png">
							</label>
							<label class="radio-inline"  style="margin-right: -5px;">
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
    <!-- 协助发货 -->
    <div class="modal inmodal" id="model-assist-delivery" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <div class="col-md-12 modal-title">
						<div class="col-md-4 modal-title-info">填写物流</div>
					</div>
                </div>
                <div class="modal-body all">
                    <div class="form-group">
                    	<label class="col-sm-3 control-label">物流公司：</label>
				        <div class="col-sm-8">
				            <select id="postCompany" name="postCompany" class="form-control">
						    	<option value="">请选择</option>
								<c:forEach items="${company }" var="li">
									<option value="${li.company }">${li.company }</option>
								</c:forEach>
							</select>
				        </div>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                    	<label class="col-sm-3 control-label">物流单号：</label>
				        <div class="col-sm-8">
				            <input type="text" id="postNumber" name="postNumber" class="form-control trimInput">
				        </div>
                    </div>
                </div>  
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <div type="button" class="btn btn-primary" id="saveDelivery">保存</div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="refundId" name="refundId" value="${orderRefund.id }">
    <script src="${ctx }/template/hplus/js/plugins/jeditable/jquery.jeditable.js?v=${version}"></script>
	<script src="${ctx }/template/hplus/js/plugins/layer/laydate/laydate.js?v=${version}"></script>
	<script type="text/javascript">
	
	/* function goDetailOrder(){
		var id = $("#refundId").val();
		location.href = ctx + "/admin/orderRefund/go/detail-order-refund?id="+id;
	} */
	function changeRefund(){
		$("#myModal").modal("show");  
	}
	//保存修改退款金额
	$("#saveAmount").click(function(){
		var refundPrice =$("#refundPrice").val();
		var remark = $("#remark").val();
		var isDeductIncome = $('input[name="isDeductIncome"]:checked ').val();
		var id = '${orderRefund.id}';
		var type = '${orderRefund.refundType}';
		var refundState = '${orderRefund.refundState}';
		layer.confirm("是否确认修改退款金额？",{skin : 'layui-layer-molv',title : '系统提示' },function(layero,index){
			if(type==0 || refundState==3){
				$.ajax({
					url: ctx + "/admin/orderRefund/edit-refund-price",
		            type: 'post',
		            dataType: 'json',
		            data: {
		            	refundPrice: refundPrice,
		            	remark:remark,
		            	isDeductIncome:isDeductIncome,
		            	id:id,
		            },
		            success: function(data) {
		                $(".ui-button").removeAttr("disabled");
		                if (data.success) {
		                   layer.msg("修改成功!");
		                   setTimeout('viewDetails('+id+')', 800);
		                } else {
		                  layer.msg(data.info);
		                };
		            },
		            error: function(data) {
		                $(".ui-button").removeAttr("disabled");
		                layer.msg(data.info);
		            }
		        });
			}else {
				$.ajax({
					url: ctx + "/admin/orderRefund/edit-refund-price",
		            type: 'post',
		            dataType: 'json',
		            data: {
		            	refundPrice: refundPrice,
		            	remark:remark,
		            	isDeductIncome:isDeductIncome,
		            	id:id,
		            	refundState:2,
		            },
		            success: function(data) {
		                $(".ui-button").removeAttr("disabled");
		                if (data.success) {
		                   setTimeout('viewDetails('+id+')', 800);
		                } else {
		                  layer.msg(data.info);
		                }
		            },
		            error: function(data) {
		                $(".ui-button").removeAttr("disabled");
		                layer.msg(data.info);
		            }
		        });
			}
			$("#myModal").modal("hide");
		});
	});
	
	//修改完成，提交财审
	function saveExamine(refundState){
		var refundPrice =$("#refundPrice").val();
		var remark = $("#remark").val();
		var isDeductIncome = $('input[name="isDeductIncome"]:checked ').val();
		var id = '${orderRefund.id}';
		var str = '是否同意退款并确认退款金额？(同意后将无法修改退款金额)';
		if(refundState==2){
			str = '是否同意退货退款？';
		}
		layer.confirm(str,{skin : 'layui-layer-molv',title : '系统提示'},function(layero,index){
			$.ajax({
				url: ctx + "/admin/orderRefund/edit-refund-price",
	            type: 'post',
	            dataType: 'json',
	            data: {
	            	refundPrice: refundPrice,
	            	remark:remark,
	            	id:id,
	            	refundState:refundState,
	            	isDeductIncome:isDeductIncome,
	            },
	            success: function(data) {
	                $(".ui-button").removeAttr("disabled");
	                if (data.success) {
	                   setTimeout('viewDetails('+id+')', 800);
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
	//后台拒绝退款
	$("#refuse").click(function(){
		var id = '${orderRefund.id}';
		layer.confirm("是否确认拒绝退款？",{skin : 'layui-layer-molv',title : '系统提示'},function(layero,index){
			$.ajax({
				url: ctx + "/admin/orderRefund/refuse-refund",
	            type: 'post',
	            dataType: 'json',
	            data: {
	            	id:id,
	            	refundState:6,
	            },
	            success: function(data) {
	                $(".ui-button").removeAttr("disabled");
	                if (data.success) {
	                   setTimeout('viewDetails('+id+')', 800);
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
	});
	//确认收货
	$("#confirmReceipt").click(function(){
		var id = '${orderRefund.id}';
		layer.confirm("你是否确认收到货物？(点击确定默认提交财审)",{skin : 'layui-layer-molv',title : '系统提示'},function(layero,index){
			$.ajax({
				url: ctx + "/admin/orderRefund/refuse-refund",
	            type: 'post',
	            dataType: 'json',
	            data: {
	            	id:id,
	            	refundState:4,
	            },
	            success: function(data) {
	                $(".ui-button").removeAttr("disabled");
	                if (data.success) {
	                	setTimeout('viewDetails('+id+')', 800);
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
	});
	$("#confirmRefund").click(function(){
		$("#myModal2").modal("show"); 
	});
	//确认退款 保存
	function confirmRefund(){
		var id = '${orderRefund.id}';
		var adminId = '${adminId}'
		$.ajax({
			url: ctx + "/api/wxpay/refund-submit",
            type: 'post',
            dataType: 'json',
            data: {
            	id:id,
            	adminId:adminId,
            },
            success: function(data) {
                $(".ui-button").removeAttr("disabled");
                if (data.success) {
                	setTimeout('viewDetails('+id+')', 800);
                } else {
                  layer.msg(data.info);
                }
            },
            error: function(data) {
                $(".ui-button").removeAttr("disabled");
                layer.msg(data.info);
            }
        });
	}
	function backgroundRemark(id){
		   $.ajax({
	       	url: ctx + "/admin/orderRefund/get-order-info",
	           dataType: "json",
	           type: "post",
	           data: {
	               id: id,
	           },
	           success: function(data) {
	           	if(data.success){
	           		$("#background-remark").modal("show");
	           		$(":radio[name=backgroundMemoMark][value="+data.orderRefund.backgroundMemoMark+"]").attr("checked","true");
		            $("#backgroundRemark").html(data.orderRefund.backgroundRemark);
	           	}
	           },
	           error: function(text) {
	           	layer.msg("failed");
	           }
	   	}); 
	}
	 $("#saveRemark").click(function(){
	       	var id = $("#refundId").val();
	       	var backgroundMemoMark =$('input:radio[name="backgroundMemoMark"]:checked').val();
	       	var backgroundRemark =$("#backgroundRemark").val();
	       	$.ajax({
	               url: ctx + "/admin/orderRefund/edit-background-remark",
	               type: 'post',
	               dataType: 'json',
	               data: {
	                   id: id,
	                   backgroundMemoMark:backgroundMemoMark,
	                   backgroundRemark:backgroundRemark
	               },
	               success: function(data) {
	                   //$(".ui-button").removeAttr("disabled");
	                   if (data.success) {
	                      layer.msg("修改成功!");
	                      setTimeout('viewDetails('+id+')', 800);
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
		//查看详情
	    function viewDetails(id){
	    	location.href = ctx + '/admin/orderRefund/go/detail-order-refund?id='+id;
	    }
	    function logisticsDetails(_this){
	    	var companyNumber = _this.attr("data-id");
	       $("div.log_item").remove();
	 	   $.ajax({
	        	url: ctx + "/admin/postcompany/get-logistics-details",
	            dataType: "json",
	            type: "post",
	            data: {
	         	   companyNumber: companyNumber,
	            },
	            success: function(data) {
	         	   if(data.success){
	         		   var list = data.logisticsdetails.result.list;
	         		   var html = '';
	         		   if(!list){
	         			  alert("物流编号不存在");
        		  		   return;
	         		   }
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
	    	var id = $("#refundId").val();
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
	                     	id:deliveryId,
	                     },
	                     success: function(data) {
	                         $(".ui-button").removeAttr("disabled");
	                         if (data.success) {
	                            layer.msg("修改成功!");
	                            setTimeout('viewDetails('+id+')', 800);
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
	    //后台协助发货
	    $("#assist-delivery").click(function(){
	    	$("#model-assist-delivery").modal("show");
	    });
	    //保存发货信息
	    $("#saveDelivery").click(function(){
	    	var id = $("#refundId").val();
	    	var postCompany = $("#postCompany").val();
	    	var postNumber = $("#postNumber").val();
	    	$.ajax({
                url: ctx + "/admin/orderRefund/save-delivery",
                type: 'post',
                dataType: 'json',
                data: {
                	postCompany: postCompany,
                	postNumber:postNumber,
                	id:id,
                },
                success: function(data) {
                    $(".ui-button").removeAttr("disabled");
                    if (data.success) {
                    	$("#model-assist-delivery").modal("hide");
                       layer.msg("协助发货成功!");
                       setTimeout('viewDetails('+id+')', 800);
                    } else {
                      layer.msg(data.info);
                    }
                },
                error: function(data) {
                    $(".ui-button").removeAttr("disabled");
                    layer.msg(data.info);
                }
            });
	    })
	</script>
</body>

</html>
