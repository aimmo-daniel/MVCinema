<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<div id="pay_way" style="height: 530px;">
	<div id="guest_way">
		<div id="way" class="col-md-6 col-md-offset-4">
			<table style="width: 50%; margin-top: 50px;">
				<tr>
					<th colspan="2"><h1 align="center" style="margin-bottom: 20px;">
							<label class="label label-success">결제 수단</label>
						</h1></th>
				</tr>
				<tr>
					<td align="center"><label class="radio-inline"> <input
								type="radio" name="inlineRadioOptions" id="test" value="test_way"
								onclick="test_type()" checked="checked">핸드폰 결제(가상 결제)
					</label></td>
					<td align="center"><label class="radio-inline"> <input
								type="radio" name="inlineRadioOptions" id="card_way" value="card"
								onclick="card_type()">휴대폰 소액결제(다날)
					</label></td>

				</tr>
			</table>
		</div>
		<div class="col-md-5  col-md-offset-1">
			<h2 style="margin-left: 30px;">
				<label class="label label-warning">비회원 예매전  주의 사항</label>
			</h2>
			<nav>
				<ul>
					<li><b>비회원 예매 취소는 현장에서만 취소 가능합니다.</b></li>
					<li><b>카드사 & 통신사의 사정에 따라 취소가 지연될수있습니다.</b></li>
					<li><b>비회원 예매 내역은 인증하신 메일에서만 확인이 가능합니다.</b></li>
					<li><b>비회원 예매 후 메일 수신을 받지못한경우 1:1 문의 또는 현장 문의 부탁드립니다.</b></li>
					<li><b>입장 지연에 따른 관람 불편을 최소화하기 위해 본 영화는 10분 후 상영이 시작됩니다.</b></li>
				</ul>
			</nav>
		</div>
		</div>
		<div id="test" style="display: block;" class="col-md-6">
			<div class="table_wrap card_default" id="card_default">
				<table class="table table-default"
					style="width: 80%; margin-left: 5%; margin-top: 20px;">
					<tbody>
						<tr>
						<th>이메일</th>
						<td><input type="email" id="guest_email" class="form-control" placeholder="example@daum.net"></td>
						<td><input type="button" class="btn btn-default" value="메일 발송" onclick="check_mail()"></td>
						</tr>
						<tr id="check_rndNum" hidden="hidden">
						<th>인증 번호</th>
						<td><input type="text" id="guest_num" class="form-control" id="rndNum" placeholder="인증번호"></td>
						<td><input type="button" class="btn btn-default" value="인증번호 확인" onclick="rnd_check()"></td>
						</tr>
						<tr>
							<th scope="row"><label for="lp_card_type">통신사</label></th>
							<td><div>
									<select id="phone_type" class="form-control">
										<option value="-" selected="selected">통신사를 선택하세요</option>
										<option value="KT">KT</option>
										<option value="SKT">SKT</option>
										<option value="LGU">LGU+</option>
										<option value="HM">알뜰폰</option>
									</select>
								</div></td>
						</tr>
						<tr id="input_card_num">
							<th scope="row"><label for="phone_no1">핸드폰번호</label></th>
							<td>
								<div class="form-inline">
									<div class="form-group">
										<div class="col-md-3" style="padding: 0px;">
											<input class="form-control" id="phone_no1" type="text" maxlength="3"
												style="width: 80px;">
										</div>
										<span class="col-md-1">-</span>
										<div class="col-md-3" style="padding: 0px;">
											<input class="form-control" id="phone_no2" type="text" maxlength="4"
												style="width: 80px;">
										</div>
										<span class="col-md-1">-</span>
										<div class="col-md-3" style="padding: 0px;">
											<input class="form-control" id="phone_no3" type="text" maxlength="4"
												style="width: 80px;">
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr class="phone_owner_jumin">
							<th scope="row"><label for="phone_ssn">생년월일</label>
							<td>
								<div class="form-inline">
									<div class="form_group">
										<input class="form-control" id="phone_ssn" type="text" maxlength="6"
											width="100px;">
										<span class="divider">-</span><span class="password"><b>*&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;*</b></span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="button"
									class="btn btn-primary btn-lg" value="결제" onclick="final_payment()"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>