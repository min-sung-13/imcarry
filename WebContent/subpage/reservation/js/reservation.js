var phone = "";
var in_name = "" ;

$(function() {
	$("#datepicker_start").datepicker({
	    showButtonPanel: true, 
	    currentText: '오늘 날짜', 
	    closeText: '닫기', 
	    dateFormat: "yy-mm-dd",
	    minDate: 0
	});
   $( "#datepicker_end" ).datepicker({
        showButtonPanel: true, 
        currentText: '오늘 날짜', 
        closeText: '닫기', 
        dateFormat: "yy-mm-dd",
        minDate: 0
   });
   
   var bOver26 = 0;
   var bUnder26 = 0;
   var sum1 = 0;			// 26인치 이상 캐리어 가격
   var sum2 = 0				// 26인치 이하 캐리어 가격
   var totalPrice = 0;		// 총 캐리어 금액
   
   $("#bOver26").keyup(function(event){
	   console.log("들어옴?");
	   bOver26 = (15000 * ($('#bOver26').val()));
	   console.log("bOver26 price : " + bOver26);
	   sum1 += bOver26;
	   totalPrice = sum1+sum2;
	   console.log("sum1 : " + sum1);
	   $("#bPrice").val(totalPrice);
   });
   $("#bUnder26").on('keyup', function(){
	   bUnder26 = (10000*($('#bUnder26').val()));
	   sum2 += bUnder26;
	   totalPrice = sum1+sum2;
	   $("#bPrice").val(totalPrice);
   });
   
   $("#bOver26").mousedown(function() {
	   if($("#bPrice").val() !== 0) {
		   console.log("26인치 이상 캐리어 다시 입력");
		   totalPrice = 0;
		   sum1 = 0;
	   } else {
		   return false;
	   }
   });
   $("#bUnder26").mousedown(function() {
	   if($("#bPrice").val() !== 0) {
		   console.log("26인치 이하 캐리어 다시 입력");
		   totalPrice = 0;
		   sum2 = 0;
	   }
   })
   
   $("#name2").val(localStorage.getItem('name'));
   $("#phone2").val(localStorage.getItem('phone'));
   localStorage.clear();
}); 


// 예약시 작성하는 정보 검사
function chkform() {
	console.log("들어오나요?");
	
	if($("#name2").val() == '') {
		alert('이름을 입력하세요.');
		$("#name2").focus();
		return false;
	}
	
	let numChk = RegExp(/[^0-9]/);
	 $('#phone2').on('keyup', function() {
    	if(numChk.test($('#phone2').val())) {
    		alert('숫자만 입력할 수 있습니다.');
    		$('#phone2').val('');
    		$('#phone2').focus();
    	}
    });
	if($("#phone2").val() == '') {
		alert('연락처를 입력하세요.');
		$("#phone2").focus();
		return false;
	}
	if($("#select_start").val() == '맡기는 장소') {
		alert("맡길 장소를 선택해주세요.");
		$("#select_start").focus();
		return false;
	}
	if($("#select_end").val() == '찾는 장소') {
		alert("찾는 장소를 선택해주세요.");
		$("#select_end").focus();
		return false;
	}
	
	if($("#select_hour").val() == '시 선택') {
		alert("맡길 시간을 선택해주세요.");
		$("#select_hour").focus();
		return false;
	}
	if($("#select_min").val() == '분 선택') {
		alert("맡길 시간을 모두 선택해주세요.");
		$("#select_min").focus();
		return false;
	}
	
	if($("#Datepickerend").val() == '') {
		alert("찾는 날짜를 선택해주세요.");
		$("#Datepickerend").focus();
		return false;
	}
	
	if($("#bOver26").val() == '') {
		alert("26인치 이상 수하물의 갯수를 입력해주세요.");
		$("#bOver26").focus();
		return false;
	}
	if($("#bUnder26").val() == '') {
		alert("26인치 이하 수하물 갯수를 입력해주세요.");
		$("#bUnder26").focus();
		return false;
	}
	return true;
}

// 예약 조회 정보입력 검사
function findMyRes() {
	if($("#name1").val() == '') {
		alert("예약자 성함을 입력하세요.");
		$("#name1").focus();
		return false;
	}
	
	let numChk = RegExp(/[^0-9]/);
	$('#phone2').on('keyup', function() {
	   if(numChk.test($('#phone2').val())) {
		   alert('숫자만 입력할 수 있습니다.');
		   $('#phone2').val('');
		   $('#phone2').focus();
	   	}
	});
	if($("#phone2").val() == '') {
		alert('예약자 연락처를 입력하세요.');
		$("#phone2").focus();
		return false;
	}
	return true;
}
      