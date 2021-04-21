$(function() {
    //제일 처음 FAQ 열어주기
    $('.faq_list').find('dt:eq(0)').attr('class', 'faq_on');
    $('.faq_list').find('dt:eq(0)').next().slideDown();
    let acodian = {
        click: function(target) {
            let _self = this;
            let $target = $(target);
            $target.on('click', function() {
                if ($(this).next().css('display') == 'none') {
                    $('.faq_list dd').slideUp(); //나머지 dd들은 다들 슬라이드업
                    $('.faq_list dt').removeClass('faq_on'); //나머지 dt들의 효과 삭제(class제거)
                    $(this).addClass('faq_on'); //클릭한 dt에는 faq_on 클래스 부여
                    $(this).next().slideDown(); //클릭한 dt 바로다음 dd 슬라이드다운
                } else {
                    $(this).removeClass('faq_on');
                    $(this).next().slideUp();
                }            
            });
        }
    }
    acodian.click('.faq_list dt');

    // 후기작성 버튼클릭시 url이동
    $('.review_area .btn_wrap button').on('click', function() {
        let url = './customer_review_write.jsp';
        location.href = url;
    });

    //후기작성 별점부분
    $('.write_wrap .star_list li a').on('mouseover', function(event) {
        $(this).addClass('on'); 
        $(this).parent().prevAll().children().addClass('on');   //자신포함 이전 a태그 노란 별모양 채워주기
    }).on('mouseleave', function() {
        $(this).removeClass('on');
        $(this).parent().prevAll().children().removeClass('on'); //다시 흑백 별모양으로
    }).on('click', function() {
        event.preventDefault(); //a태그 기본기능 제거
        $(this).addClass('on click');
        $(this).parent().prevAll().children().addClass('on click'); //클릭 했을시에는 click클래스 추가해서 유지해주기
        $(this).parent().nextAll().children().removeClass('click'); //4점일때 3점을 클릭시 3.5, 4, 4.5, 5는 흑백별
        $('#star_score').attr('value', $(this).html());
    })
    
    // 후기작성 ( 예약확인 버튼 이벤트 리스너)
    let numCheck = RegExp(/[^0-9]/);
    console.log(numCheck.test('10'));
    $('#bHp').on('keyup', function() {
    	if (numCheck.test($('#bHp').val())) {
    		alert('숫자만 입력할 수 있습니다.');
    		$('#bHp').val('');
    		$('#bHp').focus();
    	}
    });
    $('#reBookidx').on('keyup', function() {
    	if (numCheck.test($('#reBookidx').val())) {
    		alert('숫자만 입력할 수 있습니다.');
    		$('#reBookidx').val('');
    		$('#reBookidx').focus();
    	}
    });
    
    $('#book_check_btn').on('click', function() {
    	console.log($('#bHp').val());
    	console.log($('#reBookidx').val());
    	
    	if (checkBook()) {
    		$.ajax({
    			type: 'POST',
    			url: './bookCheck.jsp',
    			data: {
    				bHp: $('#bHp').val(),
    				reBookidx: $('#reBookidx').val()
    			},
    			datatype: 'JSON',
    			success: function(bookJSON) {
    				let isData = bookJSON.isData;
    				let bName = bookJSON.bName;
    				let bStart = bookJSON.bStart;
    				let bEnd = bookJSON.bEnd;
    				let bStartdate = bookJSON.bStartdate;
    				let bEnddate = bookJSON.bStartdate;
    				let bIsreview = bookJSON.bIsreview;
    				
    				if (isData == "yes" && bIsreview == "x") {
    					$('#isData_yes').removeClass('hidden');
    					$('#isData_no').addClass('hidden');
    					$('#bName').html(bName);
    					$('#bStart').html(bStart);
    					$('#bEnd').html(bEnd);
    					$('#bStartdate').html(bStartdate);
    					$('#bEnddate').html(bEnddate);
    					$('#bHp').add('#reBookidx').on('keyup', function() {
    						$('#isData_yes').addClass('hidden');
        					$('#isData_no').removeClass('hidden');
    					});
    				} else {
    					$('#isData_yes').addClass('hidden');
    					$('#isData_no').removeClass('hidden');
    				}
    			}
    		})
    	}
    });
    
    $('.page_list li a').on('click', function() {
		$(this).addClass('on');
		$(this).siblings().removeClass('on');
	});
	
	$('#search_btn').on('click', function() {
		$('.minisrch_form').submit();
	});
    $('#reset_btn').on('click', function() {
    	location.href='./customer_notice.jsp?pageNum=1';
    });
});

// 리뷰작성 검증
function checkReview() {
    if ($('#star_score').attr('value') == '') {
        alert('별점을 선택해주세요');
        return false;
    }
    if ($('#reTitle').val() == '') {
        alert('제목을 입력해주세요');
        $('#reTitle').focus();
        return false;
    }
    if ($('.ck-editor__editable').text() < 10) {
        alert('후기 내용은 10자 이상 부탁드립니다');
        return false;
    }
    return true;
}

function checkBook() {
	if ($('#bHp').val() == '') {
		alert('전화번호를 입력하세요');
		$('#bHp').focus();
		return false;
	}
	if ($('#reBookidx').val() == '') {
		alert('예약번호를 입력하세요.');
		$('#reBookidx').focus();
		return false;
	}
	return true;
}

function checkSearch() {
	if ($('input:text[name="keyword"]').val() == '') {
		alert('검색어를 입력하세요');
		$('input:text[name="keyword"]').focus();
		return false;
	}
	return true;
}