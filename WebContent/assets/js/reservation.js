$(function() {
	$('#all').on('click', function() {
		location.href='./reservation.jsp?btn=all';
	});
	$('#future').on('click', function() {
		location.href='./reservation.jsp?btn=future';
	});
	$('#past').on('click', function() {
		location.href='./reservation.jsp?btn=past';
	});
	
	$('#search_btn').on('click', function() {
		$('.minisrch_form').submit();
	});
    $('#reset_btn_a').on('click', function() {
    	location.href='./reservation.jsp?pageNum=1&btn=all';
    });
    $('#reset_btn_p').on('click', function() {
    	location.href='./reservation.jsp?pageNum=1&btn=past';
    });
    $('#reset_btn_f').on('click', function() {
    	location.href='./reservation.jsp?pageNum=1&btn=future';
    });
    
    let numCheck = RegExp(/[^0-9]/);
    console.log(numCheck.test('10'));
    $('input:text[name="keyword"]').on('keyup', function() {
    	if (numCheck.test($('input:text[name="keyword"]').val())) {
    		alert('숫자만 입력할 수 있습니다.');
    		$('input:text[name="keyword"]').val('');
    		$('input:text[name="keyword"]').focus();
    	}
    });
    
    $('.page_list li a').on('click', function() {
		$(this).addClass('on');
		$(this).siblings().removeClass('on');
	});
    
    $('.btn_cancel').on('click', function() {
    	let bIdx = $(this).parent().siblings('.idx').text().trim();
    	let bName = $(this).parent().siblings('.name').text().trim();
    	let btn = $('input:hidden[name="btn"]').val();
    	
    	if (confirm(bName + '('+ bIdx + ') 님의 예약을\n정말로 취소하시겠습니까?')) {
    		location.href='./data/reservation_del_ok.jsp?bIdx=' + bIdx + '&bName=' + bName + '&btn=' + btn;
    	}
    });
});

window.onload = function() {
	$('#all').removeClass('on');
	$('#future').removeClass('on');
	$('#past').removeClass('on');
	if ($('.card-title').text() == '모든 예약') {
		$('#all').addClass('on');
	} else if ($('.card-title').text() == '지난 예약') {
		$('#past').addClass('on');
	} else {
		$('#future').addClass('on');
	}
}