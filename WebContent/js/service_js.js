let totCnt = $("#totCnt").val();	// 전체 게시물 수
let recNum = 4;	// 한 페이지당 보여줄 개수
let currentPage = 1;
let end = currentPage+4;
let start = end - 4;
let totPage = totCnt / recNum;
totPage = Math.floor(totPage);
if(totCnt % recNum > 0){
	totPage++;
}
if(totPage < end){
	end = totPage;
}
let startPage = 1;
let endPage = 5;

$(function(){
	$(".paging").prepend("<div><a id='prev' onclick='minusPage()' href='javascript:paging("+(currentPage-1)+")'><img src='../../images/ico/prev_btn.jpg' alt='이전'></a></div>");
	$("#prev").css("visibility", "hidden");
		
	for(let i=startPage; i<=endPage; i++){
		if(i == currentPage){
			$(".paging").append("<a href='javascript:paging("+i+")'>"+i+"</a>");
			$(".paging a").addClass("aOn");
		}else{
			$(".paging").append("<a href='javascript:paging("+i+")'>"+i+"</a>");
		}
	}
	
	if(totPage > 5){
		$(".paging").append("<div><a id='next' onclick='plusPage()' href='javascript:paging("+(endPage+1)+")'><img src='../../images/ico/next_btn.jpg' alt='다음'></a></div>");
	}
	
	if(totPage >= startPage && totPage <= endPage){
		$("#next").remove();
		let lastPage;
		
		switch(currentPage){
			case totPage :
				lastPage = currentPage % 5;
				break;
			case totPage-1 :
				lastPage = (currentPage % 5) + 1;
				break;
			case totPage-2 :
				lastPage = (currentPage % 5) + 2;
				break;
			case totPage-3 :
				lastPage = (currentPage % 5) + 3;
				break;
			case totPage-4 :
				lastPage = (currentPage % 5) + 4;
				break;
		}
		$(".paging").children("a:nth-child("+(lastPage+1)+")").nextAll().remove();
	}
	
    // serve_infor 슬라이드
    let media = window.matchMedia('( max-width: 800px )');
    if(media.matches == true) {
        $('#s1').on('click', function() { //메뉴가 클릭되었을 때
            $('.infor_menu a').removeClass('on'); // 메뉴 리스트에 모든 a는 on 클래스 제거
            $(this).addClass('on'); // 클릭된 본인만 on클래스
            $('.slider').animate('none');
            $('.infor_shop > li').addClass("off3");
            $('.infor_shop > li').removeClass("on3");
            $('.infor_shop > li:first-child').removeClass("off3");
            $('.infor_shop > li:first-child').addClass("on3");
        });
        $('#s2').on('click', function() {
            $('.infor_menu a').removeClass('on');
            $(this).addClass('on');
            $('.slider').animate('none');
            $('.infor_shop > li').addClass("off3");
            $('.infor_shop > li').removeClass("on3");
            $('.infor_shop > li:nth-child(2)').removeClass("off3");
            $('.infor_shop > li:nth-child(2)').addClass("on3");
        });
        $('#s3').on('click', function() {
            $('.infor_menu a').removeClass('on');
            $(this).addClass('on');
            $('.slider').animate('none');
            $('.infor_shop > li').addClass("off3");
            $('.infor_shop > li').removeClass("on3");
            $('.infor_shop > li:nth-child(3)').removeClass("off3");
            $('.infor_shop > li:nth-child(3)').addClass("on3");
        });
        $('#s4').on('click', function() {
            $('.infor_menu a').removeClass('on');
            $(this).addClass('on');
            $('.slider').animate('none');
            $('.infor_shop > li').addClass("off3");
            $('.infor_shop > li').removeClass("on3");
            $('.infor_shop > li:nth-child(4)').removeClass("off3");
            $('.infor_shop > li:nth-child(4)').addClass("on3");
        });
    }else{
        $('#s1').on('click', function() { //메뉴가 클릭되었을 때
            $('.infor_menu a').removeClass('on'); // 메뉴 리스트에 모든 a는 on 클래스 제거
            $(this).addClass('on'); // 클릭된 본인만 on클래스
            $('.slider').animate({ // ul자체 포지션을 조절
                left: '0'
            },1000) //애니메이션 속도
        });
        $('#s2').on('click', function() {
            $('.infor_menu a').removeClass('on');
            $(this).addClass('on');
            $('.slider').animate({
                left: '-1200px'
            },1000)
        });
        $('#s3').on('click', function() {
            $('.infor_menu a').removeClass('on');
            $(this).addClass('on');
            $('.slider').animate({
                left: '-2400px'
            },1000)
        });
        $('#s4').on('click', function() {
            $('.infor_menu a').removeClass('on');
            $(this).addClass('on');
            $('.slider').animate({
                left: '-3600px'
            },1000)
        });
    }
    
});

