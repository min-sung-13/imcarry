let totCnt = $("#totCnt").val();	// 전체 게시물 수
let recNum = 12;	// 한 페이지당 보여줄 개수
let currentPage = 1;	// 현재 페이지
let end = currentPage + 4;
let start = end - 4;	// 시작 페이지 번호
let totPage = totCnt / recNum;	// 총 페이지 수
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
	if($("#h_idx").val() == "0"){
		
		$(".hIdxO").css("display", "none");
		$(".hIdxX").css("display", "block");
	}
	
	$(".paging").prepend("<div><a id='prev' onclick='minusPage()' href='javascript:paging("+(currentPage-1)+")'>&lt;</a></div>");
	$("#prev").css("visibility", "hidden");
		
	for(let i=startPage; i<=endPage; i++){
		if(i == currentPage){
			$(".paging").append("<a href='javascript:paging("+i+")'>"+i+"</a>");
			$(".paging a").addClass("on");
		}else{
			$(".paging").append("<a href='javascript:paging("+i+")'>"+i+"</a>");
		}
	}
	
	if(totPage > 5){
		$(".paging").append("<div><a id='next' onclick='plusPage()' href='javascript:paging("+(endPage+1)+")'>&gt;</a></div>");
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
});

function checkform(){
	if($("#h_file1").val() == ""){
		if($("#h_fileoriginname").val() == ""){
			alert("파일을 선택해주세요.");
			return false;
		}
	}
	
	if($("#h_name").val() == ""){
		alert("이름을 입력해주세요.");
		$("#h_name").focus();
		return false;
	}
	
	if($("#h_address").val() == ""){
		alert("주소를 입력해주세요.");
		$("#h_address").focus();
		return false;
	}
	
	if($("#h_map").val() == ""){
		alert("지도를 입력해주세요.");
		$("#h_map").focus();
		return false;
	}
	
	return true;
}

function findHotel(hIdx){
	$(".paging a.on").removeClass('on');
	
	$(".hIdxO").css("display", "block");
	$(".hIdxX").css("display", "none");
	
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "./data/request_hotel.jsp?hIdx="+hIdx, true);
	
	xhr.send();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
			let hotelInfor = new Array();
			hotelInfor = xhr.responseText.trim().split("|");
			let h_idx = hotelInfor[0];
			let h_file = hotelInfor[1];
			let h_name = hotelInfor[2];
			let h_address = hotelInfor[3];
			let h_map = hotelInfor[4];
			let h_discount = hotelInfor[5];
			let h_partner = hotelInfor[6];
			
			$("#h_idx").val(hIdx);
			$("#h_name").val(h_name);
			$("#h_address").val(h_address);
			$("#h_map").val(h_map);
			$("#h_fileoriginname").val(h_file);
			document.getElementById("fileoriginname").innerHTML = h_file;
			
			if(h_discount.trim() == 'O'){
				$("input:radio[name='h_discount']:radio[value='O']").prop('checked', true);
			}else if(h_discount.trim() == 'X'){
				$("input:radio[name='h_discount']:radio[value='X']").prop('checked', true);
			}
			if(h_partner.trim() == 'O'){
				$("input:radio[name='h_partner']:radio[value='O']").prop('checked', true);
			}else if(h_partner.trim() == 'X'){
				$("input:radio[name='h_partner']:radio[value='X']").prop('checked', true);
			}
		}
	}
}

function resetInfor(){
	$("#h_idx").val("0");
	$("#h_name").val("");
	$("#h_address").val("");
	$("#h_map").val("");
	$("#h_fileoriginname").val("");
	document.getElementById("fileoriginname").innerHTML = "";
	
	$(".hIdxO").css("display", "none");
	$(".hIdxX").css("display", "block");
}

