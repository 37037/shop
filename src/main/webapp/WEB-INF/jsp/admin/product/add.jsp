<%@ page language="java" pageEncoding="UTF-8"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<LINK href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet">
	</HEAD>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">
		//当页面加载完毕之后，发起一个异步的请求，获取所有分类的json
		$(function() {
			$.getJSON("${pageContext.request.contextPath}/findAllCategory.action",function(result){
				//得到所有分类的json数据之后，遍历这个json数组
				$(result).each(function(index,element) {
					//index表示每次遍历的下标，element表示每次遍历出来的json对象{"cid":"sadsafda","cname":"炒饭炒粉"}
					$("#category").append("<option value='"+element.cid+"'>"+element.cname+"</option>")
				})
			})
		})
	</script>
	<body>
		<!--  -->
		<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/admin/addProducts.action" method="post" enctype="multipart/form-data">
			&nbsp;
			<table cellSpacing="1" cellPadding="5" width="80%" align="center" bgColor="gray" style="border: 1px solid grey" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="gray" colSpan="4"
						height="26">
						<strong><STRONG>添加商品</STRONG>
						</strong>
					</td>
				</tr>

				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品名称（必填）：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="text" name="pname" id="pname" value="${product.pname}" id="userAction_save_do_logonName" class="bg"/>
					</td>
					<td style="display: none" width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						销量：
					</td>
					<td  style="display: none" class="ta_01" bgColor="#ffffff">
                        <input type="number" name="is_latest" id="is_latest" readonly>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						市场价格（必填）：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="number" name="market_price" value="" id="pmarket" class="bg"/>
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商城价格（必填）：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="number" name="shop_price" value="" id="pshop" class="bg"/>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品图片（必填）：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="file" name="pictrueFile" id="pimage" />
					</td>
					
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						数量（必填）：
					</td>
					<td class="ta_01" bgColor="#ffffff">
<%--						<select name="is_latest">--%>
<%--							<option value="1">是</option>--%>
<%--							<option value="0">否</option>--%>
<%--						</select>--%>
						<input type="number" name="pcount" id="pcount">
					</td>
					
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						所属分类（必填）：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<select id="category" name="cid">
								
						</select>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品描述（必填）：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<textarea name="pdesc" rows="5" cols="30" id="pdesc"></textarea>
					</td>
				</tr>
				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center"
						bgColor="#f5fafe" colSpan="4">
						<button  id="userAction_save_do_submit" class="button_ok" type="button">
							确定
						</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
						<span id="Label1"></span>
					</td>
				</tr>
			</table>
		</form>
	</body>
	<script>
		$("#userAction_save_do_submit").click(function () {
			if($("#pname").val()!=""&&$("#pmarket").val()!=""&&$("#pshop").val()!=""&&$("#pimage").val()!=""&&$("#pdesc").val()!=""&&$("#pcount").val()!=""){
				$("#userAction_save_do").submit();
			}else {
				alert("请确保必填项不为空")
			}
		})
	</script>
</HTML>