function plusPage(){
	startPage += 5;
	endPage += 5;
}

function minusPage(){
	startPage -= 5;
	endPage -= 5;
}

function paging(paging){
	$(".paging a.aOn").removeClass('aOn');
	$(".paging").children().remove();
	$("#prev").parent().remove();
	$("#next").parent().remove();
	
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "../../admin/data/request_hotelMain.jsp?paging="+paging+"&recNum="+recNum, true);
	xhr.send();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
			$("#room_infor div").nextAll("ul").remove();
			$("#find_room").after("<ul class='clear2 on3'></ul>");
			
			let hotelList = xhr.responseText;
				
			hotelList = hotelList.replace('[','');
			hotelList = hotelList.replace(']','');
			
			let hotel = new Array();
			hotel = hotelList.split("null, ");
			for(let i=0; i<hotel.length; i++){
				let hotelInfor = new Array();
				hotelInfor = hotel[i].split("|");
				let h_idx = hotelInfor[0];
				h_idx = h_idx.trim();
				let h_file = hotelInfor[1];
				let h_name = hotelInfor[2];
				let h_address = hotelInfor[3];
				let h_map = hotelInfor[4];
				let h_discount = hotelInfor[5];
				
				if(h_discount == "O"){
					$("#room_infor ul").append("<li id="+h_idx+"><div class='room_img'></div><div class='room_content'><h3 class='room_name'>"+h_name+"</h3><p class='room_addr'>"+h_address+"</p><div class='room_btn'><a href='"+h_map+"' target='_blank'>지도보기</a></div></div><div class='room_discount'><span>20%</span> OFF</div></li>");
					$("#room_infor ul #"+h_idx+" .room_img").css("background", "url('../../images/room/"+h_file+"') center");
				}else if(h_discount == "X"){
					$("#room_infor ul").append("<li id="+h_idx+"><div class='room_img'></div><div class='room_content'><h3 class='room_name'>"+h_name+"</h3><p class='room_addr'>"+h_address+"</p><div class='room_btn'><a href='"+h_map+"' target='_blank'>지도보기</a></div></div></li>");
					$("#room_infor ul #"+h_idx+" .room_img").css("background", "url('../../images/room/"+h_file+"') center");
				}
			}
			totPage = totCnt / recNum;
			totPage = Math.floor(totPage);
			if(totCnt % recNum > 0){
				totPage++;
			}
			currentPage = paging;
			if(totPage < currentPage){
				currentPage = totPage;
			}
			start = ((currentPage-1) / 5) * 5 + 1;
			end = start + 4;
			if(end > totPage){
				end = totPage;
			}
			
			if(currentPage > 5){
				$(".paging").prepend("<div><a id='prev' onclick='minusPage()' href='javascript:paging("+(startPage-1)+")'><img src='../../images/ico/prev_btn.jpg' alt='이전'></a></div>");
			}else{
				$(".paging").prepend("<div><a id='prev' onclick='minusPage()' href='javascript:paging("+(startPage-1)+")'><img src='../../images/ico/prev_btn.jpg' alt='이전'></a></div>");
				$("#prev").css("visibility", "hidden");
			}
			
			if(currentPage < totPage){
				$(".paging").after("<div><a id='next' onclick='plusPage()' href='javascript:paging("+(endPage+1)+")'><img src='../../images/ico/next_btn.jpg' alt='다음'></a></div>");
			}
			
			for(let i=startPage; i<=endPage; i++){
				if(i == currentPage){
					switch(currentPage % 5){
						case 1:
							$(".paging").append("<a href='javascript:paging("+i+")'>"+i+"</a>");
							$(".paging").children("a:nth-child("+2+")").addClass("aOn");
							break;
						case 2:
							$(".paging").append("<a href='javascript:paging("+i+")'>"+i+"</a>");
							$(".paging").children("a:nth-child("+3+")").addClass("aOn");
							break;
						case 3:
							$(".paging").append("<a href='javascript:paging("+i+")'>"+i+"</a>");
							$(".paging").children("a:nth-child("+4+")").addClass("aOn");
							break;
						case 4:
							$(".paging").append("<a href='javascript:paging("+i+")'>"+i+"</a>");
							$(".paging").children("a:nth-child("+5+")").addClass("aOn");
							break;
						case 0:
							$(".paging").append("<a href='javascript:paging("+i+")'>"+i+"</a>");
							$(".paging").children("a:nth-child("+6+")").addClass("aOn");
							break;						
					}
				}else{
					$(".paging").append("<a href='javascript:paging("+i+")'>"+i+"</a>");
				}
			}
			
			if(totPage >= startPage && totPage <= endPage){
				$("#next").remove();
				let lastPage;
				
				switch(currentPage){
					case totPage :
						lastPage = currentPage % 5;
						break;
					case totPage-1 :
						lastPage = (currentPage % 5) + 1;
						break;
					case totPage-2 :
						lastPage = (currentPage % 5) + 2;
						break;
					case totPage-3 :
						lastPage = (currentPage % 5) + 3;
						break;
					case totPage-4 :
						lastPage = (currentPage % 5) + 4;
						break;
				}
				$(".paging").children("a:nth-child("+(lastPage+1)+")").nextAll().remove();
			}			
		}
	}
}