function paging(paging){	
	$(".paging a.on").removeClass('on');
	$(".paging").children().remove();
	$("#prev").parent().remove();
	$("#next").parent().remove();	
	
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "./data/request_hotel.jsp?paging="+paging+"&recNum="+recNum, true);
	xhr.send();	
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
			$("table tr:first-child").nextAll("tr").remove();
			
			let hotelList = xhr.responseText;
				
			hotelList = hotelList.replace('[','');
			hotelList = hotelList.replace(']','');
				
			let hotel = new Array();
			hotel = hotelList.split(", ");
			for(let i=0; i<hotel.length; i++){
				let hotelInfor = new Array();
				hotelInfor = hotel[i].split("|");
				let h_idx = hotelInfor[0];
				let h_name = hotelInfor[2];
				let h_discount = hotelInfor[5];
				let h_partner = hotelInfor[6];
				
				$("tr:last-child").after("<tr><td>"+(i+1)+"</td><td><a href='javascript:findHotel("+h_idx+")'>"+h_name+"</a></td><td>"+h_discount+"</td><td>"+h_partner+"</td></tr>");
			}
			
			$("tr:last-child").after("<tr><td  colspan='4' id='page' class='paging'></td></tr>");
			
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
				$(".paging").prepend("<div><a id='prev' onclick='minusPage()' href='javascript:paging("+(startPage-1)+")'>&lt;</a></div>");
			}else{
				$(".paging").prepend("<div><a id='prev' onclick='minusPage()' href='javascript:paging("+(startPage-1)+")'>&lt;</a></div>");
				$("#prev").css("visibility", "hidden");
			}
			
			if(currentPage < totPage){
				$(".paging").after("<div><a id='next' onclick='plusPage()' href='javascript:paging("+(endPage+1)+")'>&gt;</a></div>");
			}
			
			for(let i=startPage; i<=endPage; i++){
				if(i == currentPage){
					switch(currentPage % 5){
						case 1:
							$(".paging").append("<a href='javascript:paging("+i+")'>"+i+"</a>");
							$(".paging").children("a:nth-child("+2+")").addClass("on");
							break;
						case 2:
							$(".paging").append("<a href='javascript:paging("+i+")'>"+i+"</a>");
							$(".paging").children("a:nth-child("+3+")").addClass("on");
							break;
						case 3:
							$(".paging").append("<a href='javascript:paging("+i+")'>"+i+"</a>");
							$(".paging").children("a:nth-child("+4+")").addClass("on");
							break;
						case 4:
							$(".paging").append("<a href='javascript:paging("+i+")'>"+i+"</a>");
							$(".paging").children("a:nth-child("+5+")").addClass("on");
							break;
						case 0:
							$(".paging").append("<a href='javascript:paging("+i+")'>"+i+"</a>");
							$(".paging").children("a:nth-child("+6+")").addClass("on");
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
	$(".paging a.on").removeClass('on');
	$(".paging").children().remove();
	$("#prev").parent().remove();
	$("#next").parent().remove();
	
	$("#room_infor h2").remove();
	
	let h_name = $("#find_hotel").val();
	
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "./data/request_hotel.jsp?hName="+h_name, true);
	xhr.send();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
			totCnt = xhr.responseText.trim();
			
			let xhr2 = new XMLHttpRequest();
			xhr2.open("GET", "./data/request_hotel.jsp?hName="+h_name+"&start="+1+"&recNum="+recNum, true);
			xhr2.send();
			
			xhr2.onreadystatechange = function(){
				if(xhr2.readyState == XMLHttpRequest.DONE && xhr2.status == 200){
					$("table tr:first-child").nextAll("tr").remove();
					
					if(xhr.responseText.trim() == '[]'){
						$("tr:last-child").after("<tr><td colspan='4'>검색 결과가 없습니다.</td></tr>");
					}else{
						let hotelList = xhr2.responseText;
						
						hotelList = hotelList.replace('[','');
						hotelList = hotelList.replace(']','');
						
						console.log(hotelList);
						
						let hotel = new Array();
						hotel = hotelList.split(", ");
						for(let i=0; i<hotel.length; i++){
							let hotelInfor = new Array();
							hotelInfor = hotel[i].split("|");
							let h_idx = hotelInfor[0];
							let h_name = hotelInfor[2];
							let h_discount = hotelInfor[5];
							let h_partner = hotelInfor[6];
							
							$("tr:last-child").after("<tr><td>"+(i+1)+"</td><td><a href='javascript:findHotel("+h_idx+")'>"+h_name+"</a></td><td>"+h_discount+"</td><td>"+h_partner+"</td></tr>");
						}
						$("tr:last-child").after("<tr><td  colspan='4' id='page' class='paging'></td></tr>");
						
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
						
						if(currentPage > 5){
							$(".paging").prepend("<div><a id='prev' onclick='minusPage()' href='javascript:findPaging("+(startPage-1)+", "+totCnt+", `"+h_name+"`)'>&lt;</a></div>");
						}else{
							$(".paging").prepend("<div><a id='prev' onclick='minusPage()' href='javascript:findPaging("+(startPage-1)+", "+totCnt+", `"+h_name+"`)'>&lt;</a></div>");
							$("#prev").css("visibility", "hidden");
						}
						
						if(currentPage < totPage){
							$(".paging").after("<div><a id='next' onclick='plusPage()' href='javascript:findPaging("+(endPage+1)+", "+totCnt+", `"+h_name+"`)'>&gt;</a></div>");
						}
						
						for(let i=startPage; i<=endPage; i++){
							if(i == currentPage){
								switch(currentPage % 5){
									case 1:
										$(".paging").append("<a href='javascript:findPaging("+i+", "+totCnt+", `"+h_name+"`)'>"+i+"</a>");
										$(".paging").children("a:nth-child("+2+")").addClass("on");
										break;
									case 2:
										$(".paging").append("<a href='javascript:findPaging("+i+", "+totCnt+", `"+h_name+"`)'>"+i+"</a>");
										$(".paging").children("a:nth-child("+3+")").addClass("on");
										break;
									case 3:
										$(".paging").append("<a href='javascript:findPaging("+i+", "+totCnt+", `"+h_name+"`)'>"+i+"</a>");
										$(".paging").children("a:nth-child("+4+")").addClass("on");
										break;
									case 4:
										$(".paging").append("<a href='javascript:findPaging("+i+", "+totCnt+", `"+h_name+"`)'>"+i+"</a>");
										$(".paging").children("a:nth-child("+5+")").addClass("on");
										break;
									case 0:
										$(".paging").append("<a href='javascript:findPaging("+i+", "+totCnt+", `"+h_name+"`)'>"+i+"</a>");
										$(".paging").children("a:nth-child("+6+")").addClass("on");
										break;						
								}
							}else{
								$(".paging").append("<a href='javascript:findPaging("+i+", "+totCnt+", `"+h_name+"`)'>"+i+"</a>");
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
		}
	}
}

function findPaging(paging, totalCnt, hName){
	$(".paging a.on").removeClass('on');
	$(".paging").children().remove();
	$("#prev").parent().remove();
	$("#next").parent().remove();
	
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "./data/request_hotel.jsp?hName="+hName+"&start="+paging+"&recNum="+recNum, true);
	xhr.send();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
			$("table tr:first-child").nextAll("tr").remove();
			
			let hotelList = xhr.responseText;
				
			hotelList = hotelList.replace('[','');
			hotelList = hotelList.replace(']','');
				
			let hotel = new Array();
			hotel = hotelList.split(", ");
			for(let i=0; i<hotel.length; i++){
				let hotelInfor = new Array();
				hotelInfor = hotel[i].split("|");
				let h_idx = hotelInfor[0];
				let h_name = hotelInfor[2];
				let h_discount = hotelInfor[5];
				let h_partner = hotelInfor[6];
				
				$("tr:last-child").after("<tr><td>"+(i+1)+"</td><td><a href='javascript:findHotel("+h_idx+")'>"+h_name+"</a></td><td>"+h_discount+"</td><td>"+h_partner+"</td></tr>");
			}
			
			$("tr:last-child").after("<tr><td  colspan='4' id='page' class='paging'></td></tr>");
			
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
				$(".paging").prepend("<div><a id='prev' onclick='minusPage()' href='javascript:findPaging("+(startPage-1)+", "+totCnt+", `"+hName+"`)'>&lt;</a></div>");
			}else{
				$(".paging").prepend("<div><a id='prev' onclick='minusPage()' href='javascript:findPaging("+(startPage-1)+", "+totCnt+", `"+hName+"`)'>&lt;</a></div>");
				$("#prev").css("visibility", "hidden");
			}
			
			if(currentPage < totPage){
				$(".paging").after("<div><a id='next' onclick='plusPage()' href='javascript:findPaging("+(endPage+1)+", "+totCnt+", `"+hName+"`)'>&gt;</a></div>");
			}
			
			for(let i=startPage; i<=endPage; i++){
				if(i == currentPage){
					switch(currentPage % 5){
						case 1:
							$(".paging").append("<a href='javascript:findPaging("+i+", "+totCnt+", `"+hName+"`)'>"+i+"</a>");
							$(".paging").children("a:nth-child("+2+")").addClass("on");
							break;
						case 2:
							$(".paging").append("<a href='javascript:findPaging("+i+", "+totCnt+", `"+hName+"`)'>"+i+"</a>");
							$(".paging").children("a:nth-child("+3+")").addClass("on");
							break;
						case 3:
							$(".paging").append("<a href='javascript:findPaging("+i+", "+totCnt+", `"+hName+"`)'>"+i+"</a>");
							$(".paging").children("a:nth-child("+4+")").addClass("on");
							break;
						case 4:
							$(".paging").append("<a href='javascript:findPaging("+i+", "+totCnt+", `"+hName+"`)'>"+i+"</a>");
							$(".paging").children("a:nth-child("+5+")").addClass("on");
							break;
						case 0:
							$(".paging").append("<a href='javascript:findPaging("+i+", "+totCnt+", `"+hName+"`)'>"+i+"</a>");
							$(".paging").children("a:nth-child("+6+")").addClass("on");
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
	
function list(){
	if($("#find_hotel").val() == null || $("#find_hotel").val() == ""){
		
	}else{
		location.reload();
	}
}