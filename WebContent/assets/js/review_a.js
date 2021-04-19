function review_d(reIdx, reBookidx) {
	
	let re_idx = $(".review_detail input[id=re_idx]").val();
	$(".content .review_detail").removeClass('off');
	if(re_idx == reIdx) {
		$(".content .review_detail").addClass('off');
	}
	
	var xhr = new XMLHttpRequest();
	var url = "../admin/data/review_ok.jsp?re_idx=" + reIdx + "&re_bookidx=" + reBookidx;
	xhr.open("GET", url, true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
			let reviewInfo = new Array();
			reviewInfo = xhr.responseText.split("|");
			let re_num = reviewInfo[0];
			let re_score = reviewInfo[1];
			let re_title = reviewInfo[2];
			let re_content = reviewInfo[3];
			let re_writedate = reviewInfo[4];
			let re_hidden = reviewInfo[5];
			let re_writer = reviewInfo[6];
			let re_route = reviewInfo[7] + " → " + reviewInfo[8];

			$("#re_idx").val(re_num);
			$("#re_num").html(re_num);
			$("#re_score").html(re_score);
			$("#re_title").html(re_title);
			$("#re_content").html(re_content);
			$("#re_writedate").html(re_writedate);
			if(re_hidden.trim() == "x") {
				$("input:radio[id='re_hidden_n']").prop("checked", true);
			} 
			else if(re_hidden.trim() == "o"){
				$("input:radio[id='re_hidden_y']").prop("checked", true);
			}
			$("#re_writer").html(re_writer);
			$("#re_route").html(re_route);
		}
	}
}