function find(){
	startPage = 1;
	endPage = 5;
	$(".paging a.aOn").removeClass('aOn');
	$(".paging").children().remove();
	$("#prev").parent().remove();
	$("#next").parent().remove();
	
	$("#room_infor h2").remove();
	
	let h_name = $("#find_room input").val();
	
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "../../admin/data/request_hotelMain.jsp?hName="+h_name, true);
	xhr.send();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
			totCnt = xhr.responseText.trim();
			
			let xhr2 = new XMLHttpRequest();
			xhr2.open("GET", "../../admin/data/request_hotelMain.jsp?hName="+h_name+"&start="+1+"&recNum="+recNum, true);
			xhr2.send();
			
			xhr2.onreadystatechange = function(){
				if(xhr2.readyState == XMLHttpRequest.DONE && xhr2.status == 200){
					$("#room_infor div").nextAll("ul").remove();
					$("#find_room").after("<ul class='clear2 on3'></ul>");
					if(xhr2.responseText.trim() == '[]'){
						$("#room_infor h2").remove();
						$("#room_infor ul").after("<h2>'"+h_name+"' 검색된 숙소가 없습니다.</h2>").remove();
						$("#room_infor h2").css("text-align", "center");
					}else{
						let hotelList = xhr2.responseText;
						
						hotelList = hotelList.replace('[','');
						hotelList = hotelList.replace(']','');
						
						let hotel = new Array();
						hotel = hotelList.split("null, ");
						for(let i=0; i<hotel.length; i++){
							let hotelInfor = new Array();
							hotelInfor = hotel[i].split("|");
							let h_idx = hotelInfor[0];
							h_idx = h_idx.trim();
							let h_file = hotelInfor[1];
							let h_name = hotelInfor[2];
							let h_address = hotelInfor[3];
							let h_map = hotelInfor[4];
							let h_discount = hotelInfor[5];
							
							if(h_discount == "O"){
								$("#room_infor ul").append("<li id="+h_idx+"><div class='room_img'></div><div class='room_content'><h3 class='room_name'>"+h_name+"</h3><p class='room_addr'>"+h_address+"</p><div class='room_btn'><a href='"+h_map+"' target='_blank'>지도보기</a></div></div><div class='room_discount'><span>20%</span> OFF</div></li>");
								$("#room_infor ul #"+h_idx+" .room_img").css("background", "url('../../images/room/"+h_file+"') center");
							}else if(h_discount == "X"){
								$("#room_infor ul").append("<li id="+h_idx+"><div class='room_img'></div><div class='room_content'><h3 class='room_name'>"+h_name+"</h3><p class='room_addr'>"+h_address+"</p><div class='room_btn'><a href='"+h_map+"' target='_blank'>지도보기</a></div></div></li>");
								$("#room_infor ul #"+h_idx+" .room_img").css("background", "url('../../images/room/"+h_file+"') center");
							}
						}
						
						totPage = totCnt / recNum;
						totPage = Math.floor(totPage);
						if(totCnt % recNum > 0){
							totPage++;
						}
						currentPage = 1;
						if(totPage < currentPage){
							currentPage = totPage;
						}
						start = ((currentPage-1) / 5) * 5 + 1;
						end = start + 4;
						if(end > totPage){
							end = totPage;
						}
						
						$(".paging").prepend("<div><a id='prev' onclick='minusPage()' href='javascript:findPaging("+(currentPage-1)+", "+totCnt+", `"+h_name+"`)'><img src='../../images/ico/prev_btn.jpg' alt='이전'></a></div>");
						$("#prev").css("visibility", "hidden");
							
						for(let i=startPage; i<=endPage; i++){
							if(i == currentPage){
								$(".paging").append("<a href='javascript:findPaging("+i+", "+totCnt+", `"+h_name+"`)'>"+i+"</a>");
								$(".paging a").addClass("aOn");
							}else{
								$(".paging").append("<a href='javascript:findPaging("+i+", "+totCnt+", `"+h_name+"`)'>"+i+"</a>");
							}
						}
						
						if(totPage > 5){
							$(".paging").append("<div><a id='next' onclick='plusPage()' href='javascript:findPaging("+(endPage+1)+", "+totCnt+", `"+h_name+"`)'><img src='../../images/ico/next_btn.jpg' alt='다음'></a></div>");
						}
						
						if(totPage >= startPage && totPage <= endPage){
							$("#next").remove();
							let lastPage;
							
							switch(currentPage){
								case totPage :
									lastPage = currentPage % 5;
									break;
								case totPage-1 :
									lastPage = (currentPage % 5) + 1;
									break;
								case totPage-2 :
									lastPage = (currentPage % 5) + 2;
									break;
								case totPage-3 :
									lastPage = (currentPage % 5) + 3;
									break;
								case totPage-4 :
									lastPage = (currentPage % 5) + 4;
									break;
							}
							$(".paging").children("a:nth-child("+(lastPage+1)+")").nextAll().remove();
						}
					}
				}
			}
		}
	}
}

function findPaging(paging, totalCnt, hName){
	$(".paging a.aOn").removeClass('aOn');
	$(".paging").children().remove();
	$("#prev").parent().remove();
	$("#next").parent().remove();
	
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "../../admin/data/request_hotelMain.jsp?hName="+hName+"&start="+paging+"&recNum="+recNum, true);
	xhr.send();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
			$("#room_infor div").nextAll("ul").remove();
			$("#find_room").after("<ul class='clear2 on3'></ul>");
			
			let hotelList = xhr.responseText;
				
			hotelList = hotelList.replace('[','');
			hotelList = hotelList.replace(']','');
			
			let hotel = new Array();
			hotel = hotelList.split("null, ");
			for(let i=0; i<hotel.length; i++){
				let hotelInfor = new Array();
				hotelInfor = hotel[i].split("|");
				let h_idx = hotelInfor[0];
				h_idx = h_idx.trim();
				let h_file = hotelInfor[1];
				let h_name = hotelInfor[2];
				let h_address = hotelInfor[3];
				let h_map = hotelInfor[4];
				let h_discount = hotelInfor[5];
				
				if(h_discount == "O"){
					$("#room_infor ul").append("<li id="+h_idx+"><div class='room_img'></div><div class='room_content'><h3 class='room_name'>"+h_name+"</h3><p class='room_addr'>"+h_address+"</p><div class='room_btn'><a href='"+h_map+"' target='_blank'>지도보기</a></div></div><div class='room_discount'><span>20%</span> OFF</div></li>");
					$("#room_infor ul #"+h_idx+" .room_img").css("background", "url('../../images/room/"+h_file+"') center");
				}else if(h_discount == "X"){
					$("#room_infor ul").append("<li id="+h_idx+"><div class='room_img'></div><div class='room_content'><h3 class='room_name'>"+h_name+"</h3><p class='room_addr'>"+h_address+"</p><div class='room_btn'><a href='"+h_map+"' target='_blank'>지도보기</a></div></div></li>");
					$("#room_infor ul #"+h_idx+" .room_img").css("background", "url('../../images/room/"+h_file+"') center");
				}
			}
			
			totCnt = totalCnt;
			totPage = totCnt / recNum;
			totPage = Math.floor(totPage);
			if(totCnt % recNum > 0){
				totPage++;
			}
			currentPage = paging;
			if(totPage < currentPage){
				currentPage = totPage;
			}
			start = ((currentPage-1) / 5) * 5 + 1;
			end = start + 4;
			if(end > totPage){
				end = totPage;
			}
			
			if(currentPage > 5){
				$(".paging").prepend("<div><a id='prev' onclick='minusPage()' href='javascript:findPaging("+(startPage-1)+", "+totCnt+", `"+hName+"`)'><img src='../../images/ico/prev_btn.jpg' alt='이전'></a></div>");
			}else{
				$(".paging").prepend("<div><a id='prev' onclick='minusPage()' href='javascript:findPaging("+(startPage-1)+", "+totCnt+", `"+hName+"`)'><img src='../../images/ico/prev_btn.jpg' alt='이전'></a></div>");
				$("#prev").css("visibility", "hidden");
			}
			
			if(currentPage < totPage){
				$(".paging").after("<div><a id='next' onclick='plusPage()' href='javascript:findPaging("+(endPage+1)+", "+totCnt+", `"+hName+"`)'><img src='../../images/ico/next_btn.jpg' alt='다음'></a></div>");
			}
			
			for(let i=startPage; i<=endPage; i++){
				if(i == currentPage){
					switch(currentPage % 5){
						case 1:
							$(".paging").append("<a href='javascript:findPaging("+i+", "+totCnt+", `"+hName+"`)'>"+i+"</a>");
							$(".paging").children("a:nth-child("+2+")").addClass("aOn");
							break;
						case 2:
							$(".paging").append("<a href='javascript:findPaging("+i+", "+totCnt+", `"+hName+"`)'>"+i+"</a>");
							$(".paging").children("a:nth-child("+3+")").addClass("aOn");
							break;
						case 3:
							$(".paging").append("<a href='javascript:findPaging("+i+", "+totCnt+", `"+hName+"`)'>"+i+"</a>");
							$(".paging").children("a:nth-child("+4+")").addClass("aOn");
							break;
						case 4:
							$(".paging").append("<a href='javascript:findPaging("+i+", "+totCnt+", `"+hName+"`)'>"+i+"</a>");
							$(".paging").children("a:nth-child("+5+")").addClass("aOn");
							break;
						case 0:
							$(".paging").append("<a href='javascript:findPaging("+i+", "+totCnt+", `"+hName+"`)'>"+i+"</a>");
							$(".paging").children("a:nth-child("+6+")").addClass("aOn");
							break;						
					}
				}else{
					$(".paging").append("<a href='javascript:findPaging("+i+", "+totCnt+", `"+hName+"`)'>"+i+"</a>");
				}
			}
			
			if(totPage >= startPage && totPage <= endPage){
				$("#next").remove();
				let lastPage;
				
				switch(currentPage){
					case totPage :
						lastPage = currentPage % 5;
						break;
					case totPage-1 :
						lastPage = (currentPage % 5) + 1;
						break;
					case totPage-2 :
						lastPage = (currentPage % 5) + 2;
						break;
					case totPage-3 :
						lastPage = (currentPage % 5) + 3;
						break;
					case totPage-4 :
						lastPage = (currentPage % 5) + 4;
						break;
				}
				$(".paging").children("a:nth-child("+(lastPage+1)+")").nextAll().remove();
			}			
		}
	}
}